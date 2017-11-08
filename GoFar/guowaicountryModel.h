//
//  countryModel.h
//  GoFar
//
//  Created by 胡彭飞 on 16/3/17.
//  Copyright © 2016年 hpf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "placeModel.h"
@interface guowaicountryModel : NSObject
@property(nonatomic,copy) NSString *name;//country名  一级cell显示
@property(nonatomic,strong) NSArray *items;//二级显示
@end
