//
//  remenImageScrollView.h
//  GoFar
//
//  Created by 胡彭飞 on 16/3/22.
//  Copyright © 2016年 hpf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EGOImageView.h"
#import "remenFramModel.h"
#import "remenModel.h"
#import "remenPCModel.h"
@interface remenImageScrollView : UIView
@property(nonatomic,strong) remenFramModel *remenframemodel;
@property(nonatomic,strong) remenPCModel *remenpcmodel;

@end
