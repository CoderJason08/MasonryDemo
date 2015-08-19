//
//  SideBySideViewController.m
//  MansoryDemo
//
//  Created by Jason on 15/8/19.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import "SideBySideViewController.h"

@interface SideBySideViewController ()

@end

@implementation SideBySideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIView *blackView = [[UIView alloc] init];
    blackView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:blackView];
    
    UIView *grayView = [[UIView alloc] init];
    grayView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:grayView];
    
    UIView *greenView = [[UIView alloc] init];
    greenView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:greenView];
    
    // 约束
    WS(ws);
    CGFloat width = 100;
    CGFloat height = 100;
    CGFloat padding = 20;
    [blackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(width, height));
        make.left.equalTo(ws.view).offset(padding);
        make.top.mas_equalTo(100);
    }];
    
    [grayView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(blackView);
        make.centerY.equalTo(blackView);
        make.left.equalTo(blackView.mas_right).offset(padding);
    }];
    
    [greenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(blackView);
        make.left.equalTo(blackView);
        make.top.mas_equalTo(blackView.mas_bottom).offset(padding);
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
