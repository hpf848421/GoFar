//
//  countryModel.m
//  GoFar
//
//  Created by 胡彭飞 on 16/3/17.
//  Copyright © 2016年 hpf. All rights reserved.
//

#import "guowaicountryModel.h"

@implementation guowaicountryModel
- (NSDictionary *)objectClassInArray
{
    return @{@"items":[placeModel class]};
}

@end
