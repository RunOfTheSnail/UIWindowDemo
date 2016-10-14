//
//  ShowWindow.h
//  压入后台时间
//
//  Created by zhangyan on 16/10/11.
//  Copyright © 2016年 zhangyan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShowWindow : UIWindow

- (void)show;

+ (ShowWindow *)shareShowWindow;

@end
