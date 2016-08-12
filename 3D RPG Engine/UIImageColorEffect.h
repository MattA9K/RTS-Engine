//
//  UIImageColorEffect.h
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 8/9/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageColorEffect : NSObject

-(UIImage*) imageByReplacingColor:(UIColor*)sourceColor inTheImage:(UIImage*)image withMinTolerance:(CGFloat)minTolerance withMaxTolerance:(CGFloat)maxTolerance withColor:(UIColor*)destinationColor;

- (UIImage*) replaceColor:(UIColor*)color inImage:(UIImage*)image withTolerance:(float)tolerance;

- (UIImage *)changeWhiteColorTransparent: (UIImage *)image;

- (UIImage *)resizeImage:(UIImage*)image newSize:(CGSize)newSize;

@end
