//
//  TrainingDetailViewController.m
//  CP-Fitness
//
//  Created by 张敬 on 2017/11/4.
//  Copyright © 2017年 Jing Zhang. All rights reserved.
//

#import "TrainingDetailViewController.h"
#import "PieViewControls.h"

@interface TrainingDetailViewController ()

@property (nonatomic, retain) PieViewControls *pieControls;

@end

@implementation TrainingDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initInterface];
    [self setupAutoLayout];
}

#pragma mark - initInterface
- (void)initInterface
{
    [self setBackgroundWithImage:@"ac_perfectinfo_bg.png"];
    [self.view addSubview:self.gobackBtn];
    [self.view addSubview:self.navTitleLabel];
    self.navTitleLabel.text = @"Training Detail";
    
    [self.view addSubview:self.pieControls];
}

#pragma mark - autolayout
- (void)setupAutoLayout
{
    [self.pieControls mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.view.mas_top).offset(100);
        make.height.mas_offset(KScreenWidth+150.f);
        make.left.equalTo(self.view.mas_left).offset(5);
        make.right.equalTo(self.view.mas_right).offset(-5);
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
