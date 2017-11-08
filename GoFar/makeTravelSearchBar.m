//
//  makeTravelSearchBar.m
//  GoFar
//
//  Created by 胡彭飞 on 16/3/16.
//  Copyright © 2016年 hpf. All rights reserved.
//

#import "makeTravelSearchBar.h"

@implementation makeTravelSearchBar
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    UIView *subview =self.subviews[0];
    
    for(UIView  *subview1 in subview.subviews) {
        if ([subview1 isKindOfClass:NSClassFromString(@"UISearchBarTextField")]) {
            subview1.frame=CGRectMake(15, 8, self.width-30, self.height-16);
        }
        if ([subview1 isKindOfClass:NSClassFromString(@"UISearchBarBackground")])
        {
            [subview1 removeFromSuperview];
            break;
        }
    }
        
 
}
@end
