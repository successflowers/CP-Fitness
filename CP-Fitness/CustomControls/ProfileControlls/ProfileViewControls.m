//
//  ProfileViewControls.m
//  CP-Fitness
//
//  Created by 张敬 on 2017/10/29.
//  Copyright © 2017年 Jing Zhang. All rights reserved.
//

#import "ProfileViewControls.h"

#define headIconSize 100.f //图标大小
#define headIconToLabelGap 10.f //图标／名称间距
#define headLabelHeight 44.f //名称标签高度

@interface ProfileViewControls ()

@property (nonatomic, retain) UIImageView *headImageView;
@property (nonatomic, retain) UILabel *headLabel;

@end

@implementation ProfileViewControls

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self addSubview:self.headImageView];
        [self addSubview:self.headLabel];
        
        [self setupAutoLayout];
    }
    return self;
}

#pragma mark - 布局
- (void)setupAutoLayout
{
    [self.headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self);
        make.centerX.equalTo(self.mas_centerX);
        make.width.height.mas_equalTo(headIconSize);
    }];
    
    [self.headLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.headImageView.mas_bottom).offset(headIconToLabelGap);
        make.right.left.equalTo(self);
        make.height.mas_equalTo(headLabelHeight);
    }];
}

#pragma mark - setter and getter
- (void)setModel:(ProfileModel *)model
{
    _model = model;
    self.headImageView.image = IMAGE_NAMED(model.headIcon);
    self.headLabel.text = model.headName;
    self.headLabel.font = model.font;
}

- (UIImageView *)headImageView
{
    if (!_headImageView) {
        
        _headImageView = [[UIImageView alloc] init];
    }
    return _headImageView;
}

- (UILabel *)headLabel
{
    if (!_headLabel) {
        _headLabel = [[UILabel alloc] init];
        _headLabel.textAlignment = NSTextAlignmentCenter;
        _headLabel.textColor = KWhiteColor;
    }
    return _headLabel;
}

@end
