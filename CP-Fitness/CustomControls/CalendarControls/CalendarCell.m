//
//  CalendarCell.m
//  CP-Fitness
//
//  Created by 张敬 on 2017/10/30.
//  Copyright © 2017年 Jing Zhang. All rights reserved.
//

#import "CalendarCell.h"

@implementation CalendarCell

- (UILabel *)dayLabel
{
    if (!_dayLabel) {
        
        _dayLabel = [[UILabel alloc] init];
        _dayLabel.backgroundColor = KClearColor;
        _dayLabel.frame = self.bounds;
        _dayLabel.textAlignment = NSTextAlignmentCenter;
        _dayLabel.textColor = KWhiteColor;
        _dayLabel.font = SYSTEMFONT(18);
        
        float width = self.bounds.size.width;
        
        _litterBlueDot = [CAShapeLayer layer];
        _litterBlueDot.fillColor = RGB(63, 198, 249).CGColor;
        UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:
                              CGRectMake(0, 0, 6, 6)];
        _litterBlueDot.path = path.CGPath;
        _litterBlueDot.hidden = YES;
        _litterBlueDot.centerX = width/2-3;
        _litterBlueDot.centerY = width-8;
        [_dayLabel.layer addSublayer:_litterBlueDot];
        
        [self addSubview:_dayLabel];
    }
    
    return _dayLabel;
}

@end
