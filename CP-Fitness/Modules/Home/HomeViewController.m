//
//  HomeViewController.m
//  CP-Fitness
//
//  Created by 张敬 on 2017/11/18.
//  Copyright © 2017年 Jing Zhang. All rights reserved.
//

#import "HomeViewController.h"
#import "CalendarViewController.h"
#import "ProfileViewController.h"

#define TopGap 100.0f
#define rowsNumber 3
#define sectionsNumber 1
#define cellHeight 180.0f
static NSString *cellId = @"cellId";

@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, retain) UITableView *mTableView;
@property (nonatomic, retain) UILabel *titleLabel;
@property (nonatomic, retain) CAShapeLayer *lineLayer;

@end

@implementation HomeViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initInterface];
}

#pragma mark - initInterface
- (void)initInterface
{
    [self setBackgroundWithImage:@"ac_perfectinfo_bg.png"];
    [self.view addSubview:self.titleLabel];
    [self.view.layer addSublayer:self.lineLayer];
    [self.view addSubview:self.mTableView];

    [self setupAutoLayout];
}

#pragma mark - tableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return sectionsNumber;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return rowsNumber;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    cell.backgroundColor = KClearColor;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    UIImageView *cellImageView = [[UIImageView alloc] init];
    cellImageView.frame = CGRectMake(0, 0, KScreenWidth, cellHeight);
    [cell insertSubview:cellImageView atIndex:0];
    
    switch (indexPath.row) {
        case 0:
            cellImageView.image = IMAGE_NAMED(@"ac_home_calendar.png");
            break;
            
        case 1:
            cellImageView.image = IMAGE_NAMED(@"ac_home_taking.png");
            break;
            
        case 2:
            cellImageView.image = IMAGE_NAMED(@"ac_home_profile.png");
            break;
            
        default:
            break;
    }
   
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return cellHeight - 10;
    }
    return cellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UIViewController *viewController = nil;
    switch (indexPath.row) {
        case 0:
            viewController = [[CalendarViewController alloc] init];
        
            break;
        case 1:
            DDLog(@"2222");
            
            break;
        case 2:
              viewController = [[ProfileViewController alloc] init];
    
            break;
            
        default:
            break;
    }
    [self.navigationController pushViewController:viewController animated:YES];
}

#pragma mark - autolayout
- (void)setupAutoLayout
{
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
     
        make.left.equalTo(self.view.mas_left).offset(loginToSignButtonGap);
        make.top.equalTo(self.view.mas_top).offset(TopGap - 65.0f );
        make.right.equalTo(self.view.mas_right);
        make.height.mas_equalTo(44.0f);
    }];
}

#pragma mark - event response
#pragma mark - setter and getter
- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [self setTitleWithString:@"Home" font:SYSTEMFONT(32)];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        
    }
    return _titleLabel;
}

- (CAShapeLayer *)lineLayer
{
    if (!_lineLayer) {
        _lineLayer = [CAShapeLayer layer];
        _lineLayer.fillColor = KWhiteColor.CGColor;
        
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(loginToSignButtonGap, TopGap - 18.0f, KScreenWidth - 2*loginToSignButtonGap, line_width)];
        _lineLayer.path = path.CGPath;
    }
    return _lineLayer;
}

- (UITableView *)mTableView
{
    if (!_mTableView) {
        
        CGRect rect = CGRectMake(0, TopGap, KScreenWidth, KScreenHeight - TopGap);
        _mTableView = [[UITableView alloc] initWithFrame:rect style:UITableViewStylePlain];
        _mTableView.delegate = self;
        _mTableView.dataSource = self;
        _mTableView.backgroundColor = KClearColor;
        _mTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _mTableView.scrollEnabled = NO;
        [_mTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellId];
    }
    return _mTableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
