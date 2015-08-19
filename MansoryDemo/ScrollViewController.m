//
//  ScrollViewController.m
//  MansoryDemo
//
//  Created by Jason on 15/8/19.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import "ScrollViewController.h"

@interface ScrollViewController ()

@end

@implementation ScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UIScrollView *scrollView= [[UIScrollView alloc] init];
    scrollView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:scrollView];
        
    // 利用container作为scrollView的容器,实现自动计算scrollView的contentSize
    UIView *container = [[UIView alloc] init];
    container.backgroundColor = [UIColor blackColor];
    [scrollView addSubview:container];
    
    WS(ws);
    CGFloat width = 200;
    CGFloat height = 200;
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(width, height));
        make.center.equalTo(ws.view);
    }];
    
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(scrollView);
        make.width.equalTo(scrollView);
    }];
    
    UIView *lastView = nil;
    for (int i = 0; i < 5; i ++) {
        UIView *subView = [[UIView alloc] init];
        [container addSubview:subView];
        // 随机色
        subView.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256) / 255.0
                                                   green:arc4random_uniform(256) / 255.0
                                                   blue:arc4random_uniform(256) / 255.0
                                                   alpha:1];
        [subView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(container);
            // 随机高度
            make.height.mas_equalTo(arc4random_uniform(50) + 30);
            
            if (lastView) {
                make.top.mas_equalTo(lastView.mas_bottom);
            }else {
                make.top.equalTo(container.mas_top);
            }
        }];
        lastView = subView;
    }
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(lastView.mas_bottom);
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
