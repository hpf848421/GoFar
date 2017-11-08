//
//  HPHomeNaviViewController.m
//  GoFar
//
//  Created by 胡彭飞 on 16/3/11.
//  Copyright © 2016年 hpf. All rights reserved.
//

#import "HPHomeNaviViewController.h"

#import "CellSelectedTableViewController.h"
@interface HPHomeNaviViewController ()

@end

@implementation HPHomeNaviViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self setNavigationBarHidden:YES animated:NO];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [UINavigationBar appearance].barTintColor=HPcolor(44, 52, 61);
//    UIView *bgImage=[[UIView alloc] initWithFrame:CGRectMake(0, 0, KscreenW, 64)];
//    bgImage.backgroundColor=HPcolor(44, 52, 61);
//    self.bgImage=bgImage;
//    [self.view addSubview:bgImage];
  
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.tabBarController.childViewControllers>0) {
        viewController.hidesBottomBarWhenPushed=YES;
    }
    
    [super pushViewController:viewController animated:animated];
//    viewController.hidesBottomBarWhenPushed=NO;
}
-(UIViewController *)popViewControllerAnimated:(BOOL)animated
{
    [UIView animateWithDuration:1 animations:^{
//        self.bgImage.hidden=NO;
        self.tabBarController.tabBar.hidden=NO;
        
    }];
    return [super popViewControllerAnimated:animated];
}
@end
