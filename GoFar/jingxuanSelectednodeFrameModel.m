//
//  jingxuanSelectednodeFrameModel.m
//  GoFar
//
//  Created by 胡彭飞 on 16/4/5.
//  Copyright © 2016年 hpf. All rights reserved.
//

#import "jingxuanSelectednodeFrameModel.h"

@implementation jingxuanSelectednodeFrameModel
-(void)setNodemodel:(jingxuanSelectednodeModel *)nodemodel
{
    _nodemodel=nodemodel;
//    @property(nonatomic,assign) CGRect *imagesF;
    CGFloat marginX=15;
    CGFloat marginY=15;
    CGFloat marginSX=5;
    CGFloat imagesW=50;
    self.imagesF=CGRectMake(marginX, marginY, imagesW, imagesW);
//    @property(nonatomic,assign) CGRect *nameF;
    self.nameF=CGRectMake(CGRectGetMaxX(_imagesF)+marginX, marginY, 150, imagesW*0.5);
//    @property(nonatomic,assign) CGRect *provinceF;
    self.provinceF=CGRectMake(CGRectGetMaxX(_imagesF)+marginX, CGRectGetMaxY(_nameF), 150, imagesW*0.5);
//    @property(nonatomic,assign) CGRect *favsIconF;
    self.favsIconF=CGRectMake(KscreenW-120, marginY, 50, imagesW*0.5);
//    @property(nonatomic,assign) CGRect *favsF;
    self.favsF=CGRectMake(KscreenW-120, CGRectGetMaxY(_favsIconF), 50, imagesW*0.5);
//    @property(nonatomic,assign) CGRect *addsIconF;
    self.addsIconF=CGRectMake(KscreenW-60, marginY, 50, imagesW*0.5);
//    @property(nonatomic,assign) CGRect *addsF;
    self.addsF=CGRectMake(KscreenW-60, CGRectGetMaxY(_addsIconF), 50, imagesW*0.5);
//    @property(nonatomic,assign) CGRect *BigimagesF;
    CGFloat bigimagesW=KscreenW-2*marginSX;
    self.BigimagesF=CGRectMake(0, 0, bigimagesW,bigimagesW*0.8);
//    @property(nonatomic,assign) CGRect *noteLabelF;
    NSString *nodeStr=nodemodel.note;
    CGFloat noteMarginX=10;
    CGFloat noteHeight=[nodeStr boundingRectWithSize:CGSizeMake(bigimagesW-2*noteMarginX, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size.height;
    self.noteLabelF=CGRectMake(noteMarginX, CGRectGetMaxY(_BigimagesF)+noteMarginX, bigimagesW-2*noteMarginX, noteHeight);
//    @property(nonatomic,assign) CGRect *backContentF;
    self.backContentF=CGRectMake(marginSX, CGRectGetMaxY(_imagesF)+marginY, KscreenW-2*marginSX, CGRectGetMaxY(_noteLabelF)+marginY);
//    @property(nonatomic,assign) CGFloat *cellHight;
    self.cellHight=CGRectGetMaxY(self.backContentF)+marginY;
}
@end
