//
//  HPtabbar.h
//  GoFar
//
//  Created by 胡彭飞 on 16/3/14.
//  Copyright © 2016年 hpf. All rights reserved.
//
@class HPtabbar;
@protocol HPtabbarDelegate <UITabBarDelegate>
@optional
-(void)HPtabbar:(HPtabbar *)tabbar clickCenterBtn:(UIButton *)button;
@end
#import <UIKit/UIKit.h>

@interface HPtabbar : UITabBar
@property(nonatomic,weak) id<HPtabbarDelegate> delegate;
@end
