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
#import "TainingDetailHeaderControls.h"
#import "RecentTainingDataControls.h"

#define tableViewHeaderHeight 200.f
#define recentTrainingDataCellHeight 320.f
#define heartRateGraphCellHeight 290.0f
#define heartRateZoneCellHeight 470.f
#define sectionHeight 60.f

static NSString *cellId = @"cellId";

@interface TrainingDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, retain) UITableView *mTableView;
@property (nonatomic, retain) TainingDetailHeaderControls *tableViewHeaderView;
@property (nonatomic, retain) RecentTainingDataControls *recentTainingDataControls;
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
    
    [self.view addSubview:self.mTableView];
    [self setupAutoLayout];
}

#pragma mark - autolayout
- (void)setupAutoLayout
{
    [self.mTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.view.mas_top).offset(64.0f);
        make.left.right.bottom.equalTo(self.view);
    }];
}

#pragma mark - tableViewDelegate
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView* customView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, KScreenWidth, 44.0)];
    customView.backgroundColor = KClearColor;
    
    UILabel * headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(15.0, 0.0, KScreenWidth, 44.0)];
    headerLabel.backgroundColor = KClearColor;
    headerLabel.textColor = KWhiteColor;
    headerLabel.font = SYSTEMFONT(20);
    [customView addSubview:headerLabel];
    if (section == 1) {
        headerLabel.text = @"Heart Rate Graph";
    }else if(section == 2)
    {
        headerLabel.text = @"Heart Rate Zone";
    }
    return customView;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [[UIView alloc] init];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section;
{
    if (section != 0) {
        return 44.0f;
    }
    return 0.001f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.001f;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    cell.backgroundColor = KClearColor;
    switch (indexPath.section) {
        case 0:
            [cell addSubview:self.recentTainingDataControls];
            break;
        case 1:
            [cell addSubview:self.barChartControls];
            break;

        case 2:
             [cell addSubview:self.pieControls];
            break;

        default:
            break;
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
            return recentTrainingDataCellHeight;
            break;
        case 1:
            return heartRateGraphCellHeight;
            break;

        case 2:
            return heartRateZoneCellHeight;
            break;

        default:
            break;
    }
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - event response
#pragma mark - setter and getter
- (UITableView *)mTableView
{
    if (!_mTableView) {
        _mTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _mTableView.delegate = self;
        _mTableView.dataSource = self;
        _mTableView.backgroundColor = KClearColor;
        _mTableView.separatorColor = KClearColor;
        [_mTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellId];
        _mTableView.tableHeaderView = self.tableViewHeaderView;
    }
    return _mTableView;
}

- (TainingDetailHeaderControls *)tableViewHeaderView
{
    if (!_tableViewHeaderView) {
        
        TainingDetailModel *model = [[TainingDetailModel alloc] init];
        model.titleStr = @"LA Fitness";
        model.date = @"1st Avenue, NJ, 07030";
        model.userName = @"David";
        model.userImage = @"main_portrait.png";
        
        _tableViewHeaderView = [[TainingDetailHeaderControls alloc] init];
        _tableViewHeaderView.model = model;
        _tableViewHeaderView.frame = CGRectMake(0, 0,KScreenWidth,tableViewHeaderHeight);
    }
    return _tableViewHeaderView;
}
- (RecentTainingDataControls *)recentTainingDataControls
{
    if (!_recentTainingDataControls) {
        _recentTainingDataControls = [[RecentTainingDataControls alloc] init];
        _recentTainingDataControls.frame = CGRectMake(10, 0, KScreenWidth -20,recentTrainingDataCellHeight);
    }
    return _recentTainingDataControls;
}

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
        _pieControls.frame = CGRectMake(10, 0, KScreenWidth -20,heartRateZoneCellHeight);
    }
    return _pieControls;
}

- (BarChartViewControls *)barChartControls
{
    if (!_barChartControls) {
        
        NSArray *heartRateArray = @[@"58",@"64",@"188",@"34",@"22",@"15",@"30",@"80",@"90",@"110",@"25",@"123",@"44",@"60",@"40",];
        _barChartControls = [[BarChartViewControls alloc] initWithHeartRateArray:heartRateArray];
        _barChartControls.frame = CGRectMake(10, 0, KScreenWidth -20,heartRateGraphCellHeight);
    }
    return _barChartControls;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
