//
//  DatePlugCell.m
//  YY_yijia
//
//  Created by guoqiang on 15-2-3.
//  Copyright (c) 2015年 com.yiyou. All rights reserved.
//

#import "DatePlugCell.h"

@implementation DatePlugCell{

    int this_year;
    int this_month;
    int today;
    
    int year;
    int month;
    int day;

    NSMutableArray * list0;
    NSMutableArray * list1;
    NSMutableArray * list2;
    NSMutableArray * list3;
    NSMutableArray * list4;
    NSMutableArray * list5;
    NSMutableArray * all_list;
    
    int first_day_in_row;
    NSMutableArray * orderDates;
    NSMutableArray * allAfterTodayInMoth;
    NSMutableArray* excludeDates;

}
- (void)awakeFromNib {
    

    list0 = [[NSMutableArray alloc]init];
    list1 = [[NSMutableArray alloc]init];
    list2 = [[NSMutableArray alloc]init];
    list3 = [[NSMutableArray alloc]init];
    list4 = [[NSMutableArray alloc]init];
    list5 = [[NSMutableArray alloc]init];
    orderDates =[[NSMutableArray alloc]init];
    excludeDates =[[NSMutableArray alloc]init];
    allAfterTodayInMoth =[[NSMutableArray alloc]init];
    
    all_list = [[NSMutableArray alloc]init];
    [all_list addObject:list0];
    [all_list addObject:list1];
    [all_list addObject:list2];
    [all_list addObject:list3];
    [all_list addObject:list4];
    [all_list addObject:list5];
    
    
    for (int i=1000; i<1007; i++) {
        UIButton * v =(UIButton*) [self viewWithTag:i];
        [list0 addObject:v];
    }
    for (int i=2000; i<2007; i++) {
        UIButton * v = (UIButton*)[self viewWithTag:i];
        [list1 addObject:v];
    }
    for (int i=3000; i<3007; i++) {
        UIButton * v = (UIButton*)[self viewWithTag:i];
        [list2 addObject:v];
    }
    for (int i=4000; i<4007; i++) {
        UIButton * v = (UIButton*)[self viewWithTag:i];
        [list3 addObject:v];
    }
    for (int i=5000; i<5007; i++) {
        UIButton * v = (UIButton*)[self viewWithTag:i];
        [list4 addObject:v];
    }
    for (int i=6000; i<6007; i++) {
        UIButton * v = (UIButton*)[self viewWithTag:i];
        [list5 addObject:v];
    }
    //[self setDate];
}

