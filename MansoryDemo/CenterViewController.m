//
//  CenterViewController.m
//  MansoryDemo
//
//  Created by Jason on 15/8/19.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import "CenterViewController.h"

@interface CenterViewController ()

@end

@implementation CenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIView *blackView = [[UIView alloc] init];
    blackView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:blackView];
    
    UIView *grayView = [[UIView alloc] init];
    grayView.backgroundColor = [UIColor grayColor];
    [blackView addSubview:grayView];
    
    // 约束
    WS(ws);
    CGFloat width = 200;
    CGFloat height = 200;
    [blackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(width, height));
        make.center.equalTo(ws.view);
    }];
    
    [grayView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(blackView).insets(UIEdgeInsetsMake(10, 10, 10, 10));
        
        /**********  有点难理解么?看看这个  **********/
        
//        make.top.equalTo(blackView).offset(10);
//        make.left.equalTo(blackView).offset(10);
//        make.bottom.equalTo(blackView).offset(-10);
//        make.right.equalTo(blackView).offset(-10);
        
        /**********  或者这个  **********/
        
//        make.top.left.bottom.right.equalTo(blackView).insets(UIEdgeInsetsMake(10, 10, 10, 10));
//        make.size.equalTo(blackView);
//        make.center.equalTo(blackView);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
