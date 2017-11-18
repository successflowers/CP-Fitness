//
//  TrainingDetailViewController.m
//  CP-Fitness
//
//  Created by 张敬 on 2017/11/4.
//  Copyright © 2017年 Jing Zhang. All rights reserved.
//

#import "TrainingDetailViewController.h"
#import "PieViewControls.h"
#import "BarChartViewControls.h"

@interface TrainingDetailViewController ()

@property (nonatomic, retain) PieViewControls *pieControls;
@property (nonatomic, retain) BarChartViewControls *barChartControls;

@end

@implementation TrainingDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initInterface];
    
   
}


#pragma mark - initInterface
- (void)initInterface
{
    [self setBackgroundWithImage:@"ac_perfectinfo_bg.png"];
    [self.view addSubview:self.gobackBtn];
    [self.view addSubview:self.navTitleLabel];
    self.navTitleLabel.text = @"Training Detail";
    
    [self.view addSubview:self.pieControls];
    [self.view addSubview:self.barChartControls];
    [self setupAutoLayout];
    [self setYYLabel];
}

- (void)setYYLabel
{
    NSString *title = @"不得不说 YYKit第三方框架确实很牛，YYLabel在富文本显示和操作方面相当强大，尤其是其异步渲染，让界面要多流畅有多流畅，这里我们介绍下简单的使用";
    
    //YYLabel 富文本
    YYLabel  *titleLabel = [YYLabel new];
    titleLabel.backgroundColor = KRedColor;
    
    //异步渲染 当一个label显示巨量文字的时候就能明显感觉到此功能的强大
    titleLabel.displaysAsynchronously = YES;
    [self.view addSubview:titleLabel];
    titleLabel.numberOfLines = 0;
    
    YYTextContainer  *titleContarer = [YYTextContainer new];
    
    //限制宽度
    titleContarer.size             = CGSizeMake(100,CGFLOAT_MAX);
    NSMutableAttributedString  *titleAttr = [self getAttr:title];
    YYTextLayout *titleLayout = [YYTextLayout layoutWithContainer:titleContarer text:titleAttr];
    
    CGFloat titleLabelHeight = titleLayout.textBoundingSize.height;
    titleLabel.frame = CGRectMake(50,50,100,titleLabelHeight);
    titleLabel.attributedText = titleAttr;
}

- (NSMutableAttributedString*)getAttr:(NSString*)attributedString {
    NSMutableAttributedString * resultAttr = [[NSMutableAttributedString alloc] initWithString:attributedString];
    
    //对齐方式 这里是 两边对齐
    resultAttr.alignment = NSTextAlignmentJustified;
    //设置行间距
    resultAttr.lineSpacing = 5;
    //设置字体大小
    resultAttr.font = [UIFont systemFontOfSize:15];
    //可以设置某段字体的大小
    [resultAttr setFont:[UIFont boldSystemFontOfSize:20] range:NSMakeRange(0, 3)];
    //设置字间距
    resultAttr.kern = [NSNumber numberWithFloat:1.0];
    
    return resultAttr;
}


#pragma mark - autolayout
- (void)setupAutoLayout
{
    [self.barChartControls mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.view.mas_top).offset(100);
        make.height.mas_offset(300.f);
        make.left.equalTo(self.view.mas_left).offset(5);
        make.right.equalTo(self.view.mas_right).offset(-5);
        
    }];
    
    [self.pieControls mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.barChartControls.mas_bottom).offset(50);
        make.height.mas_offset(465.f);
        make.left.right.equalTo(self.barChartControls);
    }];
    
}

#pragma mark - event response
#pragma mark - setter and getter
- (PieViewControls *)pieControls
{
    if (!_pieControls) {
        
        NSNumber *num_0 = [NSNumber numberWithFloat:1.6];
        NSNumber *num_1 = [NSNumber numberWithFloat:0.15];
        NSNumber *num_2 = [NSNumber numberWithFloat:0.85];
        NSNumber *num_3 = [NSNumber numberWithFloat:1.2];
        NSNumber *num_4 = [NSNumber numberWithFloat:1.35];
        
        NSArray *percentArray = @[num_0,num_1,num_2,num_3,num_4];
        _pieControls = [[PieViewControls alloc] initWithPercentArray:percentArray];
    }
    return _pieControls;
}

- (BarChartViewControls *)barChartControls
{
    if (!_barChartControls) {
        
        NSArray *heartRateArray = @[@"58",@"64",@"188",@"34",@"22",@"15",@"30",@"80",@"90",@"110",@"25",@"123",@"44",@"60",@"40",];
        _barChartControls = [[BarChartViewControls alloc] initWithHeartRateArray:heartRateArray];
    }
    return _barChartControls;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
