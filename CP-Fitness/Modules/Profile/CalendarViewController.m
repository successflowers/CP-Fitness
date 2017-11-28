//
//  CalendarViewController.m
//  CP-Fitness
//
//  Created by 张敬 on 2017/10/29.
//  Copyright © 2017年 Jing Zhang. All rights reserved.
//

#import "CalendarViewController.h"
#import "CalendarViewControls.h"
#import "TrainingDetailViewController.h"

@interface CalendarViewController ()

@property (nonatomic, retain) UIImageView *logoIcon;
@property (nonatomic, retain) UILabel *logoLabel;
@property (nonatomic, copy) NSString *nickName;

@property (nonatomic, retain) CalendarViewControls *calendarControls;

@end

@implementation CalendarViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    DDLog(@"dataArray = %@",self.dateArray);
    [self initParam];
    [self initInterface];
}

#pragma mark - initparam
- (void)initParam
{
    self.userModel = [UserModel readUserDefaults];
    NSDictionary * character = self.userModel.character;
    NSString *name = nil;
    if ([character[@"nickname"] isEqualToString:@""]) {
        name = @"XX";
    }else
    {
        name = character[@"nickname"];
    }
    
    self.nickName = [NSString stringWithFormat:@"%@'s Sports Caledsar",name];
  
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
        
        make.top.equalTo(self.view.mas_top).offset(100);
        make.centerX.equalTo(self.view);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(60);
    }];
    
    [self.logoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_logoIcon.mas_bottom).offset(25);
        make.left.equalTo(self.view.mas_left).offset(50);
        make.right.equalTo(self.view.mas_right).offset(-50);
        make.height.mas_equalTo(48);
    }];
    
    [_calendarControls mas_makeConstraints:^(MASConstraintMaker *make) {
      
        make.top.equalTo(_logoLabel.mas_bottom).offset(25);
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(self.view.mas_bottom).offset(10);
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
        
        _logoLabel = [self setTitleWithString:self.nickName font:SYSTEMFONT(23)];
        UIImageView *logoImage = [[UIImageView alloc] init];
        logoImage.image = IMAGE_NAMED(@"ac_calendar_tvbg.png");
        logoImage.frame = CGRectMake(0, 0, KScreenWidth - 100, 50);
        [_logoLabel insertSubview:logoImage atIndex:0];
        _logoLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _logoLabel;
}

- (CalendarViewControls *)calendarControls
{
    __weak CalendarViewController *weakSelf = self;
    if (!_calendarControls) {
       
        _calendarControls = [[CalendarViewControls alloc] init];
        _calendarControls.today = [NSDate date];
        _calendarControls.date = _calendarControls.today;
        _calendarControls.dateArray = self.dateArray;

        _calendarControls.calendarBlock = ^(NSInteger day, NSInteger month, NSInteger year, BOOL isHasSportData){
            
            if (isHasSportData) {
                NSLog(@"%@-%@-%@",@(year),@(month),@(day));
                TrainingDetailViewController *trainDetailVC = [[TrainingDetailViewController alloc] init];
                [weakSelf.navigationController pushViewController:trainDetailVC animated:YES];
            }else
            {
                DDLog(@"no data");
            }
        };
    }
    return _calendarControls;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
