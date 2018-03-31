//
//  SignleRule.m
//  CP-Fitness
//
//  Created by 张敬 on 2017/11/29.
//  Copyright © 2017年 Jing Zhang. All rights reserved.
//

#import "SignleRule.h"

@implementation SignleRule

- (instancetype) init
{
    self = [super init];
    if (self) {
        [self addSublayer:self.ruleValueLayer];
        [self addSublayer:self.ruleBackgroundLayer];
    }
    return self;
}

- (CATextLayer *)ruleValueLayer
{
    if (!_ruleValueLayer) {
        _ruleValueLayer = [CATextLayer layer];
        _ruleValueLayer.fontSize = 20;
        _ruleValueLayer.foregroundColor = KWhiteColor.CGColor;
        _ruleValueLayer.alignmentMode = kCAAlignmentCenter;
        //_ruleValueLayer.backgroundColor = KRedColor.CGColor;
    }
    return _ruleValueLayer;
}

- (CALayer *)ruleBackgroundLayer
{
    if (!_ruleBackgroundLayer) {
        UIImage *image = IMAGE_NAMED(@"ruler_width.png");
        _ruleBackgroundLayer = [CALayer layer];
        _ruleBackgroundLayer.contents = (__bridge id)image.CGImage;
        
        //_ruleBackgroundLayer.backgroundColor = KBlueColor.CGColor;
    }
    return _ruleBackgroundLayer;
}


@end
