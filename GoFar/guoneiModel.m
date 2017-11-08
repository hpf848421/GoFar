//
//  guoneiModel.m
//  GoFar
//
//  Created by 胡彭飞 on 16/3/17.
//  Copyright © 2016年 hpf. All rights reserved.
//

#import "guoneiModel.h"
#import "guoneiALLmodel.h"
@implementation guoneiModel
- (NSDictionary *)objectClassInArray
{
    return @{@"items":[guoneiALLmodel class]};
}
@end
