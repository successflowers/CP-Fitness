//
//  RuleControls.m
//  CP-Fitness
//
//  Created by 张敬 on 2017/11/29.
//  Copyright © 2017年 Jing Zhang. All rights reserved.
//

#import "RuleControls.h"
#import "SignleRule.h"

#define rulerValueDefauleWidth 80
#define rulerToScreenGap 180

@interface RuleControls ()<UIScrollViewDelegate>
{
    BOOL _isDraw;
    BOOL _isFristDrag;
    
    CGFloat _startPoint;
    CGFloat _endPoint;
    NSInteger _defaultValue;
}

@property (nonatomic, strong) UIView *blueBar;
@property (nonatomic, strong) UIScrollView *mScrollView;
@property (nonatomic, assign) CGFloat rulerValueWidth;
@property (nonatomic, assign) CGFloat rulerValueHeight;
@property (nonatomic, assign) CGFloat rulerMarkWidth;
@property (nonatomic, assign) CGFloat rulerMarkHeight;

@end

@implementation RuleControls

#pragma mark  ---- init ----
- (instancetype)init{
    self = [super init];
    if (self) {
        [self initParam];
        [self addSubview:self.mScrollView];
        [self addSubview:self.blueBar];
    }
    return self;
}

- (void)initParam{
    //self.backgroundColor = KRedColor;
    _isDraw = YES;
    _isFristDrag = YES;
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    if (_isDraw) {
        _isDraw = NO;
        [self drawRuler];
    }
    
    DDLog(@"rule = %@",NSStringFromCGRect(self.frame));
}

#pragma mark  ---- 绘制界面  ----
- (void)drawRuler{
    
    [self reLoadUIRect];
    
    NSInteger width = self.rulerValueWidth+self.rulerMarkWidth;
    NSInteger height = self.rulerValueHeight+self.rulerMarkHeight;
    NSInteger num = self.valueArr.count;
    _mScrollView.contentSize = CGSizeMake(num*(self.rulerMarkWidth+self.rulerMarkWidth/9)+self.rulerValueWidth,  self.rulerMarkHeight+self.rulerValueHeight);
    _mScrollView.contentInset = UIEdgeInsetsMake(0, self.rulerMarkWidth, 0,-self.rulerMarkWidth/9);
    _mScrollView.contentOffset = CGPointMake(-self.rulerMarkWidth, 0);
    for (NSInteger i = 0; i < num; i++) {
        
        SignleRule *ruler = [SignleRule layer];
        ruler.ruleValueLayer.frame = CGRectMake(0, 0, self.rulerValueWidth, self.rulerValueHeight);
        NSString *value = [NSString stringWithFormat:@"%@",self.valueArr[i]];
        ruler.ruleValueLayer.string = value;
        
        ruler.ruleBackgroundLayer.frame = CGRectMake(self.rulerValueWidth/2, self.rulerValueHeight, self.rulerMarkWidth, self.rulerMarkHeight);
        ruler.frame = CGRectMake((self.rulerMarkWidth+self.rulerMarkWidth/9)*i, 0, width, height);
        
        [self.mScrollView.layer addSublayer:ruler];
    }
}

- (void)reLoadUIRect
{
    self.frame = CGRectMake(0,KScreenHeight - rulerToScreenGap,
                            KScreenWidth, self.rulerMarkHeight+self.rulerValueHeight);
    _mScrollView.frame = self.bounds;
    _blueBar.frame = CGRectMake(kScreenWidth/2-2, self.rulerValueHeight, 3, self.rulerMarkHeight);

    if (_type == RuleControlsType_Vertical){
        CGAffineTransform tranform = CGAffineTransformMakeRotation(90 *M_PI / 180.0);
        self.transform = CGAffineTransformTranslate(tranform, -130, -100);
    }
}
#pragma mark ---- mScrowView.Delegate -----
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    NSLog(@"开始拖拽");
    //初始化年
    _defaultValue = [self.valueArr[0] integerValue];
    if (!(scrollView.isDragging || scrollView.isTracking || scrollView.isDecelerating)) {
        return;
    }
    if (_isFristDrag) {
        _isFristDrag = NO;
        _startPoint = scrollView.contentOffset.x;
    }
}

// 结束减速时触发（停止）
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSLog(@"结束减速（停止）");
    _endPoint = scrollView.contentOffset.x;
    //最小刻度值
    CGFloat gap =  self.rulerMarkWidth/9 *10;
    CGFloat contentOffset = _endPoint - _startPoint;
    NSInteger roundGap = roundf(contentOffset/gap);
    _mScrollView.contentOffset = CGPointMake((gap*roundGap-self.rulerMarkWidth), 0);
    _defaultValue = _defaultValue - roundGap;
    
    if (self.callback) {
        self.callback(_defaultValue);
    }
}

#pragma mark ---- setter ----
- (void)setValueArr:(NSMutableArray *)valueArr{
    _valueArr = valueArr;
    NSInteger num = self.valueArr.count;
    _mScrollView.contentSize = CGSizeMake(num*(self.rulerMarkWidth+self.rulerMarkWidth/9)+self.rulerValueWidth,  self.rulerMarkHeight+self.rulerValueHeight);
}

#pragma mark  ---- getter  ----
- (UIView *)blueBar{
    
    if (!_blueBar) {
        _blueBar = [[UIView alloc] init];
        _blueBar.backgroundColor = KBlueColor;
    }
    return _blueBar;
}

- (UIScrollView *)mScrollView{
    
    if (!_mScrollView) {
        _mScrollView = [[UIScrollView alloc] init];
        //_mScrollView.backgroundColor = KGray2Color;
        _mScrollView.delegate = self;
        
    }
    return _mScrollView;
}

- (CGFloat)rulerValueWidth{
    if (_rulerWidth<=0) {
        _rulerValueWidth = rulerValueDefauleWidth;
    }
    return _rulerValueWidth;
}

- (CGFloat)rulerValueHeight{
    if (_rulerWidth<=0) {
        _rulerValueHeight = 25;
    }
    return _rulerValueHeight;
}

- (CGFloat)rulerMarkWidth{
      _rulerMarkWidth = (_rulerWidth<=0) ?100 :_rulerWidth;
    return _rulerMarkWidth;
}

- (CGFloat)rulerMarkHeight{
    _rulerMarkHeight = (_rulerHeight<=0) ?45 :(_rulerHeight-25);
    return _rulerMarkHeight;
}

@end
