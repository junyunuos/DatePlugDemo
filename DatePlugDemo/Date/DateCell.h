//
//  DateCell.h
//  YY_yijia
//
//  Created by guoqiang on 15-2-3.
//  Copyright (c) 2015年 com.yiyou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DateCell : UITableViewCell
-(void)setDate:(NSDate*)date;
@property (weak, nonatomic) IBOutlet UILabel *currentDateLabel;
@property (assign, nonatomic) int this_year;
@property (assign, nonatomic) int this_month;
@property (assign, nonatomic) int today;

@property (assign, nonatomic) int year;
@property (assign, nonatomic) int month;
@property (assign, nonatomic) int day;
@end
