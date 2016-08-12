//
//  UIImageColorEffect.m
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 8/9/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

#import "UIImageColorEffect.h"

@implementation UIImageColorEffect

- (id)init
{
    self = [super init];
    if (self)
    {
        // superclass successfully initialized, further
        // initialization happens here ...
    }
    return self;
}

-(UIImage*) imageByReplacingColor:(UIColor*)sourceColor inTheImage:(UIImage*)image withMinTolerance:(CGFloat)minTolerance withMaxTolerance:(CGFloat)maxTolerance withColor:(UIColor*)destinationColor {
    
    // components of the source color
    const CGFloat* sourceComponents = CGColorGetComponents(sourceColor.CGColor);
    UInt8* source255Components = malloc(sizeof(UInt8)*4);
    for (int i = 0; i < 4; i++) source255Components[i] = (UInt8)round(sourceComponents[i]*255.0);
    
    // components of the destination color
    const CGFloat* destinationComponents = CGColorGetComponents(destinationColor.CGColor);
    UInt8* destination255Components = malloc(sizeof(UInt8)*4);
    for (int i = 0; i < 4; i++) destination255Components[i] = (UInt8)round(destinationComponents[i]*255.0);
    
    // raw image reference
    CGImageRef rawImage = image.CGImage;
    
    // image attributes
    size_t width = CGImageGetWidth(rawImage);
    size_t height = CGImageGetHeight(rawImage);
    CGRect rect = {CGPointZero, {width, height}};
    
    // bitmap format
    size_t bitsPerComponent = 8;
    size_t bytesPerRow = width*4;
    CGBitmapInfo bitmapInfo = kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big;
    
    // data pointer
    UInt8* data = calloc(bytesPerRow, height);
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    // create bitmap context
    CGContextRef ctx = CGBitmapContextCreate(data, width, height, bitsPerComponent, bytesPerRow, colorSpace, bitmapInfo);
    CGContextDrawImage(ctx, rect, rawImage);
    
    // loop through each pixel's components
    for (int byte = 0; byte < bytesPerRow*height; byte += 4) {
        
        UInt8 r = data[byte];
        UInt8 g = data[byte+1];
        UInt8 b = data[byte+2];
        
        // delta components
        UInt8 dr = abs(r-source255Components[0]);
        UInt8 dg = abs(g-source255Components[1]);
        UInt8 db = abs(b-source255Components[2]);
        
        // ratio of 'how far away' each component is from the source color
        CGFloat ratio = (dr+dg+db)/(255.0*3.0);
        if (ratio > maxTolerance) ratio = 1; // if ratio is too far away, set it to max.
        if (ratio < minTolerance) ratio = 0; // if ratio isn't far enough away, set it to min.
        
        // blend color components
        data[byte] = (UInt8)round(ratio*r)+(UInt8)round((1.0-ratio)*destination255Components[0]);
        data[byte+1] = (UInt8)round(ratio*g)+(UInt8)round((1.0-ratio)*destination255Components[1]);
        data[byte+2] = (UInt8)round(ratio*b)+(UInt8)round((1.0-ratio)*destination255Components[2]);
        
    }
    
    // get image from context
    CGImageRef img = CGBitmapContextCreateImage(ctx);
    
    // clean up
    CGContextRelease(ctx);
    CGColorSpaceRelease(colorSpace);
    free(data);
    free(source255Components);
    free(destination255Components);
    
    UIImage* returnImage = [UIImage imageWithCGImage:img];
    CGImageRelease(img);
    
    return returnImage;
}


