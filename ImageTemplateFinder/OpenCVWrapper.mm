//
//  OpenCVWrapper.m
//  ImageTemplateFinder
//
//  Created by Stefan Szarek on 18/04/2019.
//  Copyright © 2019 Stefan Szarek. All rights reserved.
//

#ifdef __cplusplus
#import <opencv2/opencv.hpp>
#endif

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>
#import <CoreGraphics/CoreGraphics.h>
#import "ImageTemplateFinder-Swift.h"

#import "OpenCVWrapper.h"

using namespace cv;

@implementation OpenCVWrapper
+ (NSString *) openCVVersion {
    return [NSString stringWithFormat:@"OpenCV version: %s", CV_VERSION];
}

+ (cv::Mat) convertNSImageToMat: (CGImageRef) image {
    CGColorSpaceRef colorSpace = CGImageGetColorSpace(image);
    CGFloat cols = CGImageGetWidth(image);
    CGFloat rows = CGImageGetHeight(image);
    
    cv::Mat cvMat(rows, cols, CV_8UC4);
    
    CGContextRef contextRef = CGBitmapContextCreate(cvMat.data, cols, rows, 8, cvMat.step[0], colorSpace, kCGImageAlphaNoneSkipLast | kCGBitmapByteOrderDefault);
    CGContextDrawImage(contextRef, CGRectMake(0,0, cols, rows), image);
    CGContextRelease(contextRef);
    
    return cvMat;
}

+(FindTemplateResult *) findTemplate: (CGImageRef)image :(CGImageRef)templ :(NSString*)method {
    cv::Mat outputMat = cv::Mat();
    cv::Mat imgMat = [self convertNSImageToMat:(image)];
    cv::Mat templMat = [self convertNSImageToMat:(templ)];

    cv::matchTemplate(imgMat, templMat, outputMat, [self mapMethodType: method]);
    
    double minValue, maxValue;
    cv::Point minLoc, maxLoc;
    cv::minMaxLoc(outputMat, &minValue, &maxValue, &minLoc, &maxLoc);
    FindTemplateResult* result = [[FindTemplateResult alloc] initWithXCoord:maxLoc.x yCoord:maxLoc.y];
    
    return result;
}

+ (int) mapMethodType: (NSString*)method {
    if ([method isEqualToString:@"TM_CCOEFF"]) {
        return cv::TM_CCOEFF;
    } else if ([method isEqualToString:@"TM_CCOEFF_NORMED"]) {
        return cv::TM_CCOEFF_NORMED;
    } else if ([method isEqualToString:@"TM_CCORR"]) {
        return cv::TM_CCORR;
    } else if ([method isEqualToString:@"TM_CCORR_NORMED"]) {
        return cv::TM_CCORR_NORMED;
    } else if ([method isEqualToString:@"TM_SQDIFF"]) {
        return cv::TM_SQDIFF;
    } else if ([method isEqualToString:@"TM_SQDIFF_NORMED"]) {
        return cv::TM_SQDIFF_NORMED;
    } else {
        return -1;
    }
}
@end
