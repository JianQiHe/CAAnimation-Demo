//
//  ViewController5.m
//  CAAnimation-Demo
//
//  Created by hjq on 16/8/30.
//  Copyright © 2016年 何建启. All rights reserved.
//

#import "ViewController5.h"

@interface ViewController5 ()

@property (nonatomic, assign) int index;
@property (nonatomic, strong) UIImageView *iconImgView;

@end

@implementation ViewController5

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.index = 1;
    
    UIButton *button1=  [UIButton buttonWithType:UIButtonTypeCustom];
    button1.frame = CGRectMake(50, 90, 100, 30);
    [button1 setTitle:@"上一张" forState:UIControlStateNormal];
    button1.backgroundColor = [UIColor purpleColor];
    [button1 addTarget:self action:@selector(button1Click:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    
    UIButton *button2 =  [UIButton buttonWithType:UIButtonTypeCustom];
    button2.frame = CGRectMake(170, 90, 100, 30);
    [button2 setTitle:@"下一张" forState:UIControlStateNormal];
    button2.backgroundColor = [UIColor purpleColor];
    [button2 addTarget:self action:@selector(button2Click:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    
    
    self.iconImgView = [[UIImageView alloc] initWithFrame:CGRectMake(60, 170, CGRectGetWidth(self.view.frame) - 120, CGRectGetHeight(self.view.frame) - 250)];
    self.iconImgView.image = [UIImage imageNamed:@"1"];
    [self.view addSubview:self.iconImgView];
}


// 上一张
- (void)button1Click:(UIButton *)sender {

    self.index--;
    
    if (self.index < 1) {
        self.index = 13;
    }
    
    self.iconImgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d", self.index]];
    
    // 创建核心动画
    CATransition *ca = [CATransition animation];
    // 告诉要执行什么动画
    // 设置多度效果
    ca.type = @"cube";
    // 设置动画的过度方向（向左）
    ca.subtype = kCATransitionFromLeft;
    // 设置动画的时间
    ca.duration = 3.0;
    // 添加动画
    [self.iconImgView.layer addAnimation:ca forKey:nil];
    
}

// 下一张
- (void)button2Click:(UIButton *)sender {
    
    self.index++;
    if (self.index > 13) {
        self.index = 1;
    }
    
    self.iconImgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d", self.index]];
    
    // 1.创建核心动画
    CATransition *ca = [CATransition animation];
    
    // 1.1告诉要执行什么动画
    // 1.2设置过度效果
    ca.type = @"cube";
    // 1.3设置动画的过度方向(向右)
    ca.subtype = kCATransitionFromRight;
    // 1.4设置动画的时间
    ca.duration = 3.0;
    // 1.5设置动画的起点
//    ca.startProgress = 0.5;
    // 1.6设置动画的终点
//    ca.endProgress = 0.5;
    
    // 2.添加动画
    [self.iconImgView.layer addAnimation:ca forKey:nil];
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    //*----------------------组动画--------------------------
    
    // 平移动画
    CABasicAnimation *anima = [CABasicAnimation animation];
    anima.keyPath = @"transform.translation.y";
    anima.toValue = @(100);
    
    // 缩放动画
    CABasicAnimation *anima2 = [CABasicAnimation animation];
    anima2.keyPath = @"transform.scale";
    anima2.toValue = @(0);
    
    // 旋转动画
    CABasicAnimation *anima3 = [CABasicAnimation animation];
    anima3.keyPath = @"transform.rotation";
    anima3.toValue = @(M_PI_2);
    
    // 组动画
    CAAnimationGroup *groupAnima = [CAAnimationGroup animation];
    
    groupAnima.animations = @[anima, anima2, anima3];
    
    // 设置组动画的时间
    groupAnima.duration = 2;
    groupAnima.fillMode = kCAFillModeForwards;
    groupAnima.removedOnCompletion = NO;
    
    [self.iconImgView.layer addAnimation:groupAnima forKey:nil];
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
