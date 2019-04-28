//
//  OpenCVWrapper.m
//  ImageTemplateFinder
//
//  Created by Stefan Szarek on 18/04/2019.
//  Copyright © 2019 Stefan Szarek. All rights reserved.
//

#import "OpenCVWrapper.h"

#ifdef __cplusplus
#import <opencv2/opencv.hpp>
#endif

using namespace cv;

@implementation OpenCVWrapper
+ (NSString *) openCVVersion {
    return [NSString stringWithFormat:@"OpenCV version: %s", CV_VERSION];
}

+ (void) findTemplate: (NSString*)imgPath :(NSString*)templPath :(NSString*)method {
    cv::OutputArray result = cv::_OutputArray();
    cv::Mat image = cv::imread(imgPath.UTF8String);
    cv::Mat templ = cv::imread(templPath.UTF8String);
    
    InputArray imInput = cv::_InputArray(image);
    InputArray templInput = cv::_InputArray(image);
    
    cv::matchTemplate(imInput, templInput, result, [self mapMethodType: method]);
}

+ (cv::_OutputArray) templateFinder:(InputArray)image :(InputArray)templ :(NSString*) method {
    cv::OutputArray result = cv::_OutputArray();
    cv::matchTemplate(image, templ, result, [self mapMethodType: method]);
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
