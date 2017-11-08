//
//  remenModel.h
//  GoFar
//
//  Created by 胡彭飞 on 16/3/21.
//  Copyright © 2016年 hpf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "remenPCModel.h"
#import "remenPoiModel.h"
@interface remenModel : NSObject
@property(nonatomic,strong) remenPoiModel *poi;
@property(nonatomic,copy) NSArray *pc;
@property(nonatomic,copy) NSString *time;
@end
