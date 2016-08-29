//
//  ViewController2.m
//  CAAnimation-Demo
//
//  Created by HJQ on 16/8/29.
//  Copyright © 2016年 何建启. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()

@property (nonatomic, strong) CALayer *mylayer;

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //---------------------缩放动画------------------------
    
    // 创建layer
    CALayer *myLayer = [CALayer layer];
    
    //设置layer 属性
    myLayer.bounds = CGRectMake(100, 100, 150, 60);
    myLayer.backgroundColor = [UIColor yellowColor].CGColor;
    myLayer.position = CGPointMake(100, 100);
    myLayer.anchorPoint = CGPointZero;
    myLayer.cornerRadius = 40;
    
    // 添加layer
    [self.view.layer addSublayer:myLayer];
    self.mylayer = myLayer;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    // 1.创建动画
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"bounds"];
    // 1.1设置动画执行时间
    anima.duration = 2.0;
    // 1.2设置动画执行完毕后不删除动画
    anima.removedOnCompletion = NO;
    // 1.3设置保存动画的最新状态
    anima.fillMode = kCAFillModeForwards;
    // 1.4修改属性，执行动画
    anima.fromValue = [NSValue valueWithCGRect:CGRectMake(100, 100, 150, 60)];
    anima.toValue = [NSValue valueWithCGRect:CGRectMake(100, 100, 200, 300)];
    
    // 2.添加动画到layer
    [self.mylayer addAnimation:anima forKey:nil];
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
