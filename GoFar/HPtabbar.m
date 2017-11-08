//
//  HPtabbar.m
//  GoFar
//
//  Created by 胡彭飞 on 16/3/14.
//  Copyright © 2016年 hpf. All rights reserved.
//

#import "HPtabbar.h"

@implementation HPtabbar
-(instancetype)initWithFrame:(CGRect)frame
{

     if(self=[super initWithFrame:frame])
     {
     
         /**
          加号按钮
          */
         UIButton *addBtnImage=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 98, 49)];
         addBtnImage.center=CGPointMake(self.width*0.5, self.height*0.5);
         [addBtnImage setBackgroundImage:[UIImage imageNamed:@"home_add~iphone"] forState:UIControlStateNormal];
         [addBtnImage addTarget:self action:@selector(addBtnClick:) forControlEvents:UIControlEventTouchUpInside];
         addBtnImage.adjustsImageWhenHighlighted=NO;
         UIImageView *jiahaoImage=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 16, 16)];
         jiahaoImage.center=addBtnImage.center;
         jiahaoImage.image=[UIImage imageNamed:@"home_add+~iphone"];
         //    addBtnImage.image=[UIImage imageNamed:@"add"];
         [self addSubview:addBtnImage];
         [self addSubview:jiahaoImage];

     
     }
    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
      int widthCount=0;
    for (int i=0; i<self.subviews.count; i++) {
        int count=5;
        CGFloat width=self.width/count;
      
        Class class=NSClassFromString(@"UITabBarButton");
        if ([self.subviews[i] isKindOfClass:class]) {
//            self.subviews[i].backgroundColor=[UIColor redColor];
            if (widthCount==2) {
                widthCount++;
            }
            self.subviews[i].frame=CGRectMake(width*widthCount, 0, width, self.height);
              widthCount+=1;
        
        }
    }

}
-(void)addBtnClick:(UIButton *)btn
{
    if ([self.delegate respondsToSelector:@selector(HPtabbar:clickCenterBtn:)]) {
        [self.delegate HPtabbar:self clickCenterBtn:btn];
    }

}
@end
