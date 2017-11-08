//
//  LoginViewController.m
//  GoFar
//
//  Created by 胡彭飞 on 16/3/30.
//  Copyright © 2016年 hpf. All rights reserved.
//

#import "LoginViewController.h"
#import "sdkCall.h"
@interface LoginViewController ()
@property(nonatomic,weak)  UITextField *zhanghaoTextView;
@property(nonatomic,weak)  UITextField *mimaTextView;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=HPcolor(66, 209, 163);
    [self setView];
}
-(void)setView
{
    UIButton *XXcloseBtn=[[UIButton alloc] initWithFrame:CGRectMake(10, 20, 40, 40)];
    [XXcloseBtn setImage:[UIImage imageNamed:@"cancel_x~iphone.png"] forState:UIControlStateNormal];
    [XXcloseBtn addTarget:self action:@selector(closeBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:XXcloseBtn];
    
    UILabel *dengluLabel=[[UILabel alloc] initWithFrame:CGRectMake(0, 20, KscreenW, 40)];
    dengluLabel.text=@"登录账户";
    dengluLabel.textColor=[UIColor whiteColor];
    dengluLabel.font=[UIFont systemFontOfSize:18];
    dengluLabel.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:dengluLabel];
    
    UIButton *zhuceBtn=[[UIButton alloc] initWithFrame:CGRectMake(KscreenW-10-40, 20, 40, 40)];
//    [zhuceBtn setImage:[UIImage imageNamed:@"cancel_x~iphone.png"] forState:UIControlStateNormal];
    [zhuceBtn setTitle:@"注册" forState:UIControlStateNormal];
    [zhuceBtn addTarget:self action:@selector(zhuceBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:zhuceBtn];
    
    UIView *hengxian1 =[[UIView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(dengluLabel.frame)+10, KscreenW-20, 1)];
    hengxian1.backgroundColor=[UIColor whiteColor];
    hengxian1.alpha=0.5;
    [self.view addSubview:hengxian1];
    CGFloat marginX=50;
    UITextField *zhanghaoTextView=[[UITextField alloc] initWithFrame:CGRectMake(marginX, KscreenH*0.23, KscreenW-2*marginX, 35)];
    NSAttributedString *placeHolderStr=[[NSAttributedString alloc] initWithString:@"手机/邮箱" attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.zhanghaoTextView=zhanghaoTextView;
    zhanghaoTextView.attributedPlaceholder=placeHolderStr;
    zhanghaoTextView.alpha=0.5;
    zhanghaoTextView.font=[UIFont systemFontOfSize:18];
    zhanghaoTextView.backgroundColor=[UIColor clearColor];
    UIButton *cost_xBtn1=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 14, 14)];
        cost_xBtn1.tag=0;
    [cost_xBtn1 addTarget:self action:@selector(textFieldClear:) forControlEvents:UIControlEventTouchUpInside];
    [cost_xBtn1 setImage:[UIImage imageNamed:@"cost_x~iphone.png"] forState:UIControlStateNormal];
    zhanghaoTextView.rightView=cost_xBtn1;
    zhanghaoTextView.rightViewMode=UITextFieldViewModeWhileEditing;
    [self.view addSubview:zhanghaoTextView];
    UIView *hengxian2 =[[UIView alloc] initWithFrame:CGRectMake(marginX, CGRectGetMaxY(zhanghaoTextView.frame), KscreenW-2*marginX, 1)];
    hengxian2.backgroundColor=[UIColor whiteColor];
    hengxian2.alpha=0.5;
    [self.view addSubview:hengxian2];
    
    UITextField *mimaTextView=[[UITextField alloc] initWithFrame:CGRectMake(marginX, CGRectGetMaxY(hengxian2.frame)+10, KscreenW-2*marginX, 35)];
    self.mimaTextView=mimaTextView;
    NSAttributedString *placeHolderStr2=[[NSAttributedString alloc] initWithString:@"密码" attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    mimaTextView.attributedPlaceholder=placeHolderStr2;
    mimaTextView.alpha=0.5;
    mimaTextView.font=[UIFont systemFontOfSize:18];
    mimaTextView.backgroundColor=[UIColor clearColor];
    UIButton *cost_xBtn=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 14, 14)];
    cost_xBtn.tag=1;
        [cost_xBtn addTarget:self action:@selector(textFieldClear:) forControlEvents:UIControlEventTouchUpInside];
    [cost_xBtn setImage:[UIImage imageNamed:@"cost_x~iphone.png"] forState:UIControlStateNormal];
    mimaTextView.rightView=cost_xBtn;
    mimaTextView.rightViewMode=UITextFieldViewModeWhileEditing;
    [self.view addSubview:mimaTextView];
    UIView *hengxian3 =[[UIView alloc] initWithFrame:CGRectMake(marginX, CGRectGetMaxY(mimaTextView.frame), KscreenW-2*marginX, 1)];
    hengxian3.backgroundColor=[UIColor whiteColor];
    hengxian3.alpha=0.5;
    [self.view addSubview:hengxian3];
    
    UIButton *loginBtn=[[UIButton alloc] initWithFrame:CGRectMake(marginX, CGRectGetMaxY(hengxian3.frame)+50, KscreenW-2*marginX, 40)];
    [loginBtn setBackgroundColor:[UIColor whiteColor]];
    loginBtn.layer.cornerRadius=5;
    loginBtn.clipsToBounds=YES;
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn setTitleColor:HPcolor(66, 209, 163) forState:UIControlStateNormal];
    [self.view addSubview:loginBtn];
    
    UIButton *ForgetSecretBtn=[[UIButton alloc] initWithFrame:CGRectMake(marginX*2, CGRectGetMaxY(loginBtn.frame)+5, KscreenW-4*marginX, 20)];
    ForgetSecretBtn.titleLabel.font=[UIFont systemFontOfSize:13];
    [ForgetSecretBtn setBackgroundColor:[UIColor clearColor]];
    [ForgetSecretBtn setTitle:@"忘记密码？" forState:UIControlStateNormal];
    [ForgetSecretBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:ForgetSecretBtn];
    
    UILabel *qiatfangshihengxian=[[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(ForgetSecretBtn.frame)+KscreenH*0.07, KscreenW-20, 20)];
    qiatfangshihengxian.text=@"其他登录方式";
    [qiatfangshihengxian sizeToFit];
    qiatfangshihengxian.centerX=KscreenW*0.5;
    qiatfangshihengxian.textColor=[UIColor whiteColor];
    qiatfangshihengxian.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:qiatfangshihengxian];
    
    UIView *hengxian4 =[[UIView alloc] initWithFrame:CGRectMake(10, CGRectGetMidY(qiatfangshihengxian.frame),KscreenW*0.5-qiatfangshihengxian.width*0.5-15, 1)];
    hengxian4.backgroundColor=[UIColor whiteColor];
    hengxian4.alpha=0.5;
    [self.view addSubview:hengxian4];
    UIView *hengxian5=[[UIView alloc] initWithFrame:CGRectMake(KscreenW-10-hengxian4.width, CGRectGetMidY(qiatfangshihengxian.frame), hengxian4.width, 1)];
    hengxian5.backgroundColor=[UIColor whiteColor];
    hengxian5.alpha=0.5;
    [self.view addSubview:hengxian5];
    CGFloat marginX1=(KscreenW-3*80)/4;
    UIButton *sinaBtn=[[UIButton alloc] initWithFrame:CGRectMake(marginX1, CGRectGetMaxY(hengxian5.frame), 80, 80)];
    [sinaBtn setImage:[UIImage imageNamed:@"login_wb~iphone.png"] forState:UIControlStateNormal];
    [sinaBtn addTarget:self action:@selector(loginBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    sinaBtn.tag=1;
    sinaBtn.centerY=(KscreenH-CGRectGetMaxY(hengxian5.frame))*0.5+CGRectGetMaxY(hengxian5.frame);
    [self.view addSubview:sinaBtn];
    UIButton *qqBtn=[[UIButton alloc] initWithFrame:CGRectMake(marginX1*2+80, CGRectGetMaxY(hengxian5.frame), 80, 80)];
    [qqBtn setImage:[UIImage imageNamed:@"login_qq~iphone.png"] forState:UIControlStateNormal];
    qqBtn.centerY=sinaBtn.centerY;
    qqBtn.tag=2;
    [qqBtn addTarget:self action:@selector(loginBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:qqBtn];
    UIButton *wetchatBtn=[[UIButton alloc] initWithFrame:CGRectMake(marginX1*3+2*80, CGRectGetMaxY(hengxian5.frame), 80, 80)];
    [wetchatBtn setImage:[UIImage imageNamed:@"login_wx~iphone.png"] forState:UIControlStateNormal];
    wetchatBtn.centerY=sinaBtn.centerY;
    wetchatBtn.tag=3;
    [wetchatBtn addTarget:self action:@selector(loginBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:wetchatBtn];
}
-(void)closeBtn
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)loginBtnClick:(UIButton *)btn
{
    switch (btn.tag) {
        case 1:
        {
        
        }
            break;
        case 2:
        {
            NSArray* permissions = [NSArray arrayWithObjects:
                                    kOPEN_PERMISSION_GET_USER_INFO,
                                    kOPEN_PERMISSION_GET_SIMPLE_USER_INFO,
                                    kOPEN_PERMISSION_ADD_SHARE,
                                    nil];
                [[[sdkCall getinstance] oauth] authorize:permissions inSafari:NO];
            break;
         }
        case 3:
            
            break;
    }

}
-(void)zhuceBtn
{

}
-(void)textFieldClear:(UIButton *)btn
{
    switch (btn.tag) {
        case 0:
            self.zhanghaoTextView.text=nil;
            break;
        case 1:
           self.mimaTextView.text=nil;
            break;
    }

}
@end
