//
//  DatePlugViewController.m
//  YY_yijia
//
//  Created by guoqiang on 15-2-2.
//  Copyright (c) 2015年 com.yiyou. All rights reserved.
//

#import "DatePlugViewController.h"
#import "UIColor+DSColor.h"
#import "DatePlugCell.h"
#import "DateCell.h"


@interface DatePlugViewController (){

    UITableView* _tableView;
    
    NSMutableArray* _dateArr;
}
@end

@implementation DatePlugViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor colorWithHexRGB:@"F3F2F2"];
    [self initView];
    self.title=@"可订日期";
    [self operationDate];
    
}

#pragma 操作时间
-(void)operationDate{

    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit | NSWeekdayCalendarUnit;
    
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];//实例化一个NSDateFormatter对象
    [dateFormat setDateFormat:@"yyyy-MM-dd"];//设定时间格式
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:[NSDate date]];
    
    int year=[dateComponent year];
    int month=[dateComponent month];
    
    NSString *dateString = [dateFormat stringFromDate:[NSDate date]]; //求出当天的时间字符串，
    _dateArr=[[NSMutableArray alloc] initWithObjects:dateString, nil];
    for(int i=0;i<4;i++){
        month++;
        [_dateArr addObject:[NSString stringWithFormat:@"%d-%d-%@",year,month,@"1"]];
    }

}
-(void)initView{

    UIView* weekBackView=[[UIView alloc] initWithFrame:CGRectMake(0, 65, self.view.frame.size.width, 50)];
    weekBackView.backgroundColor=[UIColor colorWithHexRGB:@"F3F2F2"];
    [self.view addSubview:weekBackView];
    CGFloat sx=0;
    CGFloat sc=0;CGFloat sw=0;
    NSArray* dateArr=[[NSArray alloc] initWithObjects:@"日",@"一",@"二",@"三",@"四",@"五",@"六",nil];
    for(int i=0;i<7;i++){
        sw=self.view.frame.size.width-20*7;
        sc=sw/8;
        sx=22+i*20+sc*i;
        UILabel* label=[[UILabel alloc] initWithFrame:CGRectMake(sx, 15, 20, 20)];
        //label.backgroundColor=[UIColor redColor];
        [weekBackView addSubview:label];
        label.text=dateArr[i];
    }
    
    _tableView=[[UITableView alloc] initWithFrame:CGRectMake(0, weekBackView.frame.size.height+weekBackView.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height)];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [self.view addSubview:_tableView];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

   return [_dateArr count];
   // return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 380;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    
    //第一种
    DatePlugCell* cell=(DatePlugCell*)[tableView dequeueReusableHeaderFooterViewWithIdentifier:@"DatePlugCell"];
    if(cell==nil){
       cell=[[[NSBundle mainBundle] loadNibNamed:@"DatePlugCell" owner:nil options:nil] lastObject];
    }
    
    
    //第二种
//    DateCell* cell=( DateCell*)[tableView dequeueReusableHeaderFooterViewWithIdentifier:@"DateCell"];
//    if(cell==nil){
//        cell=[[[NSBundle mainBundle] loadNibNamed:@"DateCell" owner:nil options:nil] lastObject];
//    }
    

    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSTimeZone *timeZone = [NSTimeZone localTimeZone];
    
    [formatter setTimeZone:timeZone];
    [formatter setDateFormat : @"yyyy-MM-dd"];
    
    //NSString* dateStr=@"2014-11-5";
    NSDate* date=[formatter dateFromString:_dateArr[indexPath.row]];
    [cell setDate:date];
    
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


@end
