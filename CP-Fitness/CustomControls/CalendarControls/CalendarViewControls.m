//
//  CalendarViewControls.m
//  CP-Fitness
//
//  Created by 张敬 on 2017/10/29.
//  Copyright © 2017年 Jing Zhang. All rights reserved.
//

#import "CalendarViewControls.h"
#import "CalendarCell.h"

static NSString *identiferID = @"CalenderID";
static CGFloat itemGap = 2.f;
static CGFloat kScreenSideToButton = 30.f;
static CGFloat kScreenSideToHeadView = 10.f;
static CGFloat BtnSize = 44.f;

@interface CalendarViewControls()<UICollectionViewDelegate,UICollectionViewDataSource>



@property (nonatomic, retain) UIButton *previousButton;
@property (nonatomic, retain) UIButton *nextButton;

@property (nonatomic, retain) UILabel *monthLabel;

@property (nonatomic, retain) NSArray *weeksDayArray;

@property (nonatomic, retain) UIImageView *noDataMaskView;//no运动目标的遮罩层

@property (nonatomic, retain) UICollectionView *mCollectionView;

@property (nonatomic, retain) UIView *headView;

@property (nonatomic, assign) CGFloat itemWidth;

@end

@implementation CalendarViewControls

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.itemWidth = (KScreenWidth - itemGap *6 -kScreenSideToHeadView*2)/7;
        
        [self addSubview:self.previousButton];
        [self addSubview:self.nextButton];
        [self addSubview:self.monthLabel];
        [self addSubview:self.headView];
        [self addSubview:self.mCollectionView];
        
        [self setupAutolayout];
    }
    return self;
}

#pragma mark - UICollcetionView.Delegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 42;
}

- (UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    DDLog(@"calendar dateArray = %@",self.dateArray);
    CalendarCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identiferID forIndexPath:indexPath];
    cell.backgroundColor = KClearColor;
    cell.backgroundView = [[UIImageView alloc] initWithImage:nil];
    cell.litterBlueDot.hidden = YES;
    self.noDataMaskView.hidden = YES;
    
   
    NSInteger daysInThisMonth = [NSDate totaldaysInMonth:_date];
    NSInteger firstWeekday = [NSDate firstWeekdayInThisMonth:_date];
    
    NSInteger day = 0;
    NSInteger i = indexPath.row;
    
    //计算出当月的第一天在第一行的那一列
    if (i < firstWeekday) {
        [cell.dayLabel setText:@""];
        
        
    }else if (i > firstWeekday + daysInThisMonth - 1){
        [cell.dayLabel setText:@""];
    }else{
        day = i - firstWeekday + 1;
        [cell.dayLabel setText:[NSString stringWithFormat:@"%li",(long)day]];
    
        NSInteger isThisMonth = [NSDate compareMonth:_date];
        NSInteger isThisDay = [NSDate compareDay:_date];
        
        if (isThisMonth <= 0) {
            for (id myDay in self.dateArray) {
                if ([myDay integerValue] == day) {
                    
                    cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ac_calendar_data.png"]];
                }
            }
        }
        
        switch (isThisDay) {
            case -1:
            {
                cell.dayLabel.textColor = RGB(244, 244, 244);
            }
                
                break;
            case 0:
            {
                if (day == [NSDate day:_date])
                {
                    if ([self.dateArray containsObject:[NSNumber numberWithInteger:day]]){
                        
                        cell.backgroundView = [[UIImageView alloc] initWithImage:IMAGE_NAMED(@"ac_calendar_today.png")];
                    }else
                    {
                        cell.backgroundView = [[UIImageView alloc] initWithImage:nil];
                        cell.litterBlueDot.hidden = NO;
                    }
                    
                    cell.dayLabel.textColor = KWhiteColor;
                    
                }else if (day < [NSDate day:_date])
                {
                    cell.dayLabel.textColor = RGB(244, 244, 244);
                }else
                {
                    cell.dayLabel.textColor = KGrayColor;
                }
            }
                break;
            case 1:
            {
                cell.dayLabel.textColor = KGrayColor;
            }
                break;
                
            default:
                break;
        }
    }
    return cell;
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //点击选中的效果
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    self.noDataMaskView.hidden = YES;
    BOOL isHasSportData = YES;
    
    NSDateComponents *comp = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:self.date];
    NSInteger firstWeekday = [NSDate firstWeekdayInThisMonth:_date];
    
    NSInteger day = 0;
    NSInteger i = indexPath.row;
    day = i - firstWeekday + 1;
    
    NSInteger isThisMonth = [NSDate compareMonth:_date];
    NSInteger isThisDay = [NSDate day:[NSDate date]];
    if (![self.dateArray containsObject:[NSNumber numberWithInteger:day]]){
        
        isHasSportData = NO;
        if ((isThisMonth == 0) && (isThisDay == day) ) {
            self.noDataMaskView.hidden = YES;
        }else{
             self.noDataMaskView.hidden = NO;
            self.noDataMaskView.frame = cell.bounds;
            [cell insertSubview:self.noDataMaskView atIndex:0];
        }
    }
    if (self.calendarBlock) {
        self.calendarBlock(day, [comp month], [comp year], isHasSportData);
    }
}


#pragma mark - autolayout
- (void)setupAutolayout
{
    [self.previousButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self);
        make.left.equalTo(self.mas_left).offset(kScreenSideToButton);
        make.width.height.mas_equalTo(BtnSize);
    }];
    
    [self.nextButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.height.width.equalTo(_previousButton);
        make.right.equalTo(self.mas_right).offset(-kScreenSideToButton);
    }];
    
    [self.monthLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.right.equalTo(self);
        make.height.mas_equalTo(BtnSize);
    }];
    
    [self.headView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self).offset(kScreenSideToHeadView);
        make.right.equalTo(self).offset(-kScreenSideToHeadView);
        make.top.equalTo(_monthLabel.mas_bottom);
        make.height.mas_equalTo(BtnSize);
    }];
}

