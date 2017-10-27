//
//  BaseViewController.m
//  CP-Fitness
//
//  Created by 张敬 on 2017/10/26.
//  Copyright © 2017年 Jing Zhang. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

#pragma mark - 设置背景
- (void)setBackgroundWithImage:(NSString *)image
{
    UIImageView *imgView = [[UIImageView alloc] initWithImage:IMAGE_NAMED(image)];
    imgView.frame = self.view.bounds;
    imgView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self.view insertSubview:imgView atIndex:0];
}

#pragma mark - 按钮
- (UIButton *)setButtonWithNomalImage:(NSString *)nomalImage
                       highlightImage:(NSString *)highlightImage
                                title:(NSString *)title
{
    UIButton *newButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [newButton setTitle:title forState:UIControlStateNormal];
    [newButton setTitleColor:KWhiteColor forState:UIControlStateNormal];
    newButton.titleLabel.font = SYSTEMFONT(16);
    [newButton setBackgroundImage:IMAGE_NAMED(nomalImage) forState:UIControlStateNormal];
    [newButton setBackgroundImage:IMAGE_NAMED(highlightImage) forState:UIControlStateHighlighted];
    return newButton;
}

- (UIButton *)setWhiteButtonWithTitle:(NSString *)title
{
    UIButton *whiteButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [whiteButton setTitle:title forState:UIControlStateNormal];
    [whiteButton setTitleColor:KWhiteColor forState:UIControlStateNormal];
    whiteButton.titleLabel.font = SYSTEMFONT(20);
    [whiteButton.layer setMasksToBounds:YES];
    [whiteButton.layer setCornerRadius:22.0]; //设置矩形四个圆角半径
    [whiteButton.layer setBorderWidth:2.0];
    whiteButton.layer.borderColor = KWhiteColor.CGColor;
    return whiteButton;
}

#pragma mark - 标题
- (UILabel *)setTitleWithString:(NSString *)title font:(UIFont *)font
{
    UILabel *titleLab = [[UILabel alloc] init];
    titleLab.text = title;
    titleLab.textColor = KWhiteColor;
    titleLab.font = font;
    return titleLab;
}

#pragma mark - 分界标签
- (UIView *)setBoundaryLayerWithString:(NSString *)string font:(UIFont *)font
{
    UIView *boundaryLayer = [[UIView alloc] init];
    boundaryLayer.backgroundColor = KClearColor;
    
    UILabel *signLabel  = [[UILabel alloc] init];
    signLabel.text = string;
    signLabel.textColor = KWhiteColor;
    signLabel.font = font;
    signLabel.textAlignment = NSTextAlignmentCenter;
    signLabel.frame = CGRectMake(0, 0, KScreenWidth, BUTTON_WIDTH);
    signLabel.backgroundColor = KClearColor;
    [boundaryLayer addSubview:signLabel];
    
    //计算文字的长度
    CGSize maxSize = CGSizeMake(MAXFLOAT, BUTTON_WIDTH);
    CGSize newSize = [self sizeWithText:string font:font maxSize:maxSize];
    CGFloat stringWidth = newSize.width;
    
    CGFloat lineWidth = (KScreenWidth -(stringWidth+2*BUTTON_MIDDLE+BOUNDARYLAYER_SIDE*2))/2.f;
    
    CAShapeLayer *line_1 = [CAShapeLayer layer];
    CAShapeLayer *line_2 = [CAShapeLayer layer];
    
    line_1.strokeColor = RGB(159, 149, 158).CGColor;
    line_2.strokeColor = line_1.strokeColor;
    
    UIBezierPath *path_1 = [UIBezierPath bezierPathWithRect:CGRectMake(BOUNDARYLAYER_SIDE, 22.f, lineWidth, 1.f)];
    UIBezierPath *path_2 = [UIBezierPath bezierPathWithRect:CGRectMake(lineWidth+stringWidth+2*BUTTON_MIDDLE+BOUNDARYLAYER_SIDE,22.f, lineWidth, 1.0f)];
    line_1.path = path_1.CGPath;
    line_2.path = path_2.CGPath;
    [boundaryLayer.layer addSublayer:line_1];
    [boundaryLayer.layer addSublayer:line_2];
    
    return boundaryLayer;
}

- (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxSize:(CGSize)maxSize{
    NSDictionary *attrs = @{NSFontAttributeName:font};
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
