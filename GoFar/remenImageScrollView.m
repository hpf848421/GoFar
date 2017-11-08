//
//  remenImageScrollView.m
//  GoFar
//
//  Created by 胡彭飞 on 16/3/22.
//  Copyright © 2016年 hpf. All rights reserved.
//

#import "remenImageScrollView.h"

@interface remenImageScrollView()
@property(nonatomic,weak) EGOImageView *iconImage;
@property(nonatomic,weak) UIImageView *pingfenImage;
@property(nonatomic,weak) UILabel *oneword;
@property(nonatomic,weak) UILabel *jinhaoLabel;
@property(nonatomic,weak) UIView *ratingView;
@property(nonatomic,weak) UILabel *pingfenLabel;
@property(nonatomic,weak) UIImageView *bottomView;
@property(nonatomic,weak) UIButton *dianzanBtn;
@property(nonatomic,weak) UIButton *pinglunBtn;

@property(nonatomic,weak) EGOImageView *bigImageView1;
@property(nonatomic,weak) EGOImageView *bigImageView2;
@end
@implementation remenImageScrollView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        self.backgroundColor=[UIColor whiteColor];
        self.layer.cornerRadius=5;
        self.clipsToBounds=YES;
            EGOImageView *bigImageView1=[[EGOImageView alloc] init];
            bigImageView1.placeholderImage=[UIImage imageNamed:@"image_loading~iphone"];
            self.bigImageView1=bigImageView1;
            bigImageView1.layer.cornerRadius=3;
            bigImageView1.clipsToBounds=YES;
            [self addSubview:bigImageView1];
