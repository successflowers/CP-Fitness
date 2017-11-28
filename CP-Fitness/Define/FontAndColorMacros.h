
//
//  FontAndColorMacros.h
//  CP-Fitness
//
//  Created by 张敬 on 2017/10/26.
//  Copyright © 2017年 Jing Zhang. All rights reserved.
//

#ifndef FontAndColorMacros_h
#define FontAndColorMacros_h

#pragma mark - 颜色
#define KClearColor         [UIColor clearColor]
#define KWhiteColor         [UIColor whiteColor]
#define KBlackColor         [UIColor blackColor]
#define KGrayColor          [UIColor grayColor]
#define KGray2Color         [UIColor lightGrayColor]
#define KBlueColor          [UIColor blueColor]
#define KRedColor           [UIColor redColor]
#define KYellowColor        [UIColor yellowColor]

#define RGB(r,g,b)          RGBA(r,g,b,1.0)
#define RGBA(r,g,b,a)       [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define kRandomColor        KRGBColor(arc4random_uniform(256)/255.0,arc4random_uniform(256)/255.0,arc4random_uniform(256)/255.0)        //随机色生成

#define underLineColor      RGB(159, 149, 158) //下划线颜色
#define remindLabelColor    RGB(80, 192, 244)
#define calendarMonthColor  RGB(89, 203, 253)

#define pieRedColor RGB(249, 89, 128)
#define pieBlueColor RGB(111, 121, 252)
#define pieYellowColor RGB(249, 220, 104)
#define pieGrayColor RGB(210, 210, 210)
#define pieGreenColor RGB(177, 232, 135)

#define pieBackColor RGB(61, 51, 62)
#define pieWordColor RGB(220, 82, 110)
#define pieShadeColor RGB(50, 43, 51)

#pragma mark - 字体
#define BOLDSYSTEMFONT(FONTSIZE)[UIFont boldSystemFontOfSize:FONTSIZE]
#define SYSTEMFONT(FONTSIZE)    [UIFont systemFontOfSize:FONTSIZE]
#define FONT(NAME, FONTSIZE)    [UIFont fontWithName:(NAME) size:(FONTSIZE)]
#define ChineseFont(n) [UIFont systemFontOfSize:n] // 汉字方正准圆简体

#endif /* FontAndColorMacros_h */
