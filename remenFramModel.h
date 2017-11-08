//
//  remenFramModel.h
//  GoFar
//
//  Created by 胡彭飞 on 16/3/21.
//  Copyright © 2016年 hpf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "remenModel.h"
@interface remenFramModel : NSObject
@property(nonatomic,strong) remenModel *remenModels;
/**
 *  image y值
 */
@property(nonatomic,assign) CGRect imageFrame;
/**
 *  地名
 */
@property(nonatomic,assign) CGRect dimingFrame;
/**
 *  景点名
 */
@property(nonatomic,assign) CGRect dimingleftFrame;
/**
 *  星星
 */
@property(nonatomic,assign) CGRect xingxingImageFrame;
/**
 *  星星label
 */
@property(nonatomic,assign) CGRect xingxinglabelFrame;
/**
 *  下载量image
 */
@property(nonatomic,assign) CGRect downloadImageFrame;
/**
 *  下载量label
 */
@property(nonatomic,assign) CGRect downloadlabelFrame;
/**
 *  图片大小
 */
@property(nonatomic,assign) CGRect imagesFrame;
/**
 *  icon
 */
@property(nonatomic,assign) CGRect iconFrame;
/**
 *  pingfen
 */
@property(nonatomic,assign) CGRect pingfenFrame;
/**
 *  pingfenlabelFrame
 */
@property(nonatomic,assign) CGRect pingfenlabelFrame;
/**
 *  text
 */
@property(nonatomic,assign) CGRect textFrame;
/**
 *  底部text
 */
@property(nonatomic,assign) CGRect lastFrame;
/**
 *  横线
 */
@property(nonatomic,assign) CGRect hengxianFrame;
/**
 *  点赞
 */
@property(nonatomic,assign) CGRect dianzanBtnFrame;
/**
 *  评论
 */
@property(nonatomic,assign) CGRect pinglunBtnFrame;
/**
 *  contentView
 */
@property(nonatomic,assign) CGRect contentViewFrame;
/**
 *  cell高度
 */
@property(nonatomic,assign) CGFloat cellH;
@end
