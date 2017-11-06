//
//  CalendarViewController.m
//  CP-Fitness
//
//  Created by 张敬 on 2017/10/29.
//  Copyright © 2017年 Jing Zhang. All rights reserved.
//

#import "CalendarViewController.h"
#import "CalendarViewControls.h"

@interface CalendarViewController ()

@property (nonatomic, retain) UIImageView *logoIcon;
@property (nonatomic, retain) UILabel *logoLabel;

@property (nonatomic, retain) CalendarViewControls *calendarControls;

@end

@implementation CalendarViewController
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
    self.navTitleLabel.text = @"Calendar";
    
    [self.view addSubview:self.logoIcon];
    [self.view addSubview:self.logoLabel];
    [self.view addSubview:self.calendarControls];
    
    [self setupAutoLayout];
}

#pragma mark - autolayout
- (void)setupAutoLayout
{
    [self.logoIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.view.mas_top).offset(120);
        make.centerX.equalTo(self.view);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(60);
    }];
    
    [self.logoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_logoIcon.mas_bottom).offset(30);
        make.left.equalTo(self.view.mas_left).offset(60);
        make.right.equalTo(self.view.mas_right).offset(-60);
        make.height.mas_equalTo(48);
    }];
    
    [_calendarControls mas_makeConstraints:^(MASConstraintMaker *make) {
      
        make.top.equalTo(_logoLabel.mas_bottom).offset(30);
        make.left.right.bottom.equalTo(self.view);
    }];
}

#pragma mark - event response

#pragma mark - setter and getter
- (UIImageView *)logoIcon
{
    if (!_logoIcon) {
        
        _logoIcon = [[UIImageView alloc] init];
        _logoIcon.image = IMAGE_NAMED(@"main_logo.png");
    }
    return _logoIcon;
}

- (UILabel *)logoLabel
{
    if (!_logoLabel) {
        
        _logoLabel = [self setTitleWithString:@"XX's Sports Caledsar" font:SYSTEMFONT(23)];
        UIImageView *logoImage = [[UIImageView alloc] init];
        logoImage.image = IMAGE_NAMED(@"ac_calendar_tvbg.png");
        logoImage.frame = CGRectMake(0, 0, KScreenWidth - 120, 50);
        [_logoLabel insertSubview:logoImage atIndex:0];
        _logoLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _logoLabel;
}

- (CalendarViewControls *)calendarControls
{
    if (!_calendarControls) {
       
        _calendarControls = [[CalendarViewControls alloc] init];
        _calendarControls.today = [NSDate date];
        _calendarControls.date = _calendarControls.today;
        _calendarControls.calendarBlock = ^(NSInteger day, NSInteger month, NSInteger year){
            
        NSLog(@"%f-%f-%f",(long)year,(long)month,(long)day);
        };
    }
    return _calendarControls;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
