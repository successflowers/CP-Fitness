//
//  PieView.m
//  CP-Fitness
//
//  Created by 张敬 on 2017/11/4.
//  Copyright © 2017年 Jing Zhang. All rights reserved.
//

#import "PieView.h"

#define pieWidth 68.f

@interface PieView()

@property (nonatomic, retain) CAShapeLayer *redLayer;
@property (nonatomic, retain) CAShapeLayer *greenLayer;
@property (nonatomic, retain) CAShapeLayer *yellowLayer;
@property (nonatomic, retain) CAShapeLayer *blueLayer;
@property (nonatomic, retain) CAShapeLayer *grayLayer;

@property (nonatomic, assign) CGPoint pie3DTransPoint;

@property (nonatomic, retain) NSArray *percentArray;

@end

@implementation PieView


- (instancetype) initWithPercentArray:(NSArray *)array
{
    self = [super init];
    if (self) {
        
        
        self.percentArray = array;
        
        [self initParam];
        [self initInterface];
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
        [self addGestureRecognizer:tapGesture];
    }
    return self;
}

#pragma mark - initParam
- (void)initParam
{
    self.pie3DTransPoint = CGPointMake(0, 0);
}

#pragma mark - initInterface
- (void)initInterface
{
    self.backgroundColor = KClearColor;;
    [self.layer setMasksToBounds:YES];
    [self.layer setCornerRadius:4.0]; //设置矩形四个圆角半径
    
    [self.layer addSublayer:self.redLayer];
    [self.layer addSublayer:self.greenLayer];
    [self.layer addSublayer:self.blueLayer];
    [self.layer addSublayer:self.yellowLayer];
    [self.layer addSublayer:self.grayLayer];
}

#pragma mark - autolayout
#pragma mark - event response
- (void)handleTapGesture:(UITapGestureRecognizer *)sender {
    CGPoint location = [sender locationInView:sender.view];
    NSLog(@"location is %@", NSStringFromCGPoint(location));
}

#pragma mark - other methods
// 绘制饼状图
- (void)addPieChart:(CAShapeLayer *)layer
       andArcCenter:(CGPoint)ArcCenter
     andStart_Angle:(CGFloat)start_Angle
       andend_Angle:(CGFloat)end_Angle
   andPieChartWidht:(CGFloat)PieChartWidth
andandPieChartColor:(UIColor *)andPieChartColor{
    
    layer.lineWidth = PieChartWidth *2;
    layer.strokeColor = andPieChartColor.CGColor;
    layer.fillColor = KClearColor.CGColor;
    layer.transform = CATransform3DMakeScale(0.7, 0.4, 1);
    layer.shadowOffset = CGSizeMake(0,30); //阴影的位置
    layer.shadowRadius = 30.0;//阴影的圆角
    layer.shadowColor = KBlackColor.CGColor; //阴影的颜色
    layer.shadowOpacity = 0.8;//阴影的透明度
    UIBezierPath * progressPath = [UIBezierPath bezierPathWithArcCenter:ArcCenter radius:PieChartWidth startAngle:start_Angle endAngle:end_Angle clockwise:YES];
    layer.path = progressPath.CGPath;
    layer.anchorPoint = CGPointMake(0, 0);    //top-middle
    layer.position = CGPointMake(KScreenWidth/2-5,pieWidth*0.8);
}

// 饼状图动画添加
- (void)addPieChart:(CAShapeLayer *)layer
       andArcCenter:(CGPoint)ArcCenter
     andStart_Angle:(CGFloat)start_Angle
       andend_Angle:(CGFloat)end_Angle
   andPieChartWidht:(CGFloat)PieChartWidht
   andPieChartColor:(UIColor *)PieChartColor
           animated:(BOOL)animated{
    
    [self addPieChart:layer andArcCenter:ArcCenter andStart_Angle:start_Angle andend_Angle:end_Angle andPieChartWidht:PieChartWidht andandPieChartColor:PieChartColor];
    
    CABasicAnimation *pathAnima = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnima.duration = 3.0f;
    pathAnima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pathAnima.fromValue = [NSNumber numberWithFloat:0.0f];
    pathAnima.toValue = [NSNumber numberWithFloat:1.0f];
    pathAnima.fillMode = kCAFillModeForwards;
    pathAnima.removedOnCompletion = NO;
    [layer addAnimation:pathAnima forKey:@"strokeEndAnimation"];
}

#pragma mark - setter and getter

- (CAShapeLayer *)redLayer
{
    if (!_redLayer) {
        
        _redLayer = [CAShapeLayer layer];
        
        CGFloat startAngle = M_PI*[self.percentArray[0] floatValue];
        CGFloat endAngle = M_PI*[self.percentArray[1] floatValue];
        [self addPieChart:_redLayer andArcCenter:self.pie3DTransPoint andStart_Angle:startAngle andend_Angle:endAngle andPieChartWidht:pieWidth andPieChartColor:pieRedColor animated:NO];
    }
    return _redLayer;
}

- (CAShapeLayer *)greenLayer
{
    if (!_greenLayer) {
        
        _greenLayer = [CAShapeLayer layer];
        
        CGFloat startAngle = M_PI*[self.percentArray[1] floatValue];
        CGFloat endAngle = M_PI*[self.percentArray[2] floatValue];
        [self addPieChart:_greenLayer andArcCenter:self.pie3DTransPoint andStart_Angle:startAngle andend_Angle:endAngle andPieChartWidht:pieWidth*1.1 andPieChartColor:pieGreenColor animated:YES];
    }
    return _greenLayer;
}

- (CAShapeLayer *)blueLayer
{
    if (!_blueLayer) {
        
        _blueLayer = [CAShapeLayer layer];
        
        CGFloat startAngle = M_PI*[self.percentArray[2] floatValue];
        CGFloat endAngle = M_PI*[self.percentArray[3] floatValue];
        [self addPieChart:_blueLayer andArcCenter:self.pie3DTransPoint andStart_Angle:startAngle andend_Angle:endAngle andPieChartWidht:pieWidth*1.3 andPieChartColor:pieBlueColor animated:YES];
        
    }
    return _blueLayer;
}

- (CAShapeLayer *)yellowLayer
{
    if (!_yellowLayer) {
        
        _yellowLayer = [CAShapeLayer layer];
        
        CGFloat startAngle = M_PI*[self.percentArray[3] floatValue];
        CGFloat endAngle = M_PI*[self.percentArray[4] floatValue];
        [self addPieChart:_yellowLayer andArcCenter:self.pie3DTransPoint andStart_Angle:startAngle andend_Angle:endAngle andPieChartWidht:pieWidth*0.6 andPieChartColor:pieYellowColor animated:YES];
    }
    return _yellowLayer;
}

- (CAShapeLayer *)grayLayer
{
    if (!_grayLayer) {
        
        _grayLayer = [CAShapeLayer layer];
        CGFloat startAngle = M_PI*[self.percentArray[4] floatValue];
        CGFloat endAngle = M_PI*[self.percentArray[0] floatValue];
        [self addPieChart:_grayLayer andArcCenter:self.pie3DTransPoint andStart_Angle:startAngle andend_Angle:endAngle andPieChartWidht:pieWidth*0.8 andPieChartColor:pieGrayColor animated:YES];
    }
    return _grayLayer;
}

@end
