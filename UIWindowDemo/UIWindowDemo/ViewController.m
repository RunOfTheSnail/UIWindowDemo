//
//  ViewController.m
//  UIWindowDemo
//
//  Created by zhangyan on 16/10/13.
//  Copyright © 2016年 zhangyan. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "MyWindow1.h"
#import "ShowWindow.h"

@interface ViewController ()
@property(nonatomic,strong)UIWindow *myWindow1;
@property(nonatomic,strong)MyWindow1 *myWindow;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    // 测试按钮
    UIButton *tempBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [tempBtn setTitle:@"先点我" forState:UIControlStateNormal];
    tempBtn.frame = CGRectMake(100, 100, 100, 100);
    tempBtn.backgroundColor = [UIColor cyanColor];
    [tempBtn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:tempBtn];
    
    
    
    UIButton *myTempBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [myTempBtn setTitle:@"再点我" forState:UIControlStateNormal];
    myTempBtn.frame = CGRectMake(100, 300, 100, 100);
    myTempBtn.backgroundColor = [UIColor greenColor];
    [myTempBtn addTarget:self action:@selector(clickMyTempBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:myTempBtn];
    
}

- (void)clickMyTempBtn:(UIButton *)sender
{
    NSLog(@"3当前所有的window %@",[UIApplication sharedApplication].windows);
}


- (void)clickBtn:(UIButton *)sender
{
    
    AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    app.window.alpha = 0.3;
    
    // 可以显示创建的window
    [self test1];
    
    // 不能正常显示创建的window
//    [self test2];
    
    // 不能正常的显示创建的window
//    [self test3];
    
    // 可以正常的显示创建的window
//    [self test4];
    
    // 可以正常显示创建的window
//    [self test5];
    
    
    NSLog(@"2当前所有的window %@",[UIApplication sharedApplication].windows);
    
}

// 将window设置成全局变量
- (void)test1
{
    self.myWindow1 = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.myWindow1.backgroundColor = [UIColor redColor];
    self.myWindow1.windowLevel = -1;
    self.myWindow1.hidden = NO;

}

// 不设置成全局变量
- (void)test2
{
    UIWindow *myWindow3 = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    myWindow3.backgroundColor = [UIColor greenColor];
    myWindow3.windowLevel = 100;
    myWindow3.hidden = NO;
    [myWindow3 makeKeyWindow];
    
    NSLog(@"1当前所有的window %@",[UIApplication sharedApplication].windows);

}

// 单独创建UIWindow类
- (void)test3
{
    MyWindow1 *myWindow = [[MyWindow1 alloc] initWithFrame:[UIScreen mainScreen].bounds];
    myWindow.backgroundColor = [UIColor greenColor];
    myWindow.windowLevel = 100;
    myWindow.hidden = NO;
    [myWindow makeKeyWindow];
    
}
// 单独创建UIWindow类，然后设置成全局变量
- (void)test4
{
    self.myWindow = [[MyWindow1 alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.myWindow.backgroundColor = [UIColor greenColor];
    self.myWindow.windowLevel = 100;
    self.myWindow.hidden = NO;
    [self.myWindow makeKeyWindow];
}

// 创建window的单例进行实验
- (void)test5
{
    ShowWindow *window = [ShowWindow shareShowWindow];
    
    [window show];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
