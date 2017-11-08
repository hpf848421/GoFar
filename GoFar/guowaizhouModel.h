//
//  zhouModel.h
//  GoFar
//
//  Created by 胡彭飞 on 16/3/17.
//  Copyright © 2016年 hpf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "guowaicountryModel.h"
@interface guowaizhouModel : NSObject
@property(nonatomic,copy)NSString *name;//州name
@property(nonatomic,strong)NSArray *items;//装 州下面的韩国等
@property(nonatomic,strong) NSNumber *hot;
@end
