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

@property (nonatomic, retain) UIImageView *maskView;  //遮罩层

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
    CalendarCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identiferID forIndexPath:indexPath];
    cell.backgroundColor = KClearColor;
   
    NSInteger daysInThisMonth = [NSData totaldaysInMonth:_date];
    NSInteger firstWeekday = [NSData  firstWeekdayInThisMonth:_date];
    
    NSInteger day = 0;
    NSInteger i = indexPath.row;
    
    if (i < firstWeekday) {
        [cell.dayLabel setText:@""];
        
    }else if (i > firstWeekday + daysInThisMonth - 1){
        [cell.dayLabel setText:@""];
    }else{
        day = i - firstWeekday + 1;
        [cell.dayLabel setText:[NSString stringWithFormat:@"%li",(long)day]];
        
        //this month
        if ([_today isEqualToDate:_date])
        {
            if (day == [NSData  day:_date])
            {
                self.maskView.frame = cell.bounds;
                [cell insertSubview:self.maskView atIndex:0];
                
            }
            else if (day > [NSData  day:_date])
            {
                cell.dayLabel.textColor = underLineColor;
            }
        }
        else if ([_today compare:_date] == NSOrderedAscending)
        {
        }
    }
    
    return cell;
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        NSInteger daysInThisMonth = [NSData totaldaysInMonth:_date];
        NSInteger firstWeekday = [NSData firstWeekdayInThisMonth:_date];
        
        NSInteger day = 0;
        NSInteger i = indexPath.row;
        
        if (i >= firstWeekday && i <= firstWeekday + daysInThisMonth - 1) {
            day = i - firstWeekday + 1;
            
            //this month
            if ([_today isEqualToDate:_date]) {
                if (day <= [NSData day:_date]) {
                    return YES;
                }
            } else if ([_today compare:_date] == NSOrderedDescending) {
                return YES;
            }
        }
    }
    return NO;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //点击选中的效果
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
   
    if (self.maskView.hidden)
        self.maskView.hidden = NO;
    
    [cell insertSubview:self.maskView atIndex:0];

    NSDateComponents *comp = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:self.date];
    NSInteger firstWeekday = [NSData firstWeekdayInThisMonth:_date];
    
    NSInteger day = 0;
    NSInteger i = indexPath.row;
    day = i - firstWeekday + 1;
    if (self.calendarBlock) {
        self.calendarBlock(day, [comp month], [comp year]);
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
        self.date = [NSData lastMonth:self.date];
        
        if ([_today isEqualToDate:_date])
        {
            self.maskView.hidden = NO;
        }else
        {
            self.maskView.hidden = YES;
        }
    } completion:nil];
}

- (void)didClickedNextBtn:(id)sender
{
    [UIView transitionWithView:self duration:0.5 options:UIViewAnimationOptionTransitionCrossDissolve animations:^(void) {
        self.date = [NSData nextMonth:self.date];
        if ([_today isEqualToDate:_date])
        {
            self.maskView.hidden = NO;
        }else
        {
            self.maskView.hidden = YES;
        }
    } completion:nil];
}

#pragma mark - setter and getter
- (void)setDate:(NSDate *)date
{
    _date = date;
    [_monthLabel setText:[NSString stringWithFormat:@"%@  %li",[self stringOfMonthInEnglish:(long)[NSData month:date]],(long)[NSData year:date]]];
    [_mCollectionView reloadData];
}


- (UIButton *)previousButton
{
    if (!_previousButton) {
        
        _previousButton = [UIButton buttonWithType:UIButtonTypeCustom];
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

- (UIImageView *)maskView
{
    if (!_maskView) {
        
        _maskView = [[UIImageView alloc] init];
        _maskView.image = IMAGE_NAMED(@"ac_calendar_checked.png");
        
    }
    return _maskView;
}

- (UICollectionView *)mCollectionView
{
    if (!_mCollectionView) {
        
        UICollectionViewFlowLayout *mLayout = [[UICollectionViewFlowLayout alloc] init];
        
        mLayout.sectionInset = UIEdgeInsetsMake(0, 10, 10, 10);
        mLayout.itemSize = CGSizeMake(_itemWidth, _itemWidth);
        mLayout.minimumLineSpacing = itemGap;
        mLayout.minimumInteritemSpacing = itemGap;
    
       
        _mCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 100, KScreenWidth, 375) collectionViewLayout:mLayout];
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
            dayLab.frame = CGRectMake((itemGap+_itemWidth)*i, 0, _itemWidth,_itemWidth-10);

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
- (BOOL)currentDataCompareWithDataByMonth:(NSData *)compareData{
    NSInteger currentMonth = [NSData month:[NSData data]];
    NSInteger compareMonth = [NSData month:compareData];
    
    if (currentMonth - compareMonth == 0 ) {
        return YES;
    }
    else{
        return NO;
    }
    return NO;
}

@end
