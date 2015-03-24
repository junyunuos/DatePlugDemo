//
//  DatePlugViewController.h
//  YY_yijia
//
//  Created by guoqiang on 15-2-2.
//  Copyright (c) 2015年 com.yiyou. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DatePlugViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>


@property (weak, nonatomic) IBOutlet UILabel *currentDateLabel;

@end
