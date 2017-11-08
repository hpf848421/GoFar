//
//  guoneiALLmodel.m
//  GoFar
//
//  Created by 胡彭飞 on 16/3/17.
//  Copyright © 2016年 hpf. All rights reserved.
//

#import "guoneiALLmodel.h"
#import "guoneiCountryModel.h"
@implementation guoneiALLmodel
- (NSDictionary *)objectClassInArray
{
    return @{@"items":[guoneiCountryModel class]};
}

@end
