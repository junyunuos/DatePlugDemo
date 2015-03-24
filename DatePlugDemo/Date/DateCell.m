//
//  DateCell.m
//  YY_yijia
//
//  Created by guoqiang on 15-2-3.
//  Copyright (c) 2015年 com.yiyou. All rights reserved.
//

#import "DateCell.h"
#import "UIColor+DSColor.h"

@implementation DateCell{

    int this_year;
    int this_month;
    int today;
    
    int year;
    int month;
    int day;
    
    //存储时间label
    NSMutableArray * list0;
    NSMutableArray * list1;
    NSMutableArray * list2;
    NSMutableArray * list3;
    NSMutableArray * list4;
    NSMutableArray * list5;
    
    //存储view
    NSMutableArray * listV0;
    NSMutableArray * listV1;
    NSMutableArray * listV2;
    NSMutableArray * listV3;
    NSMutableArray * listV4;
    NSMutableArray * listV5;
    
    //存储是否已订状态
    NSMutableArray * listL0;
    NSMutableArray * listL1;
    NSMutableArray * listL2;
    NSMutableArray * listL3;
    NSMutableArray * listL4;
    NSMutableArray * listL5;
    
    NSMutableArray * all_list;
    
    int first_day_in_row;
    NSMutableArray * orderDates;
    NSMutableArray * allAfterTodayInMoth;
    NSMutableArray* excludeDates;
}

- (void)awakeFromNib {
    list0 = [[NSMutableArray alloc]init];//存储第一行
    list1 = [[NSMutableArray alloc]init];//存储第二行
    list2 = [[NSMutableArray alloc]init];
    list3 = [[NSMutableArray alloc]init];
    list4 = [[NSMutableArray alloc]init];
    list5 = [[NSMutableArray alloc]init];
    
    listV0 = [[NSMutableArray alloc]init];
    listV1 = [[NSMutableArray alloc]init];
    listV2 = [[NSMutableArray alloc]init];
    listV3 = [[NSMutableArray alloc]init];
    listV4 = [[NSMutableArray alloc]init];
    listV5 = [[NSMutableArray alloc]init];
    
    listL0 = [[NSMutableArray alloc]init];
    listL1 = [[NSMutableArray alloc]init];
    listL2 = [[NSMutableArray alloc]init];
    listL3 = [[NSMutableArray alloc]init];
    listL4 = [[NSMutableArray alloc]init];
    listL5 = [[NSMutableArray alloc]init];
    
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
    
    int labelTag=1100;
    int slTag=1200;
    int t=0;
    int slt=0;
    for (int i=1000; i<1007; i++) {//根据tag 获取UIView,UILabel,第一列
        UIView* v=(UIView*)[self viewWithTag:i];
        UILabel* l=(UILabel*)[v viewWithTag:labelTag+t];
        UILabel* sl=(UILabel*)[v viewWithTag:slTag+slt];
        
        [list0 addObject:l];
        [listV0 addObject:v];
        [listL0 addObject:sl];
        t++;
        slt++;
        
        
    }
    int labelTag2=2100;
    int slTag2=2200;
    int t2=0;
    int slt2=0;
    for (int i=2000; i<2007; i++) {
        UIView* v=(UIView*)[self viewWithTag:i];
        UILabel* l=(UILabel*)[v viewWithTag:labelTag2+t2];
        UILabel* sl=(UILabel*)[v viewWithTag:slTag2+slt2];
        [list1 addObject:l];
        [listV1 addObject:v];
        [listL1 addObject:sl];
        t2++;
        slt2++;
    }
    int labelTag3=3100;
    int slTag3=3200;
    int t3=0;
    int slt3=0;
    for (int i=3000; i<3007; i++) {
        UIView* v=(UIView*)[self viewWithTag:i];
        UILabel* l=(UILabel*)[v viewWithTag:labelTag3+t3];
        UILabel* sl=(UILabel*)[v viewWithTag:slTag3+slt3];
        [list2 addObject:l];
        [listV2 addObject:v];
        [listL2 addObject:sl];
        t3++;
        slt3++;
    }
    int labelTag4=4100;
    int slTag4=4200;
    int t4=0;
    int slt4=0;
    for (int i=4000; i<4007; i++) {
        UIView* v=(UIView*)[self viewWithTag:i];
        UILabel* l=(UILabel*)[v viewWithTag:labelTag4+t4];
        UILabel* sl=(UILabel*)[v viewWithTag:slTag4+slt4];
        [list3 addObject:l];
        [listV3 addObject:v];
        [listL3 addObject:sl];
        t4++;
        slt4++;
    }
    int labelTag5=5100;
    int slTag5=5200;
    int t5=0;
    int slt5=0;
    for (int i=5000; i<5007; i++) {
        UIView* v=(UIView*)[self viewWithTag:i];
        UILabel* l=(UILabel*)[v viewWithTag:labelTag5+t5];
        UILabel* sl=(UILabel*)[v viewWithTag:slTag5+slt5];
        [list4 addObject:l];
        [listV4 addObject:v];
        [listL4 addObject:sl];
        t5++;
        slt5++;
    }
    int labelTag6=6100;
    int slTag6=6200;
    int t6=0;
    int slt6=0;
    for (int i=6000; i<6007; i++) {
        UIView* v=(UIView*)[self viewWithTag:i];
        UILabel* l=(UILabel*)[v viewWithTag:labelTag6+t6];
        UILabel* sl=(UILabel*)[v viewWithTag:slTag6+slt6];
        [list5 addObject:l];
        [listV5 addObject:v];
        [listL5 addObject:sl];
        t6++;
        slt6++;
    }
}

