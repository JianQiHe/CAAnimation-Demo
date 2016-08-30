//
//  ViewController7.m
//  CAAnimation-Demo
//
//  Created by hjq on 16/8/30.
//  Copyright © 2016年 何建启. All rights reserved.
//

#import "ViewController7.h"

@interface ViewController7 ()

@property (nonatomic, strong) UIView *customView;

@end

@implementation ViewController7

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _customView = [UIView new];
    _customView.frame = CGRectMake(100, 100, 100, 50);
    _customView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:_customView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    // block代码块动画
    [UIView transitionWithView:self.customView duration:3.0 options:0 animations:^{
       
        // 执行的动画
        NSLog(@"动画开始执行前的位置：%@", NSStringFromCGPoint(self.customView.center));
        self.customView.center = CGPointMake(200, 300);
    } completion:^(BOOL finished) {
       
        // 动画执行完毕后的首位操作
        NSLog(@"动画执行完毕");
        NSLog(@"动画执行完毕后的位置：%@", NSStringFromCGPoint(self.customView.center));
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
