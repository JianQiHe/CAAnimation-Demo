//
//  ViewController.m
//  CAAnimation-Demo
//
//  Created by HJQ on 16/8/29.
//  Copyright © 2016年 何建启. All rights reserved.
//

#import "ViewController.h"
#import "ViewController1.h"
#import "ViewController2.h"
#import "ViewController3.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    [self createView];
    
}

- (void)createView {
    
    for (int i = 0; i < 10; i ++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
        [button setTitle:[NSString stringWithFormat:@"%d", i + 1] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        button.frame = CGRectMake(30 + (70 + 10)*(i%4), 100 + (40 + 10) * (i/4), 70, 40);
        button.titleLabel.font = [UIFont boldSystemFontOfSize:20];
        button.tag = i;
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
}

// 点击事件
- (void)buttonClick:(UIButton *)sender {

    switch (sender.tag) {
        case 0:
        {
            // 平移动画
            ViewController1 *vc1 = [ViewController1 new];
            vc1.title = @"View1";
            vc1.view.backgroundColor = [UIColor whiteColor];
            [self.navigationController pushViewController:vc1 animated:YES];
        }
            break;
        case 1:
        {
            // 缩放动画
            ViewController2 *vc2 = [ViewController2 new];
            vc2.title = @"View2";
            vc2.view.backgroundColor = [UIColor whiteColor];
            [self.navigationController pushViewController:vc2 animated:YES];
        }
            break;
        case 2:
        {
            // 旋转动画
            ViewController3 *vc3 = [ViewController3 new];
            vc3.title = @"View3";
            vc3.view.backgroundColor = [UIColor whiteColor];
            [self.navigationController pushViewController:vc3 animated:YES];
        }
            break;
        case 3:
        {
            
        }
            break;
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
