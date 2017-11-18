//
//  BarChartViewControls.m
//  CP-Fitness
//
//  Created by 张敬 on 2017/11/7.
//  Copyright © 2017年 Jing Zhang. All rights reserved.
//

#import "BarChartViewControls.h"
#import <CoreText/CoreText.h>
#define barX_Gap 24.f
#define barY_gap 45.f


@interface BarChartViewControls()

@property (nonatomic, retain) NSArray *heartRateArray;
@property (nonatomic, retain) NSArray *barY;
@property (nonatomic, retain) NSArray *barX;
@property (nonatomic, assign) CGPoint startPoint;

@property (nonatomic, retain) CAShapeLayer *axisLayer;
@property (nonatomic, retain) CATextLayer *axisTextLayer_X;
@property (nonatomic, retain) UILabel *axisTextLab_Y;

@end

@implementation BarChartViewControls
- (instancetype)initWithHeartRateArray:(NSArray *)array
{
    self = [super init];
    if (self) {
        
        self.heartRateArray = array;
        self.backgroundColor = pieBackColor;
        [self.layer setMasksToBounds:YES];
        [self.layer setCornerRadius:4.0]; //设置矩形四个圆角半径
        
        [self initParam];
        [self initInterface];
    }
    return self;
}

#pragma mark - initParam
- (void)initParam
{
    self.startPoint = CGPointMake(30, 30);
}

#pragma mark - initInterface
- (void)initInterface
{
    [self.layer addSublayer:self.axisLayer];
    [self.layer addSublayer:self.axisTextLayer_X];
    [self addSubview:self.axisTextLab_Y];
    
    for (int i = 0; i< self.heartRateArray.count; i++) {
        
        CGFloat num = [self.heartRateArray[i] floatValue];
        CAShapeLayer *barLayer = [CAShapeLayer layer];
        
        barLayer.lineCap = kCALineJoinRound;
        barLayer.lineWidth = 12.f;
       
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointMake(self.startPoint.x +15 +24*i, self.startPoint.y+barY_gap*5-15)];
        
        [path addLineToPoint:CGPointMake(self.startPoint.x +15 +24*i, self.startPoint.y+num)];
        barLayer.path = path.CGPath;
        
        if (i>=0 && i<5) {
            
            barLayer.strokeColor = pieRedColor.CGColor;
            
        }else if (i>=5 && i<10)
        {
            barLayer.strokeColor = pieYellowColor.CGColor;
        }else
        {
            barLayer.strokeColor = pieBlueColor.CGColor;
        }
        
        CABasicAnimation *pathAnima = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
        pathAnima.duration = 3.0f;
        pathAnima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        pathAnima.fromValue = [NSNumber numberWithFloat:0.0f];
        pathAnima.toValue = [NSNumber numberWithFloat:1.0f];
        pathAnima.fillMode = kCAFillModeForwards;
        pathAnima.removedOnCompletion = NO;
        [barLayer addAnimation:pathAnima forKey:@"strokeEndAnimation"];
        
        [self.layer addSublayer:barLayer];
    }
}

#pragma mark - autolayout
#pragma mark - event response
#pragma mark - setter and getter
- (CAShapeLayer *)axisLayer
{
    if (!_axisLayer) {
        _axisLayer = [CAShapeLayer layer];
        _axisLayer.strokeColor = pieGrayColor.CGColor;
        _axisLayer.lineWidth = line_width;
        _axisLayer.fillColor = KClearColor.CGColor;
        
        UIBezierPath *path = [UIBezierPath bezierPath];
        
        [path moveToPoint:self.startPoint];
        [path addLineToPoint:CGPointMake(self.startPoint.x, self.startPoint.y+barY_gap*5)];
        [path addLineToPoint:
         CGPointMake(self.startPoint.x+barX_Gap*15,self.startPoint.y+barY_gap*5)];
        
        _axisLayer.path = path.CGPath;
    }
    return _axisLayer;
}

- (CATextLayer *)axisTextLayer_X
{
    if (!_axisTextLayer_X) {
        NSString *text = @"01 02 03 04 05 06 07 08 09 10 11 12 13 14 15";
        NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithString:text];
        //设置字体间距
        long number = 2.0f;
        CFNumberRef num = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt8Type, &number);
        [attributedText addAttribute:(id)kCTKernAttributeName value:(__bridge id)num range:NSMakeRange(0, [attributedText length])];
        [attributedText addAttribute:(NSString *)NSForegroundColorAttributeName value:(id)pieGrayColor.CGColor range:NSMakeRange(0,attributedText.length)];
        [attributedText addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:13] range:NSMakeRange(0, attributedText.length)];
    
        _axisTextLayer_X = [CATextLayer layer];
        _axisTextLayer_X.string = attributedText;
        _axisTextLayer_X.frame = CGRectMake(self.startPoint.x+5, self.startPoint.y+barY_gap*5+10, barX_Gap *15, 20);
        _axisTextLayer_X.contentsScale = [UIScreen mainScreen].scale;
    }
    return _axisTextLayer_X;
}

- (UILabel *)axisTextLab_Y
{
    if (!_axisTextLab_Y) {
        
        NSString *text = @"bpm 140 110 80 50";
        NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:text];
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineSpacing = 30;
    
        [string addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, string.length)];
        
        [string addAttribute:NSForegroundColorAttributeName value:pieGrayColor range:NSMakeRange(0, string.length)];
        
        [string addAttribute:NSFontAttributeName value:SYSTEMFONT(13) range:NSMakeRange(0, string.length)];

        _axisTextLab_Y = [[UILabel alloc] init];
        _axisTextLab_Y.attributedText = string;
        _axisTextLab_Y.numberOfLines = 0;
        _axisTextLab_Y.textAlignment = NSTextAlignmentCenter;
        _axisTextLab_Y.frame = CGRectMake(self.startPoint.x-30, self.startPoint.y, 30, 220);
    }
    return _axisTextLab_Y;
}

- (NSArray *)barY
{
    if (!_barY) {
        _barY = @[@"50", @"80", @"110",  @"140", @"bpm"];
    }
    return _barY;
}

- (NSArray *)barX
{
    if (!_barX) {
        _barX = @[@"01", @"02", @"03",  @"04", @"05",
                  @"06", @"07", @"08",  @"09", @"10",
                  @"11", @"12", @"13",  @"14", @"15",];
    }
    return _barX;
}

@end