-(void)setDate:(NSDate*)date{
    
    //NSDate* date=[NSDate alloc];
    
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
        UIView* v=[listV0 objectAtIndex:i];
        v.hidden=YES;
        UILabel * l = [list0 objectAtIndex:i];
        l.hidden = YES;
        start ++;
        first_day_in_row = start;
    }
    
    int reserveDay=4;
    
    int lastday=1;
    for (int i = start; i < 7; i++) {
        //背景
        UIView* v=[listV0 objectAtIndex:i];
       // v.hidden=YES;
        v.backgroundColor=[UIColor whiteColor];
        
        //预订状态
        UILabel* sl=[listL0 objectAtIndex:i];
        sl.text=@"";
        
        UILabel* l=[list0 objectAtIndex:i];
        l.hidden=NO;
        l.tag=lastday;
        
        l.text=[NSString stringWithFormat:@"%d",i-start+1];
        if(lastday<day){
            l.textColor=[UIColor grayColor];
        }
        if(lastday==reserveDay){
            v.backgroundColor=[UIColor colorWithHexRGB:@"F3F2F2"];
            sl.text=@"已订";
        }
        lastday+=1;
    }
    for (int i = 0; i < 7; i++) {
        UIView* v=[listV1 objectAtIndex:i];
       // v.hidden=YES;
        v.backgroundColor=[UIColor whiteColor];
        
        //预订状态
        UILabel* sl=[listL1 objectAtIndex:i];
        sl.text=@"";
        
        UILabel* l=[list1 objectAtIndex:i];
        l.hidden=NO;
        l.tag=lastday;
        l.text=[NSString stringWithFormat:@"%d",lastday];
        
        if(lastday<day){
            l.textColor=[UIColor grayColor];
        }
        lastday+=1;

    }
    for (int i = 0; i < 7; i++) {
        
        UIView* v=[listV2 objectAtIndex:i];
       // v.hidden=YES;
        v.backgroundColor=[UIColor whiteColor];
        
        //预订状态
        UILabel* sl=[listL2 objectAtIndex:i];
        sl.text=@"";
        
        UILabel* l=[list2 objectAtIndex:i];
        l.hidden=NO;
        l.tag=lastday;
        l.text=[NSString stringWithFormat:@"%d",lastday];
        
        if(lastday<day){
            l.textColor=[UIColor grayColor];
        }
        lastday+=1;
        
        
    }
    for (int i = 0; i < 7; i++) {
        
        UIView* v=[listV3 objectAtIndex:i];
        //v.hidden=YES;
        v.backgroundColor=[UIColor whiteColor];
        
        //预订状态
        UILabel* sl=[listL3 objectAtIndex:i];
        sl.text=@"";
        
        UILabel* l=[list3 objectAtIndex:i];
        l.hidden=NO;
        l.tag=lastday;
        l.text=[NSString stringWithFormat:@"%d",lastday];
        if(lastday<day){
            l.textColor=[UIColor grayColor];
        }
        lastday+=1;
    }
    for (int i = 0; i < 7; i++) {
        //时间背景
        UIView* v=[listV4 objectAtIndex:i];
       // v.hidden=YES;
        v.backgroundColor=[UIColor whiteColor];
        
        //预订状态
        UILabel* sl=[listL4 objectAtIndex:i];
        sl.text=@"";
        
        UILabel* l=[list4 objectAtIndex:i];
        l.hidden=NO;
        l.tag=lastday;
        
        if (lastday <= numberOfDaysInMonth) {
                l.text=[NSString stringWithFormat:@"%d",lastday];
            
            if(lastday<day){//如果号数小余当前号数、
                l.textColor=[UIColor grayColor];
            }
            lastday ++;
            
        }
        else
        {
            v.hidden=YES;
            l.hidden = YES;
            l.text=@"";
        }
    }
    for (int i = 0; i < 7; i++) {
        
        //时间背景
        UIView* v=[listV5 objectAtIndex:i];
        v.backgroundColor=[UIColor whiteColor];
        //v.hidden=YES;
        //预订状态
        UILabel* sl=[listL5 objectAtIndex:i];
        sl.text=@"";
        
        UILabel* l=[list5 objectAtIndex:i];
        l.hidden=NO;
        l.tag=lastday;
        
        if (lastday <= numberOfDaysInMonth) {
            l.text=[NSString stringWithFormat:@"%d",lastday];
            
            if(lastday<day){//如果号数小余当前号数、
                l.textColor=[UIColor grayColor];
            }
            lastday ++;
        }
        else
        {   v.hidden=YES;
            l.hidden = YES;
            l.text=@"";
        }
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
