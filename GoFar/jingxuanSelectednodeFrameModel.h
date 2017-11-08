//
//  jingxuanSelectednodeFrameModel.h
//  GoFar
//
//  Created by 胡彭飞 on 16/4/5.
//  Copyright © 2016年 hpf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "jingxuanSelectednodeModel.h"
@interface jingxuanSelectednodeFrameModel : NSObject
@property(nonatomic,strong) jingxuanSelectednodeModel *nodemodel;
@property(nonatomic,assign) CGRect imagesF;
@property(nonatomic,assign) CGRect nameF;
@property(nonatomic,assign) CGRect provinceF;
@property(nonatomic,assign) CGRect favsIconF;
@property(nonatomic,assign) CGRect favsF;
@property(nonatomic,assign) CGRect addsIconF;
@property(nonatomic,assign) CGRect addsF;
@property(nonatomic,assign) CGRect backContentF;
@property(nonatomic,assign) CGRect BigimagesF;
@property(nonatomic,assign) CGRect noteLabelF;
@property(nonatomic,assign) CGFloat cellHight;
@end