#pragma mark - event response
- (void)didClickedPreviousBtn:(id)sender
{
    [UIView transitionWithView:self duration:0.5 options:UIViewAnimationOptionTransitionCrossDissolve animations:^(void) {
        self.date = [NSDate lastMonth:_date];
    } completion:nil];
}

- (void)didClickedNextBtn:(id)sender
{
    [UIView transitionWithView:self duration:0.5 options:UIViewAnimationOptionTransitionCrossDissolve animations:^(void) {
       self.date = [NSDate nextMonth:_date];
    } completion:nil];
}

#pragma mark - setter and getter
- (void)setDate:(NSDate *)date
{
    _date = date;
    [_monthLabel setText:[NSString stringWithFormat:@"%@  %li",[self stringOfMonthInEnglish:(long)[NSDate month:date]],(long)[NSDate year:date]]];
    [_mCollectionView reloadData];
}

- (UIButton *)previousButton
{
    if (!_previousButton) {
        
        _previousButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _previousButton.zj_acceptEventInterval = 1;
        [_previousButton setImageEdgeInsets:UIEdgeInsetsMake(13, 32, 10, 0)];
        [_previousButton setImage:IMAGE_NAMED(@"main_back.png") forState:UIControlStateNormal];
        [_previousButton addTarget:self action:@selector(didClickedPreviousBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _previousButton;
}

- (UIButton *)nextButton
{
    if (!_nextButton) {
        
        _nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _nextButton.zj_acceptEventInterval = 1;
        [_nextButton setImage:IMAGE_NAMED(@"go.png") forState:UIControlStateNormal];
        [_nextButton setImageEdgeInsets:UIEdgeInsetsMake(13, 0, 10, 32)];
        [_nextButton addTarget:self action:@selector(didClickedNextBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _nextButton;
}

- (UILabel *)monthLabel
{
    if (!_monthLabel) {
        
        _monthLabel = [[UILabel alloc] init];
        _monthLabel.textColor = calendarMonthColor;
        _monthLabel.textAlignment = NSTextAlignmentCenter;
        _monthLabel.font = SYSTEMFONT(25);
    }
    return _monthLabel;
}

- (UIImageView *)noDataMaskView
{
    if (!_noDataMaskView) {
        
        _noDataMaskView = [[UIImageView alloc] init];
        _noDataMaskView.image = IMAGE_NAMED(@"ac_calendar_nodata.png");
        
    }
    return _noDataMaskView;
}

- (UICollectionView *)mCollectionView
{
    if (!_mCollectionView) {
        
        UICollectionViewFlowLayout *mLayout = [[UICollectionViewFlowLayout alloc] init];
        
        mLayout.sectionInset = UIEdgeInsetsMake(0, 10, 10, 10);
        mLayout.itemSize = CGSizeMake(_itemWidth -5, _itemWidth-5);
        mLayout.minimumLineSpacing = itemGap;
        mLayout.minimumInteritemSpacing = itemGap;
    
       
        _mCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 90, KScreenWidth, 355) collectionViewLayout:mLayout];
        _mCollectionView.backgroundColor  = KClearColor;
        _mCollectionView.dataSource = self;
        _mCollectionView.delegate = self;
        
        [_mCollectionView registerClass:[CalendarCell class] forCellWithReuseIdentifier:identiferID];
    }
    return _mCollectionView;
}

- (UIView *)headView
{
    if (!_headView) {
        
        _headView = [[UIView alloc] init];
        _headView.backgroundColor = RGB(66, 53, 70);
        [_headView.layer setMasksToBounds:YES];
        [_headView.layer setCornerRadius:4.0]; //设置矩形四个圆角半径
        
        for (int i = 0; i <self.weeksDayArray.count; i++)
        {
            UILabel *dayLab = [[UILabel alloc] init];
            dayLab.textAlignment = NSTextAlignmentCenter;
            dayLab.textColor = calendarMonthColor;
            dayLab.font = SYSTEMFONT(18);
            dayLab.text = _weeksDayArray[i];
            dayLab.frame = CGRectMake((itemGap+_itemWidth)*i, 3, _itemWidth,_itemWidth);

            [_headView addSubview:dayLab];
        }
    }
    return _headView;
}

- (NSArray *)weeksDayArray
{
    if (!_weeksDayArray) {
        
        _weeksDayArray = @[@"Sun", @"Mon", @"Tue", @"Wed", @"Thu", @"Fri", @"Sat"];
    }
    return _weeksDayArray;
}

#pragma mark - other methods
- (NSString *)stringOfMonthInEnglish:(NSUInteger)month {
    NSAssert(month >= 1 && month <= 12, @"Invalid month: %lu", (unsigned long) month);
    static NSArray *Strings;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Strings = @[@"Jan", @"Feb", @"Mar", @"Apr", @"May", @"Jun", @"Jul", @"Aug", @"Sept", @"Oct", @"Nov", @"Dec"];
    });
    
    return Strings[month - 1];
}
- (BOOL)currentDataCompareWithDataByMonth:(NSDate *)compareData{
    NSInteger currentMonth = [NSDate month:[NSDate date]];
    NSInteger compareMonth = [NSDate month:compareData];
    
    if (currentMonth - compareMonth == 0 ) {
        return YES;
    }
    else{
        return NO;
    }
    return NO;
}

@end