//            EGOImageView *bigImageView2=[[EGOImageView alloc] init];
//            bigImageView2.placeholderImage=[UIImage imageNamed:@"image_loading~iphone"];
//            self.bigImageView2=bigImageView2;
//            bigImageView2.layer.cornerRadius=3;
//            bigImageView2.clipsToBounds=YES;
//            [self addSubview:bigImageView2];
        
            EGOImageView *iconImage=[[EGOImageView alloc] init];
            iconImage.placeholderImage=[UIImage imageNamed:@"image_bg~iphone"];
            self.iconImage=iconImage;
            //        iconImage.layer.cornerRadius=3;
            //        iconImage.clipsToBounds=YES;
            [self addSubview:iconImage];
            UIView *ratingView=[[UIView alloc] init];
            self.ratingView=ratingView;
            [self addSubview:ratingView];

            UILabel *pingfenLabel=[[UILabel alloc] init];
            pingfenLabel.textColor=HPcolor(184, 184, 184);
            pingfenLabel.font=[UIFont systemFontOfSize:13];
            self.pingfenLabel=pingfenLabel;
            [self  addSubview:pingfenLabel];
            
            UILabel *oneWord=[[UILabel alloc] init];
            self.oneword=oneWord;
            oneWord.textAlignment=NSTextAlignmentCenter;
            oneWord.textColor=HPcolor(144, 144, 144);
            oneWord.numberOfLines=0;
            oneWord.font=[UIFont systemFontOfSize:15];
            [self  addSubview:oneWord];
            
            UILabel *jinhaoLabel=[[UILabel alloc] init];
            jinhaoLabel.textColor=HPcolor(169, 190, 188);
            jinhaoLabel.font=[UIFont systemFontOfSize:14];
            self.jinhaoLabel=jinhaoLabel;
            [self  addSubview:jinhaoLabel];
            UIImageView *bottomView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bottomshadow~iphone"]];
            self.bottomView=bottomView;
            [self  addSubview:bottomView];
            
            UIButton *dianzanBtn=[[UIButton alloc] init];
            dianzanBtn.titleEdgeInsets=UIEdgeInsetsMake(0, 5, 0, 0);
            dianzanBtn.titleLabel.font=[UIFont systemFontOfSize:14];
            [dianzanBtn setTitleColor:HPcolor(202, 202, 202) forState:UIControlStateNormal];
            [dianzanBtn setImage:[UIImage imageNamed:@"zan_s1~iphone"] forState:UIControlStateNormal];
            [dianzanBtn setImage:[UIImage imageNamed:@"zan_s2~iphone"] forState:UIControlStateSelected];
            dianzanBtn.adjustsImageWhenHighlighted=NO;
            [self  addSubview:dianzanBtn];
            self.dianzanBtn=dianzanBtn;
            
            UIButton *pinglunBtn=[[UIButton alloc] init];
            pinglunBtn.titleEdgeInsets=UIEdgeInsetsMake(0, 5, 0, 0);
            pinglunBtn.titleLabel.font=[UIFont systemFontOfSize:14];
            pinglunBtn.adjustsImageWhenHighlighted=NO;
            [pinglunBtn setTitleColor:HPcolor(202, 202, 202) forState:UIControlStateNormal];
            [pinglunBtn setImage:[UIImage imageNamed:@"comment_s~iphone"] forState:UIControlStateNormal];
            [self  addSubview:pinglunBtn];
            self.pinglunBtn=pinglunBtn;

    }
        return self;
}
-(void)setRemenframemodel:(remenFramModel *)remenframemodel
{
    _remenframemodel=remenframemodel;
    self.bigImageView1.frame=remenframemodel.imagesFrame;
    self.iconImage.frame=remenframemodel.iconFrame;
    self.ratingView.frame=remenframemodel.pingfenFrame;
    self.pingfenLabel.frame=remenframemodel.pingfenlabelFrame;
    self.dianzanBtn.frame=remenframemodel.dianzanBtnFrame;
    self.pinglunBtn.frame=remenframemodel.pinglunBtnFrame;
    self.oneword.frame=remenframemodel.textFrame;
    self.jinhaoLabel.frame=remenframemodel.lastFrame;
    self.bottomView.frame=remenframemodel.hengxianFrame;
}
-(void)setRemenpcmodel:(remenPCModel *)remenpcmodel
{

    _remenpcmodel=remenpcmodel;
    NSString *newstr1=[remenpcmodel.images substringFromIndex:2];
    NSRange newstr2=[newstr1 rangeOfString:@"\""];
    NSString *imageStr=[newstr1 substringToIndex:newstr2.location];
    //        NSLog(@"%@",[NSString stringWithFormat:@"http://img.chufaba.me/%@",imageStr]);
    //        http://img.chufaba.me/poi_comment_2784fb3f-d772-4c71-ad66-00c12ee2dd40.jpg!375
    self.bigImageView1.imageURL=[NSURL URLWithString:[NSString stringWithFormat:@"http://img.chufaba.me/%@",imageStr]];
    
    
    self.iconImage.imageURL=[NSURL URLWithString:remenpcmodel.avatar];
    

    for(int i=0;i<5;i++)
    {
        CGFloat ratingW=self.remenframemodel.pingfenFrame.size.width/5;
        UIImageView *ratingImage;
        if (i<remenpcmodel.rating.intValue) {
            ratingImage =[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"hot_order~iphone"]];
        }else{
            ratingImage=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"hot_order_u~iphone"]];
        }
        ratingImage.frame=CGRectMake(ratingW*i, 0, ratingW, self.ratingView.height);
        [self.ratingView addSubview:ratingImage];
    }
    switch (remenpcmodel.rating.intValue) {
        case 1:
        case 2:
        case 3:
            self.pingfenLabel.text=[NSString stringWithFormat:@"%@ 觉得一般",remenpcmodel.username];
            break;
        case 4:
            self.pingfenLabel.text=[NSString stringWithFormat:@"%@ 觉得好",remenpcmodel.username];
            break;
        case 5:
            self.pingfenLabel.text=[NSString stringWithFormat:@"%@ 觉得超赞",remenpcmodel.username];
            break;
    }

    [self.dianzanBtn setTitle:remenpcmodel.likes forState:UIControlStateNormal];
    
   
    [self.pinglunBtn setTitle:remenpcmodel.comments forState:UIControlStateNormal];
    
    
 
    self.oneword.text=remenpcmodel.desc;
    

    self.jinhaoLabel.text=[NSString stringWithFormat:@"#%@#",remenpcmodel.topics];

}
@end
