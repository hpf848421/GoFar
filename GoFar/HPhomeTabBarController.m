//
//  HPhomeTabBarController.m
//  GoFar
//
//  Created by 胡彭飞 on 16/3/11.
//  Copyright © 2016年 hpf. All rights reserved.
//

#import "HPhomeTabBarController.h"
#import "HPHomeNaviViewController.h"
#import "HPjingxuanViewController.h"
#import "HPtabbar.h"
#import "MakeTravelViewController.h"
#import "DestionationTableViewController.h"
#import "DongtaiTableViewController.h"
#import "MYTableViewController.h"
@interface HPhomeTabBarController ()<HPtabbarDelegate>

@end

@implementation HPhomeTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    HPtabbar *tabbar=[[HPtabbar alloc] initWithFrame:self.tabBar.bounds];
    tabbar.delegate=self;
      [self setValue:tabbar  forKeyPath:@"tabBar"];
    HPjingxuanViewController *jingXuanTbVC=[[HPjingxuanViewController alloc] init];
    HPHomeNaviViewController *jingXuanNav=[[HPHomeNaviViewController alloc] initWithRootViewController:jingXuanTbVC];
    UIImage *jingxuanima=[[UIImage imageNamed:@"home_inspiration2~iphone"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *selima=[[UIImage imageNamed:@"home_selected~iphone"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    jingXuanNav.tabBarItem=[[UITabBarItem alloc] initWithTitle:@"精选" image:selima selectedImage:jingxuanima];

    [jingXuanNav.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:HPcolor(46, 204, 154)} forState:UIControlStateSelected];
    
    DestionationTableViewController *mudiDiTbVC=[[DestionationTableViewController alloc] init];
    HPHomeNaviViewController *mudiDiNav=[[HPHomeNaviViewController alloc] initWithRootViewController:mudiDiTbVC];
    UIImage *mudidiima=[[UIImage imageNamed:@"home_destination~iphone"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *selmudidi=[[UIImage imageNamed:@"home_destination2~iphone"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    mudiDiNav.tabBarItem=[[UITabBarItem alloc] initWithTitle:@"目的地" image:mudidiima selectedImage:selmudidi];
   [mudiDiNav.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:HPcolor(46, 204, 154)} forState:UIControlStateSelected];
    
    DongtaiTableViewController *dongtaiTbVC=[[DongtaiTableViewController alloc] init];
    HPHomeNaviViewController *dongtaiNav=[[HPHomeNaviViewController alloc] initWithRootViewController:dongtaiTbVC];
    UIImage *dongtaiima=[[UIImage imageNamed:@"home_dynamic~iphone"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *seldongtai=[[UIImage imageNamed:@"home_dynamic2~iphone"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    dongtaiNav.tabBarItem=[[UITabBarItem alloc] initWithTitle:@"动态" image:dongtaiima selectedImage:seldongtai];
    [dongtaiNav.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:HPcolor(46, 204, 154)} forState:UIControlStateSelected];
    
    MYTableViewController *meTbVc=[[MYTableViewController alloc] initWithStyle:UITableViewStylePlain];
    HPHomeNaviViewController *meNav=[[HPHomeNaviViewController alloc] initWithRootViewController:meTbVc];
    UIImage *meima=[[UIImage imageNamed:@"user_u~iphone"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *selme=[[UIImage imageNamed:@"user~iphone"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    meNav.tabBarItem=[[UITabBarItem alloc] initWithTitle:@"我的" image:meima selectedImage:selme];
    [meNav.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:HPcolor(46, 204, 154)} forState:UIControlStateSelected];
    [self setViewControllers:@[jingXuanNav,mudiDiNav,dongtaiNav,meNav]];
    self.tabBar.backgroundColor=HPcolor(224, 218, 218);

    
}
#pragma mark------------HPtabbarDelegate-------------
-(void)HPtabbar:(HPtabbar *)tabbar clickCenterBtn:(UIButton *)button
{
    MakeTravelViewController  *addViewC= [[MakeTravelViewController alloc] init];
//    addViewC.view.backgroundColor=[UIColor redColor];
    HPHomeNaviViewController *addNav=[[HPHomeNaviViewController alloc] initWithRootViewController:addViewC];
    [self presentViewController:addNav animated:YES completion:nil];

}

@end
