//
//  ViewController3.m
//  CAAnimation-Demo
//
//  Created by HJQ on 16/8/29.
//  Copyright © 2016年 何建启. All rights reserved.
//

#import "ViewController3.h"

@interface ViewController3 ()

@property (nonatomic, strong) CALayer *mylayer;

@end

@implementation ViewController3

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //--------------------旋转动画---------------------
    
    // 创建layer
    CALayer *myLayer = [CALayer layer];
    
    // 设置layer的属性
    myLayer.bounds = CGRectMake(100, 100, 150, 60);
    myLayer.backgroundColor = [UIColor yellowColor].CGColor;
    myLayer.position = CGPointMake(50, 50);
    myLayer.anchorPoint = CGPointZero;
    myLayer.cornerRadius = 40;
    
    // 添加layer
    [self.view.layer addSublayer:myLayer];
    self.mylayer = myLayer;
    
}

// 旋转动画
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    //*
    // 1.创建动画
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"transform"];
    
    // 1.1设置动画执行时间
    anima.duration = 2.0;
    // 1.2修改属性，执行动画
    anima.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI_2 + M_PI_4, 1, 1, 0)];
    // 1.3设置动画执行完毕后不删除动画
    anima.removedOnCompletion = NO;
    // 1.4设置保存动画的最新状态
    anima.fillMode = kCAFillModeForwards;
    
    // 2.添加动画到layer
    [self.mylayer addAnimation:anima forKey:nil];
    
    //*/
    
    /*
    
    //1.创建动画
    CABasicAnimation *anima=[CABasicAnimation animation];
    anima.keyPath=@"transform";
    //1.1设置动画执行时间
    anima.duration=2.0;
    //1.2修改属性，执行动画
    
    anima.toValue=[NSValue valueWithCATransform3D:CATransform3DMakeTranslation(0, 100, 1)];
    //1.3设置动画执行完毕后不删除动画
    anima.removedOnCompletion=NO;
    //1.4设置保存动画的最新状态
    anima.fillMode=kCAFillModeForwards;
    
    //2.添加动画到layer
    [self.mylayer addAnimation:anima forKey:nil];
    */
    
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
