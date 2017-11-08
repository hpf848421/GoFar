//
//  jingxuanSelectedTableViewCell.m
//  GoFar
//
//  Created by 胡彭飞 on 16/4/5.
//  Copyright © 2016年 hpf. All rights reserved.
//

#import "jingxuanSelectedTableViewCell.h"
#import "EGOImageView.h"
@interface jingxuanSelectedTableViewCell ()
@property(nonatomic,weak) EGOImageView *imageicon;
@property(nonatomic,weak) UILabel *nameLabel;
@property(nonatomic,weak) UILabel *provinceLabel;
@property(nonatomic,weak) UIImageView *favsImage;
@property(nonatomic,weak) UILabel *favsLabel;
@property(nonatomic,weak) UIImageView *addsImage;
@property(nonatomic,weak) UILabel *addsLabel;
@property(nonatomic,weak) UIView *backContent;
@property(nonatomic,weak) EGOImageView *bigimages;
@property(nonatomic,weak) UILabel *noteLabel;
@end

@implementation jingxuanSelectedTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor=HPcolor(245, 245, 245);
        EGOImageView *imageicon=[[EGOImageView alloc] init];
        self.imageicon=imageicon;
        [self.contentView addSubview:imageicon];
        
        UILabel *nameLabel=[[UILabel alloc] init];
        nameLabel.textColor=[UIColor blackColor];
        nameLabel.font=[UIFont systemFontOfSize:20];
        self.nameLabel=nameLabel;
        [self.contentView addSubview:nameLabel];
        
        UILabel *provinceLabel=[[UILabel alloc] init];
        provinceLabel.textColor=[UIColor grayColor];
        provinceLabel.font=[UIFont systemFontOfSize:15];
        self.provinceLabel=provinceLabel;
        [self.contentView addSubview:provinceLabel];
        
        UIImageView *favsImage=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"collect1~iphone.png"]];
        favsImage.contentMode=UIViewContentModeScaleAspectFit;
        self.favsImage=favsImage;
        [self.contentView addSubview:favsImage];
        UILabel *favsLabel=[[UILabel alloc] init];
        favsLabel.textAlignment=NSTextAlignmentCenter;
        favsLabel.textColor=[UIColor grayColor];
        favsLabel.font=[UIFont systemFontOfSize:15];
        self.favsLabel=favsLabel;
        [self.contentView addSubview:favsLabel];
        
        UIImageView *addsImage=[[UIImageView alloc] init];
        [addsImage setImage:[UIImage imageNamed:@"addlocation~iphone.png"]];
        addsImage.contentMode=UIViewContentModeScaleAspectFit;
        self.addsImage=addsImage;
        [self.contentView addSubview:addsImage];
        UILabel *addsLabel=[[UILabel alloc] init];
        addsLabel.textAlignment=NSTextAlignmentCenter;
        addsLabel.textColor=[UIColor grayColor];
        addsLabel.font=[UIFont systemFontOfSize:15];
        self.addsLabel=addsLabel;
        [self.contentView addSubview:addsLabel];
        
        UIView *backContent=[[UIView alloc] init];
        self.backContent=backContent;
        backContent.backgroundColor=[UIColor whiteColor];
        [self.contentView addSubview:backContent];
        
        EGOImageView *bigimages=[[EGOImageView alloc] init];
        self.bigimages=bigimages;
        bigimages.layer.cornerRadius=5;
        bigimages.clipsToBounds=YES;
        [self.backContent addSubview:bigimages];
        
        UILabel *noteLabel=[[UILabel alloc] init];
        noteLabel.numberOfLines=0;
        noteLabel.textColor=[UIColor grayColor];
        noteLabel.font=[UIFont systemFontOfSize:15];
        self.noteLabel=noteLabel;
        [self.backContent addSubview:noteLabel];
        
    }
    return self;
}
-(void)setNodeFrameModel:(jingxuanSelectednodeFrameModel *)nodeFrameModel
{
    _nodeFrameModel=nodeFrameModel;
    jingxuanSelectednodeModel *nodemodel=nodeFrameModel.nodemodel;
    self.imageicon.frame=nodeFrameModel.imagesF;
    NSString *urlstr;
    if (nodemodel.images.count) {
       urlstr=nodemodel.images[0];
     [self.imageicon setImageURL:[NSURL URLWithString:urlstr]];
    }
    
   
    
    self.nameLabel.frame=nodeFrameModel.nameF;
    self.nameLabel.text=nodemodel.name;
    
    self.provinceLabel.frame=nodeFrameModel.provinceF;
    self.provinceLabel.text=[NSString stringWithFormat:@"%@ %@",nodemodel.province,nodemodel.country];
    
    self.favsImage.frame=nodeFrameModel.favsIconF;
    self.favsLabel.frame=nodeFrameModel.favsF;
    self.favsLabel.text=nodemodel.favs;
    
    self.addsImage.frame=nodeFrameModel.addsIconF;
    self.addsLabel.frame=nodeFrameModel.addsF;
    self.addsLabel.text=nodemodel.favs;
    
    self.bigimages.frame=nodeFrameModel.BigimagesF;
    if (nodemodel.images.count) {
        [self.bigimages setImageURL:[NSURL URLWithString:urlstr]];
    }
    
    
    self.noteLabel.frame=nodeFrameModel.noteLabelF;
    self.noteLabel.text=nodemodel.note;
    
    self.backContent.frame=nodeFrameModel.backContentF;

}
@end
