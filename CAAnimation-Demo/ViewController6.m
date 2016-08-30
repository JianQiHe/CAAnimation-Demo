//
//  ViewController6.m
//  CAAnimation-Demo
//
//  Created by hjq on 16/8/30.
//  Copyright © 2016年 何建启. All rights reserved.
//

#import "ViewController6.h"

@interface ViewController6 ()

@property (nonatomic, strong) UIView *customView;

@end

@implementation ViewController6

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _customView = [UIView new];
    _customView.frame = CGRectMake(100, 100, 100, 50);
    _customView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:_customView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    /*--------------------UIView动画---------------------
     
    // 打印动画块的位置
    NSLog(@"动画执行之前的位置：%@", NSStringFromCGPoint(self.customView.center));
    
    // 首尾式动画
    [UIView beginAnimations:nil context:nil];
    
    // 执行动画
    // 设置动画执行时间
    [UIView setAnimationDuration:2.0];
    // 设置代理
    [UIView setAnimationDelegate:self];
    // 设置动画执行完毕调用的事件
    [UIView setAnimationDidStopSelector:@selector(didStopAnimation)];
    self.customView.center = CGPointMake(200, 300);
    
    [UIView commitAnimations];
    
     */
    
    
    // 1.创建核心动画
    CABasicAnimation *anima = [CABasicAnimation animation];
    
    // 平移
    anima.keyPath = @"position";
    
    // 设置执行的动画
    anima.toValue = [NSValue valueWithCGPoint:CGPointMake(200, 300)];
    
    // 设置执行的动画书剑
    anima.duration = 2.0;
    // 设置动画执行完毕之后不删除动画
    anima.removedOnCompletion = NO;
    // 设置保存动画的最新状态
    anima.fillMode = kCAFillModeForwards;
    
    // 设置动画的代理
    anima.delegate = self;
    
    // 2.添加核心动画
    [self.customView.layer addAnimation:anima forKey:nil];
    
}

- (void)didStopAnimation {

    NSLog(@"动画执行完毕");
    // 打印动画块的位置
    NSLog(@"动画执行之前的位置：%@", NSStringFromCGPoint(self.customView.center));
}

// 代理事件
- (void)animationDidStart:(CAAnimation *)anim {
    
    // 打印动画块的位置
    NSLog(@"动画执行之前的位置：%@", NSStringFromCGPoint(self.customView.layer.position));
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {

    // 打印动画块的位置
    NSLog(@"动画执行完毕后的位置：%@", NSStringFromCGPoint(self.customView.layer.position));
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
