//
//  dongtaiRemenTableViewCell.m
//  GoFar
//
//  Created by 胡彭飞 on 16/3/21.
//  Copyright © 2016年 hpf. All rights reserved.
//

#import "dongtaiRemenTableViewCell.h"
#import "remenModel.h"
#import "remenPoiModel.h"
#import "EGOImageView.h"
#import "remenPCModel.h"
#import "remenImageScrollView.h"
#import "HPDongtaiscrollView.h"
@interface dongtaiRemenTableViewCell()<UIScrollViewDelegate>
@property(nonatomic,weak) EGOImageView *image1;
@property(nonatomic,weak) UILabel *dimingLabel;
@property(nonatomic,weak) UILabel *dimingleftLabel;
@property(nonatomic,weak) UIImageView *xingxing;
@property(nonatomic,weak) UILabel *xingxinglabel;
@property(nonatomic,weak) UIImageView *downloadimage;
@property(nonatomic,weak) UILabel *downloadlabel;
@property(nonatomic,weak) UIScrollView *scrollView;

@property(nonatomic,assign) NSUInteger pageCount;

@property(nonatomic,strong) NSMutableArray *remenScrollArray;
@end

@implementation dongtaiRemenTableViewCell
-(NSMutableArray *)remenScrollArray
{
    if (_remenScrollArray==nil) {
        _remenScrollArray =[NSMutableArray array];
    }
    return _remenScrollArray;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle=UITableViewCellSelectionStyleNone;
        self.backgroundColor=HPcolor(245, 245, 245);
        EGOImageView *image1=[[EGOImageView alloc] init];
        image1.placeholderImage=[UIImage imageNamed:@"image_bg~iphone"];
        image1.layer.cornerRadius=3;
        image1.clipsToBounds=YES;
        self.image1=image1;
        [self.contentView addSubview:image1];
        UILabel *dimingLabel=[[UILabel alloc] init];
        self.dimingLabel=dimingLabel;
        dimingLabel.font=[UIFont systemFontOfSize:16];
        [self.contentView addSubview:dimingLabel];
        
        UILabel *dimingleftLabel=[[UILabel alloc] init];
        self.dimingleftLabel=dimingleftLabel;
        dimingleftLabel.textColor=HPcolor(184, 184, 184);
        dimingleftLabel.font=[UIFont systemFontOfSize:14];
        [self.contentView addSubview:dimingleftLabel];
        
        HPDongtaiscrollView *scrollView=[[HPDongtaiscrollView alloc] init];
        /**
         *  设置边界不被切掉， 可以透视！！！！！重点！~~~~~~~~~~~~~~~很重要！
         */
        scrollView.clipsToBounds=NO;
//        scrollView.decelerationRate=100;
//        scrollView.bounces=NO;
        scrollView.alwaysBounceVertical=NO;
        scrollView.directionalLockEnabled=YES;
        scrollView.showsHorizontalScrollIndicator=NO;
        scrollView.showsVerticalScrollIndicator=NO;
        scrollView.delegate=self;
        self.scrollView=scrollView;
        scrollView.pagingEnabled=YES;
        [self.contentView addSubview:scrollView];
        
        UIImageView *xingxing=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"collect1~iphone"]];
        self.xingxing=xingxing;
        xingxing.contentMode=UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:xingxing];
        
        UILabel *xingxinglabel=[[UILabel alloc] init];
        xingxinglabel.textAlignment=NSTextAlignmentCenter;
        xingxinglabel.textColor=HPcolor(184, 184, 184);
        xingxinglabel.font=[UIFont systemFontOfSize:13];
        self.xingxinglabel=xingxinglabel;
        [self.contentView addSubview:xingxinglabel];
        
        UIImageView *downloadimage=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"addlocation~iphone"]];
        self.downloadimage=downloadimage;
        downloadimage.contentMode=UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:downloadimage];
        
        UILabel *downloadlabel=[[UILabel alloc] init];
        downloadlabel.textAlignment=NSTextAlignmentCenter;
        downloadlabel.textColor=HPcolor(184, 184, 184);
        downloadlabel.font=[UIFont systemFontOfSize:13];
        self.downloadlabel=downloadlabel;
        [self.contentView addSubview:downloadlabel];
        NSMutableArray *remenScrollArray=[NSMutableArray array];
        for (int i=0; i<3; i++) {
             remenImageScrollView *remenScrollViewcontent=[[remenImageScrollView alloc] init];
            [self.scrollView addSubview:remenScrollViewcontent];
            [remenScrollArray addObject:remenScrollViewcontent];
        }
        self.remenScrollArray=remenScrollArray;
     }
    return self;

}
-(void)setRemenframeModel:(remenFramModel *)remenframeModel
{
    remenModel *remenmodel= remenframeModel.remenModels;
    NSString *new1=[remenmodel.poi.img stringByReplacingOccurrencesOfString:@"\"" withString:@""];
    NSString *new2=[new1 stringByReplacingOccurrencesOfString:@"[" withString:@""];
     NSString *new3=[new2 stringByReplacingOccurrencesOfString:@"]" withString:@""];
    self.image1.imageURL=[NSURL URLWithString:new3];
    self.image1.frame=remenframeModel.imageFrame;
    
    self.dimingLabel.text=remenmodel.poi.name;
    self.dimingLabel.frame=remenframeModel.dimingFrame;
    
    self.dimingleftLabel.text=[NSString stringWithFormat:@"%@ %@",remenmodel.poi.city,remenmodel.poi.country];
    self.dimingleftLabel.frame=remenframeModel.dimingleftFrame;
    
    self.xingxing.frame=remenframeModel.xingxingImageFrame;

    self.xingxinglabel.text=remenmodel.poi.favs;
    self.xingxinglabel.frame=remenframeModel.xingxinglabelFrame;
    
    self.downloadimage.frame=remenframeModel.downloadImageFrame;
    
    if (remenmodel.poi.adds.intValue >999) {
        self.downloadlabel.text=@"999+";
    }else
    {
        self.downloadlabel.text=remenmodel.poi.adds;
    
    }
    
    self.downloadlabel.frame=remenframeModel.downloadlabelFrame;
    CGFloat margin=15;
    self.scrollView.frame=CGRectMake(margin, remenframeModel.contentViewFrame.origin.y, remenframeModel.contentViewFrame.size.width+7.5, remenframeModel.contentViewFrame.size.height);
//    self.scrollView.contentSize=CGSizeMake(margin+(remenframeModel.contentViewFrame.size.width+7.5)*remenmodel.pc.count+7.5, self.scrollView.height);
    self.scrollView.contentSize=CGSizeMake((remenframeModel.contentViewFrame.size.width+7.5)*remenmodel.pc.count, self.scrollView.height);
    /**
     *  页数
     */
    for (int i=0; i<remenmodel.pc.count; i++) {
        /**
         *  数据
         */
        remenPCModel *remenpcmodel=remenmodel.pc[i];
        /**
            每个contentview
         */
        if (self.remenScrollArray.count) {
            remenImageScrollView *remenScrollView1=self.remenScrollArray[i];
            remenScrollView1.hidden=NO;
             remenScrollView1.frame=CGRectMake((remenframeModel.contentViewFrame.size.width+7.5)*i, 0,remenframeModel.contentViewFrame.size.width, remenframeModel.contentViewFrame.size.height);
           
       
            remenScrollView1.remenframemodel=remenframeModel;
            remenScrollView1.remenpcmodel=remenpcmodel;
        
        }
    }
    if (remenmodel.pc.count<3) {
        for (int i=remenmodel.pc.count; i<3; i++) {
              remenImageScrollView *remenScrollView1=self.remenScrollArray[i];
            remenScrollView1.hidden=YES;
        }
      
    }
}

@end
