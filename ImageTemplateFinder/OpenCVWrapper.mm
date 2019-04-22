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

@implementation OpenCVWrapper
+ (NSString *) openCVVersion {
    return [NSString stringWithFormat:@"OpenCV version: %s", CV_VERSION];
}
@end