- (UIImage*) replaceColor:(UIColor*)color inImage:(UIImage*)image withTolerance:(float)tolerance {
    CGImageRef imageRef = [image CGImage];
    
    NSUInteger width = CGImageGetWidth(imageRef);
    NSUInteger height = CGImageGetHeight(imageRef);
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    NSUInteger bytesPerPixel = 4;
    NSUInteger bytesPerRow = bytesPerPixel * width;
    NSUInteger bitsPerComponent = 8;
    NSUInteger bitmapByteCount = bytesPerRow * height;
    
    unsigned char *rawData = (unsigned char*) calloc(bitmapByteCount, sizeof(unsigned char));
    
    CGContextRef context = CGBitmapContextCreate(rawData, width, height,
                                                 bitsPerComponent, bytesPerRow, colorSpace,
                                                 kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big);
    CGColorSpaceRelease(colorSpace);
    
    CGContextDrawImage(context, CGRectMake(0, 0, width, height), imageRef);
    
    CGColorRef cgColor = [color CGColor];
    const CGFloat *components = CGColorGetComponents(cgColor);
    float r = components[0];
    float g = components[1];
    float b = components[2];
    //float a = components[3]; // not needed
    
    r = r * 255.0;
    g = g * 255.0;
    b = b * 255.0;
    
    const float redRange[2] = {
        MAX(r - (tolerance / 2.0), 0.0),
        MIN(r + (tolerance / 2.0), 255.0)
    };
    
    const float greenRange[2] = {
        MAX(g - (tolerance / 2.0), 0.0),
        MIN(g + (tolerance / 2.0), 255.0)
    };
    
    const float blueRange[2] = {
        MAX(b - (tolerance / 2.0), 0.0),
        MIN(b + (tolerance / 2.0), 255.0)
    };
    
    int byteIndex = 0;
    
    while (byteIndex < bitmapByteCount) {
        unsigned char red   = rawData[byteIndex];
        unsigned char green = rawData[byteIndex + 1];
        unsigned char blue  = rawData[byteIndex + 2];
        
        if (((red >= redRange[0]) && (red <= redRange[1])) &&
            ((green >= greenRange[0]) && (green <= greenRange[1])) &&
            ((blue >= blueRange[0]) && (blue <= blueRange[1]))) {
            // make the pixel transparent
            //
            rawData[byteIndex] = 0;
            rawData[byteIndex + 1] = 0;
            rawData[byteIndex + 2] = 0;
            rawData[byteIndex + 3] = 0;
        }
        
        byteIndex += 4;
    }
    
    CGImageRef imgref = CGBitmapContextCreateImage(context);
    UIImage *result = [UIImage imageWithCGImage:imgref];
    
    CGImageRelease(imgref);
    CGContextRelease(context);
    free(rawData);
    
    return result;
}

-(UIImage *)changeWhiteColorTransparent: (UIImage *)image {
    CGImageRef rawImageRef = image.CGImage;
    
    const CGFloat colorMasking[6] = {
        34.0, 255.0,
        138.0, 255.0,
        0.0, 255.0
    };
    
    UIGraphicsBeginImageContext(image.size);
    CGImageRef maskedImageRef=CGImageCreateWithMaskingColors(rawImageRef, colorMasking);
    {
        //if in iphone
        CGContextTranslateCTM(UIGraphicsGetCurrentContext(), 0.0, image.size.height);
        CGContextScaleCTM(UIGraphicsGetCurrentContext(), 1.0, -1.0);
    }
    CGContextDrawImage(UIGraphicsGetCurrentContext(), CGRectMake(0, 0, image.size.width, image.size.height), maskedImageRef);
    UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
    CGImageRelease(maskedImageRef);
    UIGraphicsEndImageContext();
    return result;
}



- (UIImage *)resizeImage:(UIImage*)image newSize:(CGSize)newSize {
    CGRect newRect = CGRectIntegral(CGRectMake(0, 0, newSize.width, newSize.height));
    CGImageRef imageRef = image.CGImage;
    
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // Set the quality level to use when rescaling
    CGContextSetInterpolationQuality(context, kCGInterpolationHigh);
    CGAffineTransform flipVertical = CGAffineTransformMake(1, 0, 0, -1, 0, newSize.height);
    
    CGContextConcatCTM(context, flipVertical);
    // Draw into the context; this scales the image
    CGContextDrawImage(context, newRect, imageRef);
    
    // Get the resized image from the context and a UIImage
    CGImageRef newImageRef = CGBitmapContextCreateImage(context);
    UIImage *newImage = [UIImage imageWithCGImage:newImageRef];
    
    CGImageRelease(newImageRef);
    UIGraphicsEndImageContext();
    
    return newImage;
}

@end
