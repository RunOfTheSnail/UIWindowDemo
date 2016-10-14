//
//  ShowWindow.m
//  压入后台时间
//
//  Created by zhangyan on 16/10/11.
//  Copyright © 2016年 zhangyan. All rights reserved.
//

#import "ShowWindow.h"

@implementation ShowWindow

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+ (ShowWindow *)shareShowWindow
{
    static ShowWindow *window = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (window == nil) {
            window = [[ShowWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        }
    });
    
    return window;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor redColor];
        
        // 在window上面添加相关控件
        UIButton *tempBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        tempBtn.frame = CGRectMake(100, 200, 100, 100);
        [tempBtn setTitle:@"点我消失" forState:UIControlStateNormal];
        tempBtn.backgroundColor = [UIColor greenColor];
        [tempBtn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:tempBtn];
    }
    return self;
}

- (void)clickBtn:(UIButton *)sender
{
    self.hidden = YES;
}

- (void)show
{
    [self makeKeyWindow];
    self.hidden = NO;
}

@end
