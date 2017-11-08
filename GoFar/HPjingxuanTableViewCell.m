//
//  HPjingxuanTableViewCell.m
//  GoFar
//
//  Created by 胡彭飞 on 16/3/14.
//  Copyright © 2016年 hpf. All rights reserved.
//

#import "HPjingxuanTableViewCell.h"
#import "EGOImageView.h"
@interface HPjingxuanTableViewCell ()<EGOImageViewDelegate>
@property(nonatomic,weak) EGOImageView *backGroundView;
@property(nonatomic,weak) UIView *coverView;
@property(nonatomic,weak) UILabel *titleLabel1;
@property(nonatomic,weak) UILabel *highlightsLabel;
@property(nonatomic,weak) EGOImageView *imageIcon;
@end
@implementation HPjingxuanTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle=UITableViewCellSelectionStyleNone;
        EGOImageView *backGroundView=[[EGOImageView alloc] init];
        self.backGroundView=backGroundView;
        backGroundView.layer.cornerRadius=5;
        backGroundView.clipsToBounds=YES;
//        backGroundView.alpha=0.95;
        [self.contentView addSubview:backGroundView];
        
        UIView *coverView=[[UIView alloc] init];
        coverView.layer.cornerRadius=5;
        coverView.clipsToBounds=YES;
        coverView.backgroundColor=[UIColor blackColor];
        coverView.alpha=0.3;
        self.coverView=coverView;
        [backGroundView addSubview:coverView];
        
        UILabel *titleLabel1=[[UILabel alloc] init];
        self.titleLabel1=titleLabel1;
        titleLabel1.font=[UIFont systemFontOfSize:25];
        titleLabel1.textColor=[UIColor whiteColor];
        titleLabel1.lineBreakMode=NSLineBreakByTruncatingMiddle;
        titleLabel1.textAlignment=NSTextAlignmentCenter;
        titleLabel1.contentMode=UIViewContentModeCenter;
        [self.contentView addSubview:titleLabel1];
        
        UILabel *highlightsLabel=[[UILabel alloc] init];
        self.highlightsLabel=highlightsLabel;
        highlightsLabel.font=[UIFont systemFontOfSize:15];
        highlightsLabel.textColor=[UIColor whiteColor];
        highlightsLabel.lineBreakMode=NSLineBreakByTruncatingMiddle;
        highlightsLabel.textAlignment=NSTextAlignmentCenter;
      
        [self.contentView addSubview:highlightsLabel];
        
        EGOImageView *imageIcon=[[EGOImageView alloc] init];
        imageIcon.delegate=self;
        self.imageIcon=imageIcon;
        [self.contentView addSubview:imageIcon];
    }

    return self;
}
-(void)setItem:(HPjingxuanItem *)item
{
    _item=item;
    if (item.background_image) {
        
        [self.backGroundView setImageURL:[NSURL URLWithString:item.background_image]];
        
    }
    if (item.image) {
         [self.backGroundView setImageURL:[NSURL URLWithString:item.image]];
    }
    if (item.image1) {
        [self.backGroundView setImageURL:[NSURL URLWithString:item.image1]];
    }
    if (item.title) {
        self.titleLabel1.text=item.title;
        
    }else if(item.name)
    {
         self.titleLabel1.text=item.name;
    }

    if ([self.item.res_type isEqualToString:@"1"]||[self.item.res_type isEqualToString:@"2"])
    {
        self.highlightsLabel.text=[NSString stringWithFormat:@"── · %@ · ──",item.highlights];
//        CGFloat LabelWidth=[self.highlightsLabel.text boundingRectWithSize:CGSizeMake(MAXFLOAT, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size.width;
//        if (LabelWidth>(KscreenW-50)) {
//            NSRange lengthRange=NSRangeFromString(self.highlightsLabel.text);
//            NSRange range=NSMakeRange(10, lengthRange.length-20);
//            self.highlightsLabel.text=[self.highlightsLabel.text stringByReplacingCharactersInRange:range withString:@"···"];
//        }
    }else if([self.item.res_type isEqualToString:@"3"])
    {
        self.highlightsLabel.text=[NSString stringWithFormat:@"── · %@ · ──",item.destinations];
        
    }else if([self.item.res_type isEqualToString:@"10"])
    {
        self.highlightsLabel.text=[NSString stringWithFormat:@"── · %@ · ──",item.subtitle];
    }

    if (item.avatar) {
        [self.imageIcon setImageURL:[NSURL URLWithString:item.avatar]];
    }

}
-(UIImage *)drawCirleImage:(UIImage *)image
{
    UIGraphicsBeginImageContext(image.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 2);
    CGRect rect = CGRectMake(0, 0, image.size.width,image.size.height);
    CGContextAddEllipseInRect(context, rect);
    CGContextClip(context);
    [image drawInRect:rect];
    CGContextAddEllipseInRect(context, rect);
    CGContextStrokePath(context);
    UIImage *newimg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newimg;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
//    NSLog(@"%@",NSStringFromCGRect(self.frame));
    CGFloat marginX=10;
    CGFloat marginY=5;
    self.backGroundView.frame=CGRectMake(marginX, marginY, KscreenW-2*marginX, self.height-2*marginY);
    self.coverView.frame=self.backGroundView.bounds;
    if ([self.item.res_type isEqualToString:@"1"]||[self.item.res_type isEqualToString:@"2"]) {
//        [self.titleLabel1 sizeToFit];
        self.self.titleLabel1.size=CGSizeMake(self.backGroundView.width-10, 30);
        self.titleLabel1.center=CGPointMake(KscreenW*0.5, self.height*0.5-17);
        
//        [self.highlightsLabel sizeToFit];
        self.highlightsLabel.size=CGSizeMake(self.backGroundView.width-10, 30);
        self.highlightsLabel.center=CGPointMake(KscreenW*0.5, self.height*0.5+10);
     
        self.imageIcon.hidden=YES;
    }else if([self.item.res_type isEqualToString:@"3"])
    {
        self.highlightsLabel.size=CGSizeMake(self.backGroundView.width-10, 30);
        self.titleLabel1.center=CGPointMake(KscreenW*0.5, self.height*0.5-20);
        
        self.highlightsLabel.size=CGSizeMake(self.backGroundView.width-10, 30);
        self.highlightsLabel.center=CGPointMake(KscreenW*0.5, self.height*0.5+10);
        
        self.imageIcon.hidden=NO;
        self.imageIcon.size=CGSizeMake(40, 40);
        self.imageIcon.center=CGPointMake(KscreenW*0.5, CGRectGetMaxY(self.highlightsLabel.frame)+25);
    }else if([self.item.res_type isEqualToString:@"10"])
    {
        self.imageIcon.hidden=YES;
    }
}
- (void)imageViewLoadedImage:(EGOImageView*)imageView
{
    UIImage *oldImage=self.imageIcon.image;
    UIImage *newImage=[self drawCirleImage:oldImage];
    self.imageIcon.image=newImage;

}
@end
