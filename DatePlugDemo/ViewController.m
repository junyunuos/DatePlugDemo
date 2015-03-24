//
//  ViewController.m
//  DatePlugDemo
//
//  Created by guoqiang on 15-2-3.
//  Copyright (c) 2015年 guoqiang. All rights reserved.
//

#import "ViewController.h"
#import "DatePlugViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //日期插件 demo
    DatePlugViewController* datePlug=[[DatePlugViewController alloc] init];
   // UINavigationController* nav=[[UINavigationController alloc] initWithRootViewController:datePlug];
    
   
   [self.navigationController pushViewController:datePlug animated:YES];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
