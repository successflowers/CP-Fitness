//
//  ChangeProfileViewController.m
//  CP-Fitness
//
//  Created by 张敬 on 2017/11/30.
//  Copyright © 2017年 Jing Zhang. All rights reserved.
//

#import "ChangeProfileViewController.h"

static NSString *cellId = @"cellId";
@interface ChangeProfileViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, retain) UITableView *mTableView;

@end

@implementation ChangeProfileViewController

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
    self.navTitleLabel.text = @"Change Profile";
    
    [self.view addSubview:self.mTableView];
    
    
    [self setupAutoLayout];
}

#pragma mark - autolayout
- (void)setupAutoLayout
{
    
}
#pragma mark - tableViewDelegate
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView* customView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, KScreenWidth, 20.0)];
    customView.backgroundColor = KClearColor;
    return customView;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [[UIView alloc] init];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section;
{
    return 15.0f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.001f;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 2;
            break;
            
        case 1:
            return 3;
            break;
        case 2:
            return 4;
            break;
            
        default:
            return 1;
            break;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    cell.textLabel.textColor = KWhiteColor;
    cell.backgroundColor = RGBA(80, 56, 98, 0.5);
    switch (indexPath.section) {
        case 0:
        {
            if (indexPath.row == 0) {
                cell.textLabel.text = @"Photo";
                cell.detailTextLabel.text = @"110";
            }else
            {
                cell.textLabel.text = @"Gym ID";
                cell.detailTextLabel.text = @"110";
            }
        }
            break;
            
        case 1:
        {
            if (indexPath.row == 0) {
                cell.textLabel.text = @"Frist Name";
                cell.detailTextLabel.text = @"zhang";
            }else if(indexPath.row == 1)
            {
                cell.textLabel.text = @"Last Name";
                cell.detailTextLabel.text = @"jing";
            }else
            {
                cell.textLabel.text = @"Cell Phone";
                cell.detailTextLabel.text = @"10086";
            }
        }
            break;
        
        case 2:
        {
            if (indexPath.row == 0) {
                cell.textLabel.text = @"Gender";
                cell.detailTextLabel.text = @"110";
                
            }else if(indexPath.row == 1)
            {
                cell.textLabel.text = @"Date of Birth";
                cell.detailTextLabel.text = @"1898-03-08";
            }else if(indexPath.row == 2)
            {
                cell.textLabel.text = @"Height";
                cell.detailTextLabel.text = @"170";
            }else
            {
                cell.textLabel.text = @"Weight";
                cell.detailTextLabel.text = @"120";
            }
        }
            
            break;
        default:
        {
            cell.textLabel.text = @"Resting Heart Rate";
            cell.detailTextLabel.text = @"110";
        }
            break;
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
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
        
        CGRect rect = CGRectMake(0, 55, KScreenWidth, KScreenHeight-55);
        _mTableView = [[UITableView alloc] initWithFrame:rect style:UITableViewStyleGrouped];
        _mTableView.delegate = self;
        _mTableView.dataSource = self;
        _mTableView.backgroundColor = KClearColor;
        _mTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _mTableView.scrollEnabled = YES;
        [_mTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellId];
    }
    return _mTableView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
