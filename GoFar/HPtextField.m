//
//  HPtextField.m
//  GoFar
//
//  Created by 胡彭飞 on 16/3/11.
//  Copyright © 2016年 hpf. All rights reserved.
//

#import "HPtextField.h"

@implementation HPtextField
- (CGRect)placeholderRectForBounds:(CGRect)bounds
{
   
    CGRect rect =[super placeholderRectForBounds:bounds];
    rect.origin.x+=5;
    bounds=rect;
    return  bounds;
}
@end
