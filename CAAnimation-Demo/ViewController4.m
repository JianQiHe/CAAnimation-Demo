//
//  ViewController4.m
//  CAAnimation-Demo
//
//  Created by hjq on 16/8/30.
//  Copyright © 2016年 何建启. All rights reserved.
//

#import "ViewController4.h"


#define angle2Radian(angle) ((angle)/180.0*M_PI)

@interface ViewController4 () {

    UIView *_bagView;
    
    UIImageView *_iconImgView;
}

@end

@implementation ViewController4

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /*
     
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"停止动画" forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 100, 100, 50);
    button.backgroundColor = [UIColor blackColor];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    */
    
    
    _bagView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 50)];
    _bagView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:_bagView];
    
    UILabel *label = [UILabel new];
    label.frame = CGRectMake(10, 20, 60, 30);
    label.textColor = [UIColor blackColor];
    label.text = @"动画块";
    label.font = [UIFont boldSystemFontOfSize:20];
    label.textAlignment = NSTextAlignmentCenter;
    [_bagView addSubview:label];
}

/*
    
 fillMode属性的设置：
 
 kCAFillModeRemoved 这个是默认值，也就是说当动画开始前和动画结束后，动画对layer都没有影响，动画结束后，layer会恢复到之前的状态
 
 kCAFillModeForwards 当动画结束后，layer会一直保持着动画最后的状态
 
 kCAFillModeBackwards 在动画开始前，只需要将动画加入了一个layer，layer便立即进入动画的初始状态并等待动画开始。
 
 kCAFillModeBoth 这个其实就是上面两个的合成.动画加入后开始之前，layer便处于动画初始状态，动画结束后layer保持动画最后的状态
 
 速度控制函数(CAMediaTimingFunction)：
 
 kCAMediaTimingFunctionLinear（线性）：匀速，给你一个相对静态的感觉
 
 kCAMediaTimingFunctionEaseIn（渐进）：动画缓慢进入，然后加速离开
 
 kCAMediaTimingFunctionEaseOut（渐出）：动画全速进入，然后减速的到达目的地
 
 kCAMediaTimingFunctionEaseInEaseOut（渐进渐出）：动画缓慢的进入，中间加速，然后减速的到达目的地。这个是默认的动画行为。
 
 文／加斯加的猿（简书作者）
 原文链接：http://www.jianshu.com/p/8c1c1697c0ce
 著作权归作者所有，转载请联系作者获得授权，并标注“简书作者”。
 
 */



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    /*-----------------------------1、平移-----------------------------
    
    // 1.创建核心动画
    CAKeyframeAnimation *keyAnima = [CAKeyframeAnimation animation];
    
    // 平移
    keyAnima.keyPath = @"position";
    
    // 1.1告诉系统要执行什么动画
    NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(100, 100)];
    NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(300, 100)];
    NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(300, 200)];
    NSValue *value4 = [NSValue valueWithCGPoint:CGPointMake(100, 200)];
    NSValue *value5 = [NSValue valueWithCGPoint:CGPointMake(100, 300)];
    NSValue *value6 = [NSValue valueWithCGPoint:CGPointMake(300, 300)];
    NSValue *value7 = [NSValue valueWithCGPoint:CGPointMake(300, 400)];
    NSValue *value8 = [NSValue valueWithCGPoint:CGPointMake(100, 400)];
    NSValue *value9 = [NSValue valueWithCGPoint:CGPointMake(100, 500)];

    keyAnima.values = @[value1, value2, value3, value4, value5, value6, value7, value8, value9];
    
    // 1.2设置动画执行完毕后，不删除动画
    keyAnima.removedOnCompletion = NO;
    // 1.3设置保存动画的最新状态
    keyAnima.fillMode = kCAFillModeForwards;
    // 1.4设置动画执行的时间
    keyAnima.duration = 4.0;
    // 1.5设置动画的节奏
    keyAnima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    // 设置代理，开始-结束
    keyAnima.delegate = self;
    
    // 2.添加核心动画
    [_bagView.layer addAnimation:keyAnima forKey:nil];
    
    
    */
    
    
    /*----------------------------2、在指定轨迹上运动------------------------------
    
    // 1.创建核心动画
    CAKeyframeAnimation *keyAnima = [CAKeyframeAnimation animation];
    
    // 平移
    keyAnima.keyPath = @"position";
    
    // 1.1告诉系统要执行什么动画
    // 创建一条路径
    CGMutablePathRef path = CGPathCreateMutable();
    
    // 设置一个圆的路径
    CGPathAddEllipseInRect(path, NULL, CGRectMake(100, 100, 100, 300));
    keyAnima.path = path;
    
    
    
    // 有create就一定要有release
    CGPathRelease(path);
    
    // 1.2设置动画执行完毕后，不删除动画
    keyAnima.removedOnCompletion = NO;
    // 1.3设置保存动画的最新状态
    keyAnima.fillMode = kCAFillModeForwards;
    // 1.4设置动画执行时间
    keyAnima.duration = 5.0;
    // 1.5设置动画的节奏
    keyAnima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    // 设置代理，开始-结束
    keyAnima.delegate = self;
    
    // 2.添加核心动画
    [_bagView.layer addAnimation:keyAnima forKey:@"wendingding"];
    
    
    */
    
    //*-------------------------3、图标抖动--------------------------
    
    // 1.创建核心动画
    CAKeyframeAnimation *keyAnima = [CAKeyframeAnimation animation];
    keyAnima.keyPath = @"transform.rotation";
    
    // 设置动画时间
    keyAnima.duration = 0.1;
    
    // 设置图标抖动弧度
    // 把度数转为弧度   度数/180*M_PI
    keyAnima.values = @[@(-angle2Radian(4)), @(angle2Radian(4)), @(-angle2Radian(4))];
    
    // 设置动画的重复次数（设置为最大值）
    keyAnima.repeatCount = MAXFLOAT;
    
    keyAnima.fillMode = kCAFillModeForwards;
    keyAnima.removedOnCompletion = NO;
    
    // 2.添加动画
    [_bagView.layer addAnimation:keyAnima forKey:nil];
    //*/
}

- (void)animationDidStart:(CAAnimation *)anim {
    
    NSLog(@"开始动画");
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    
    NSLog(@"结束动画");
}

- (void)buttonClick {
    
    NSLog(@"停止动画");
    [_bagView.layer removeAnimationForKey:@"wendingding"];
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
