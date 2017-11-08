//
//  remenFramModel.m
//  GoFar
//
//  Created by 胡彭飞 on 16/3/21.
//  Copyright © 2016年 hpf. All rights reserved.
//

#import "remenFramModel.h"
#import "remenModel.h"
@implementation remenFramModel
-(void)setRemenModels:(remenModel *)remenModels
{
    _remenModels=remenModels;
    /**
     *  计算frame
     */
// CGRect imageFrame;
    CGFloat marginX=15;
    CGFloat marginY=10;
    CGFloat imageW=30;
    CGRect imageFrame=CGRectMake(marginX, marginY, imageW, imageW);
    self.imageFrame=imageFrame;
//  CGRect dimingFrame;
    CGFloat dimingW=150;
    CGRect dimingFrame=CGRectMake(CGRectGetMaxX(imageFrame)+marginX, marginY, dimingW, imageW*0.5);
    self.dimingFrame=dimingFrame;
//   CGRect dimingleftFrame;
    CGFloat dimingleftW=dimingW;
    CGRect dimingleftFrame=CGRectMake(CGRectGetMinX(dimingFrame), CGRectGetMaxY(dimingFrame), dimingleftW, imageW*0.5);
    self.dimingleftFrame=dimingleftFrame;
    
//    xingxingImageFrame
    
    self.xingxingImageFrame=CGRectMake(KscreenW-100, marginY, 40, imageW*0.5);
//    xingxinglabelFrame;
     self.xingxinglabelFrame=CGRectMake(KscreenW-100, CGRectGetMaxY(self.xingxingImageFrame), 40, imageW*0.5);
//    downloadImageFrame
    self.downloadImageFrame=CGRectMake(KscreenW-60, marginY, 40, imageW*0.5);
//    downloadImageFrame
    self.downloadlabelFrame=CGRectMake(KscreenW-60, CGRectGetMaxY(self.xingxingImageFrame), 40, imageW*0.5);
    
//  CGRect imagesFrame;
    CGFloat imagesW=KscreenW-2*marginX;
    CGRect imagesFrame=CGRectMake(0, 0, imagesW, imagesW-10);
    self.imagesFrame=imagesFrame;
//   CGRect iconFrame;
    CGFloat iconW=30;
    CGRect iconFrame=CGRectMake(marginX, CGRectGetMaxY(imagesFrame)+marginY, iconW, iconW);
    self.iconFrame=iconFrame;
//    pingfenFrame
    CGFloat pingfenW=65;
    self.pingfenFrame=CGRectMake(CGRectGetMaxX(iconFrame)+marginX, CGRectGetMinY(iconFrame), pingfenW, iconW*0.5);
//    pingfenlabelFrame
    CGFloat pingfenLabelW=200;
    self.pingfenlabelFrame=CGRectMake(CGRectGetMinX(self.pingfenFrame), CGRectGetMaxY(self.pingfenFrame), pingfenLabelW, iconW*0.5);
//   CGRect textFrame;
    CGFloat textH=60;
    CGRect textFrame=CGRectMake(marginX, CGRectGetMaxY(iconFrame)+marginY, imagesFrame.size.width-2*marginX, textH);
    self.textFrame=textFrame;
//  CGRect lastFrame;
    CGFloat lasttextH=25;
    CGRect lastFrame=CGRectMake(marginX, CGRectGetMaxY(textFrame)+marginY, imagesFrame.size.width-2*marginX, lasttextH);
    self.lastFrame=lastFrame;
//    hengxianFrame
    CGFloat hengxianW=KscreenW-4*marginX;
    CGRect hengxianFrame=CGRectMake(marginX, CGRectGetMaxY(lastFrame)+marginY, hengxianW, 1);
    self.hengxianFrame=hengxianFrame;
//    dianzanBtnFrame
    CGFloat diananW=30;
    self.dianzanBtnFrame=CGRectMake(KscreenW*0.6, CGRectGetMaxY(hengxianFrame)+marginY, diananW, diananW);
//    pinglunBtnFrame
    self.pinglunBtnFrame=CGRectMake(CGRectGetMaxX(self.dianzanBtnFrame)+2*marginX, CGRectGetMaxY(hengxianFrame)+marginY, diananW, diananW);
// contentView
    CGRect contentViewFrame=CGRectMake(marginX, CGRectGetMaxY(imageFrame)+marginY,KscreenW-2*marginX , CGRectGetMaxY(lastFrame)+2*marginY+CGRectGetMaxY(imageFrame));
    self.contentViewFrame=contentViewFrame;
//   CGPoint cellH;
//    CGFloat 
    self.cellH=CGRectGetMaxY(self.contentViewFrame);
}

@end
