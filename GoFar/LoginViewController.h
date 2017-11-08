//
//  LoginViewController.h
//  GoFar
//
//  Created by 胡彭飞 on 16/3/30.
//  Copyright © 2016年 hpf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <TencentOpenAPI/TencentOAuth.h>
#import <TencentOpenAPI/TencentOAuthObject.h>
#import <TencentOpenAPI/TencentApiInterface.h>
@interface LoginViewController : UIViewController<TencentSessionDelegate,TencentApiInterfaceDelegate, TCAPIRequestDelegate>

@end