-(void)setDate:(NSDate*)date{
    
    [allAfterTodayInMoth removeAllObjects];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit | NSWeekdayCalendarUnit;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:date];
    
    int weekday = [dateComponent weekday];
    
    year = [dateComponent year];
    month = [dateComponent month];
    day = [dateComponent day];
    
    int m_l = month -1;
    int m_r = month +1;
    if (m_l < 1) {
        m_l =12;
    }
    if (m_r > 12) {
        m_r = 1;
    }

    _currentDateLabel.text=[NSString stringWithFormat:@"%d年%d月",year,month];
    
    weekday = weekday -1;
    NSRange range = [calendar rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:date];
    
    NSUInteger numberOfDaysInMonth = range.length;
    
    int weekday_of_firstDay = (7 - ((day + (7 - weekday)) -1)%7)%7;
    
    int start = 0;
    for (int i = 0; i < weekday_of_firstDay; i++) {
        UIButton * v = [list0 objectAtIndex:i];
        
        v.hidden = YES;
        start ++;
        first_day_in_row = start;
    }
    
    int lastday=1;
    for (int i = start; i < 7; i++) {
        UIButton * v = [list0 objectAtIndex:i];
        v.hidden = NO;
        v.tag = lastday;
        [v setTitle: [NSString stringWithFormat:@"%d",i-start+1] forState: UIControlStateNormal];//;
        
        NSLog(@"%d",lastday);
        
        if(lastday<day){
            [v setTitleColor:[UIColor grayColor] forState:0];
        }
        lastday+=1;
//        if (lastday < day) {
//           // [self setButtonBg:v withType:gray];
//        }else
//           // [self addDayToAllAfterTodayInMoth:lastday withTheMonth:month withThYear:year withUIButton:v];
//        lastday+=1;
        
    }
    for (int i = 0; i < 7; i++) {
        UIButton * v = [list1 objectAtIndex:i];
        v.hidden = NO;
        v.tag = lastday;
        [v setTitle: [NSString stringWithFormat:@"%d",lastday] forState: UIControlStateNormal];//;
        
        if(lastday<day){//如果号数小余当前号数、
            [v setTitleColor:[UIColor grayColor] forState:0];
        }
        lastday+=1;
        
//        if (lastday < day) {
//            //[self setButtonBg:v withType:gray];
//        }else
//          //  [self addDayToAllAfterTodayInMoth:lastday withTheMonth:month withThYear:year withUIButton:v];
        
        
    }
    for (int i = 0; i < 7; i++) {
        UIButton * v = [list2 objectAtIndex:i];
        v.hidden = NO;
        v.tag = lastday;
        [v setTitle: [NSString stringWithFormat:@"%d",lastday] forState: UIControlStateNormal];//;
        
        if(lastday<day){//如果号数小余当前号数、
            [v setTitleColor:[UIColor grayColor] forState:0];
        }
        lastday+=1;
//        if (lastday < day) {
//            //[self setButtonBg:v withType:gray];
//        }else
//           // [self addDayToAllAfterTodayInMoth:lastday withTheMonth:month withThYear:year withUIButton:v];
        
        
    }
    for (int i = 0; i < 7; i++) {
        UIButton * v = [list3 objectAtIndex:i];
        v.hidden = NO;
        v.tag = lastday;
        
        [v setTitle: [NSString stringWithFormat:@"%d",lastday] forState: UIControlStateNormal];//;
        
        if(lastday<day){//如果号数小余当前号数、
            [v setTitleColor:[UIColor grayColor] forState:0];
        }
        lastday ++;
//        if (lastday < day) {
//           // [self setButtonBg:v withType:gray];
//        }else
//            //[self addDayToAllAfterTodayInMoth:lastday withTheMonth:month withThYear:year withUIButton:v];
        
        //lastday ++;
    }
    for (int i = 0; i < 7; i++) {
        UIButton * v = [list4 objectAtIndex:i];
        v.hidden = NO;
        v.tag = lastday;
        if (lastday <= numberOfDaysInMonth) {
            [v setTitle: [NSString stringWithFormat:@"%d",lastday] forState: UIControlStateNormal];//;
           
            if(lastday<day){//如果号数小余当前号数、
                [v setTitleColor:[UIColor grayColor] forState:0];
            }
             lastday ++;
            
//            if (lastday < day) {
//              //  [self setButtonBg:v withType:gray];
//            }else
//               // [self addDayToAllAfterTodayInMoth:lastday withTheMonth:month withThYear:year withUIButton:v];
            
           
        }
        else
        {
            v.hidden = YES;
          //  [self setButtonBg:v withType:gray];
            [v setTitle:@"" forState:UIControlStateNormal];
        }
    }
    
    for (int i = 0; i < 7; i++) {
        UIButton * v = [list5 objectAtIndex:i];
        v.hidden = NO;
        v.tag = lastday;
        if (lastday <= numberOfDaysInMonth) {
            [v setTitle: [NSString stringWithFormat:@"%d",lastday] forState: UIControlStateNormal];//;
            
            if(lastday<day){//如果号数小余当前号数、
                [v setTitleColor:[UIColor grayColor] forState:0];
            }
            lastday ++;
//            if (lastday < day) {
//               // [self setButtonBg:v withType:gray];
//            }else
//              //  [self addDayToAllAfterTodayInMoth:lastday withTheMonth:month withThYear:year withUIButton:v];
            
        }
        else
        {
            v.hidden = YES;
           // [self setButtonBg:v withType:gray];
            [v setTitle:@"" forState:UIControlStateNormal];
        }
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
