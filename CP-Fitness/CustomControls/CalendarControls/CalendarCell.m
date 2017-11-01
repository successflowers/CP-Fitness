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
        
        [self addSubview:_dayLabel];
    }
    
    return _dayLabel;
}

@end
