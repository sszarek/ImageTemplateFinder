//
//  OpenCVWrapper.h
//  ImageTemplateFinder
//
//  Created by Stefan Szarek on 18/04/2019.
//  Copyright © 2019 Stefan Szarek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import "ImageTemplateFinder-Swift.h"

#ifdef __cplusplus
#import <opencv2/opencv.hpp>
#endif

NS_ASSUME_NONNULL_BEGIN

@interface OpenCVWrapper : NSObject
+(NSString *) openCVVersion;
+(FindTemplateResult*) findTemplate: (CGImageRef)image :(CGImageRef)templ :(NSString*)method;
@end

NS_ASSUME_NONNULL_END
