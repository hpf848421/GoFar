//
//  guoneiCountryModel.m
//  GoFar
//
//  Created by 胡彭飞 on 16/3/17.
//  Copyright © 2016年 hpf. All rights reserved.
//

#import "guoneiCountryModel.h"
#import "guoneiplaceModel.h"
@implementation guoneiCountryModel
- (NSDictionary *)objectClassInArray
{
    return @{@"items":[guoneiplaceModel class]};
}

@end
