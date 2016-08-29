//
//  ViewController1.m
//  CAAnimation-Demo
//
//  Created by HJQ on 16/8/29.
//  Copyright © 2016年 何建启. All rights reserved.
//

#import "ViewController1.h"

@interface ViewController1 ()

@property (nonatomic, strong) CALayer *mylayer;

@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //---------------------平移动画------------------
    
    // 创建layer
    CALayer *myLayer = [CALayer layer];
    
    // 设置layer的属性
    myLayer.bounds = CGRectMake(0, 0, 50, 80);
    myLayer.backgroundColor = [UIColor yellowColor].CGColor;
    myLayer.position = CGPointMake(100, 100);
    myLayer.anchorPoint = CGPointZero;
    myLayer.cornerRadius = 20;
    
    // 添加layer
    [self.view.layer addSublayer:myLayer];
    self.mylayer = myLayer;
}

// 设置动画（基础动画）
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    // 1.创建核心动画
    //CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:<#(nullable NSString *)#>];
    
    CABasicAnimation *anima = [CABasicAnimation animation];
    // 1.1告诉系统要执行什么样的动画
    anima.keyPath = @"position";
    // 通过设置动画，将layer从哪儿移动到哪儿
    anima.fromValue = [NSValue valueWithCGPoint:CGPointMake(50, 50)];
    // byValue和toValue的区别，前者是在当前的位置上增加多少，后者是到指定的位置。
    anima.toValue = [NSValue valueWithCGPoint:CGPointMake(300, 400)];
    //anima.byValue = [NSValue valueWithCGPoint:CGPointMake(200, 300)];
    
    // 1.2设置动画执行完毕之后不删除动画
    anima.removedOnCompletion = NO;
    
    // 1.3设置保存动画的最新状态
    anima.fillMode = kCAFillModeForwards;
    
    // 设置动画的代理，可以监听动画的执行过程，这里设置控制器为代理。
    anima.delegate = self;
    NSString *str = NSStringFromCGPoint(self.mylayer.position);
    NSLog(@"执行前：%@", str);
    
    // 2.添加核心动画到layer
    [self.mylayer addAnimation:anima forKey:nil];
    
}

// 代理事件
- (void)animationDidStart:(CAAnimation *)anim {
    
    NSLog(@"开始执行动画");
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {

    // 动画执行完毕，打印执行完毕后的position值
    NSString *str = NSStringFromCGPoint(self.mylayer.position);
    NSLog(@"执行后：%@", str);
}

/*
 总结：打印position的属性值，验证图层的属性值还是动画执行前的初始值{100，100}，并没有真正被改变为{300，400}。
 
 2016-08-29 22:45:12.100 CAAnimation-Demo[2244:226241] 执行前：{100, 100}
 2016-08-29 22:45:12.100 CAAnimation-Demo[2244:226241] 开始执行动画
 2016-08-29 22:45:12.350 CAAnimation-Demo[2244:226241] 执行后：{100, 100}

 
 */

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
