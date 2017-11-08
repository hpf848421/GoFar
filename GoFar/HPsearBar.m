//
//  HPsearBar.m
//  GoFar
//
//  Created by 胡彭飞 on 16/3/11.
//  Copyright © 2016年 hpf. All rights reserved.
//

#import "HPsearBar.h"

@implementation HPsearBar

- (CGRect)leftViewRectForBounds:(CGRect)bounds
{
    self.tintColor=[UIColor whiteColor];
    CGRect rect =[super leftViewRectForBounds:bounds];
    rect.origin.x+=10;
    bounds=rect;
    return  bounds;
}
- (CGRect)placeholderRectForBounds:(CGRect)bounds
{
    CGRect rect =[super placeholderRectForBounds:bounds];
    rect.origin.x+=10;
    bounds=rect;
    return  bounds;
}
@end
