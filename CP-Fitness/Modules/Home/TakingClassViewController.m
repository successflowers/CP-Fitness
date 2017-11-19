//
//  TakingClassViewController.m
//  CP-Fitness
//
//  Created by 张敬 on 2017/11/19.
//  Copyright © 2017年 Jing Zhang. All rights reserved.
//

#import "TakingClassViewController.h"
#define logoLableToTopGap 100.0f
#define profileControlsToLogoLabelGap 40.f
#define instructorBtnToProfileControlsGap 50.f
#define redlineLayerWidth 20.0f

static NSString *cellId = @"cellId";

@interface TakingClassViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    BOOL _isChooseedInstructor;
}
@property (nonatomic, retain) ProfileViewControls *profileControls;
@property (nonatomic, retain) CAShapeLayer *redLineLayer;
@property (nonatomic, retain) UILabel *logoLabel;
@property (nonatomic, retain) UIButton *instructorButton;
@property (nonatomic, retain) UITableView *instructorList;

@end

@implementation TakingClassViewController
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
    self.navTitleLabel.text = @"Taking Class";
    
    _isChooseedInstructor = NO;
    [self.view addSubview:self.profileControls];
    [self.view.layer addSublayer:self.redLineLayer];
    [self.view addSubview:self.logoLabel];
    [self.view addSubview:self.instructorList];
    [self.view addSubview:self.instructorButton];
   
    [self setupAutoLayout];
}

#pragma mark - autolayout
- (void)setupAutoLayout
{
    [self.logoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.view.mas_top).offset(logoLableToTopGap);
        make.left.equalTo(self.view.mas_left).offset(redlineLayerWidth+10);
        make.height.mas_equalTo(labelOrButtonSize);
    }];
    
    [self.profileControls mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.logoLabel.mas_bottom).offset(profileControlsToLogoLabelGap);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(150.f);
    }];
    
    [self.instructorButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.profileControls.mas_bottom).offset(instructorBtnToProfileControlsGap);
        make.left.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-20);
        make.height.mas_equalTo(labelOrButtonSize);
    }];
    
    [self.instructorList mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.instructorButton.mas_bottom).mas_offset(-10);
        make.left.right.equalTo(self.instructorButton);
        make.bottom.equalTo(self.view.mas_bottom).offset(-20.0f);
    }];
}

#pragma mark - 设置cell底线顶头
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]){
        [cell setSeparatorInset:UIEdgeInsetsMake(0, 15, 0, 15)];
    }
}

#pragma mark - tableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    cell.textLabel.text = @"Matt Skythor";
    cell.textLabel.textColor = KWhiteColor;
    CGSize size = CGSizeMake(40, 40);
    UIImage *image = IMAGE_NAMED(@"main_portrait.png");
    cell.imageView.image = image;
    cell.imageView.size = size;
    //调整image的大小
    UIGraphicsBeginImageContextWithOptions(size, NO,0.0);
    CGRect imageRect = CGRectMake(0.0, 0.0, size.width, size.height);
    [image drawInRect:imageRect];
    cell.imageView.image=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    cell.backgroundColor = KClearColor;
    cell.separatorInset = UIEdgeInsetsMake(0,0, 0, cell.bounds.size.width-15);
   
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - event response
- (void)didInstructorbtnClicked:(id)sender
{
    if (!_isChooseedInstructor) {
        _isChooseedInstructor = YES;
        [_instructorButton setImage:IMAGE_NAMED(@"xia.png") forState:UIControlStateNormal];
        _instructorButton.imageEdgeInsets = UIEdgeInsetsMake(22, KScreenWidth - 2*20 -25, 22,10);
        _instructorButton.titleEdgeInsets = UIEdgeInsetsMake(0,-60,0,0);
        
        [UIView transitionWithView:_instructorList duration:0.5 options:UIViewAnimationOptionTransitionCurlDown animations:^(void) {
            self.instructorList.hidden = NO;
        } completion:nil];
    }else
    {
        _isChooseedInstructor = NO;
        [_instructorButton setImage:IMAGE_NAMED(@"go.png") forState:UIControlStateNormal];
        _instructorButton.imageEdgeInsets = UIEdgeInsetsMake(20, KScreenWidth - 2*20 -20, 20,10);
        _instructorButton.titleEdgeInsets = UIEdgeInsetsMake(0,-30,0,0);
        
        [UIView transitionWithView:_instructorList duration:0.5 options:UIViewAnimationOptionTransitionCurlUp animations:^(void) {
            self.instructorList.hidden = YES;
        } completion:nil];
    }
}
    

#pragma mark - setter and getter
- (UILabel *)logoLabel
{
    if (!_logoLabel) {
        _logoLabel = [self setTitleWithString:@"Current Instructor" font:SYSTEMFONT(23)];
    }
    return _logoLabel;
}

- (CAShapeLayer *)redLineLayer
{
    if (!_redLineLayer) {
        _redLineLayer = [CAShapeLayer layer];
        _redLineLayer.fillColor = RGB(246, 154, 155).CGColor;
        
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(0, logoLableToTopGap + labelOrButtonSize/2, redlineLayerWidth, 2)];
        _redLineLayer.path = path.CGPath;
    }
    return _redLineLayer;
}

- (ProfileViewControls *)profileControls
{
    if (!_profileControls){
        
        ProfileModel *model = [[ProfileModel alloc] init];
        model.headIcon = @"main_portrait.png";
        model.headName = @"Matt Skythor";
        model.font = SYSTEMFONT(23);
        
        _profileControls = [[ProfileViewControls alloc] init];
        _profileControls.model = model;
    }
    return _profileControls;
}

- (UIButton *)instructorButton
{
    if (!_instructorButton) {
        _instructorButton = [self setButtonWithNomalImage:@"ac_perfectinfo_btbg.png" highlightImage:nil title:@"Instructor"];
        [_instructorButton setImage:IMAGE_NAMED(@"go.png") forState:UIControlStateNormal];
        _instructorButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        _instructorButton.imageEdgeInsets = UIEdgeInsetsMake(20, KScreenWidth - 2*20 -20, 20,10);
        _instructorButton.titleEdgeInsets = UIEdgeInsetsMake(0,-30,0,0);
//        NSLog(@"image:%@", NSStringFromCGRect(_instructorButton.imageView.frame));
//        NSLog(@"title:%@", NSStringFromCGRect(_instructorButton.titleLabel.frame));
        [_instructorButton addTarget:self action:@selector(didInstructorbtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _instructorButton;
}

- (UITableView *)instructorList
{
    if (!_instructorList) {
        _instructorList = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _instructorList.delegate = self;
        _instructorList.dataSource = self;
        _instructorList.backgroundColor = RGB(61, 51, 62);
        [_instructorList.layer setMasksToBounds:YES];
        [_instructorList.layer setCornerRadius:6.0]; //设置矩形四个圆角半径
        [_instructorList setSeparatorColor:underLineColor];
        //3.设置cell底线顶头
        if ([_instructorList respondsToSelector:@selector(setSeparatorInset:)]){
            [_instructorList setSeparatorInset:UIEdgeInsetsMake(0, 15, 0, 15)];
        }
        [_instructorList setTableHeaderView:[[UIView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth - 20.0*2,10)]];
        [_instructorList setTableFooterView:[[UIView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth - 20.0*2,0.1)]];
        [_instructorList registerClass:[UITableViewCell class] forCellReuseIdentifier:cellId];
        _instructorList.hidden = YES;
    }
    return _instructorList;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
