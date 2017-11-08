//
//  DestinationTableViewCell.m
//  GoFar
//
//  Created by 胡彭飞 on 16/3/17.
//  Copyright © 2016年 hpf. All rights reserved.
//

#import "EGOImageView.h"
#import "DestinationTableViewCell.h"
static CGFloat marginx=15;
static CGFloat marginJ=10;
#define btnW (KscreenW-2*marginx-2*marginJ)/3
@interface DestinationTableViewCell()
@property(nonatomic,weak) UILabel *diqu;
@property(nonatomic,weak) UILabel *mudidi;
@property(nonatomic,strong) NSMutableArray *btnArrays;
@end
@implementation DestinationTableViewCell
-(NSMutableArray *)btnArrays
{
    if (_btnArrays==nil) {
        _btnArrays=[NSMutableArray array];
    }
    return _btnArrays;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UILabel *diqu=[[UILabel alloc] init];
        self.diqu=diqu;
        diqu.font=[UIFont systemFontOfSize:18];
        diqu.textColor=[UIColor blackColor];
        [self.contentView addSubview:diqu];
        
        UILabel *mudidi=[[UILabel alloc] init];
        self.mudidi=mudidi;
        mudidi.textAlignment=NSTextAlignmentRight;
        mudidi.font=[UIFont systemFontOfSize:16];
        mudidi.textColor=HPcolor(182, 182, 182);
        [self.contentView addSubview:mudidi];
        for (int i=0; i<6; i++) {
            EGOImageView *btn=[[EGOImageView alloc] init];
            btn.tag=i;
            btn.contentMode=UIViewContentModeScaleAspectFill;
            btn.clipsToBounds=YES;
            [self.contentView addSubview:btn];
            [self.btnArrays addObject:btn];
            UIView *coverView=[[UIView alloc]init];
            coverView.backgroundColor=[UIColor grayColor];
            coverView.tag=99;
            coverView.alpha=0.25;
            [btn addSubview:coverView];
            UILabel *diming=[[UILabel alloc] init];
            diming.font=[UIFont systemFontOfSize:25];
            diming.textColor=[UIColor whiteColor];
            diming.tag=100;
            UILabel *dimingE=[[UILabel alloc] init];
            dimingE.font=[UIFont fontWithName:@"TimesNewRomanPS-ItalicMT" size:13];
            dimingE.textColor=[UIColor whiteColor];
            dimingE.tag=101;
            [btn addSubview:diming];
            [btn addSubview:dimingE];
        }
    }
    return self;
}
-(void)setDiquStr:(NSString *)diquStr
{
    _diquStr=[diquStr copy];
    self.diqu.text=diquStr;

}
-(void)setTraveldatas:(NSDictionary *)Traveldatas
{
    _Traveldatas=Traveldatas;
    NSArray *datas=Traveldatas[@"guides"];
     NSString *totalCount=Traveldatas[@"total"];
    self.mudidi.text=[NSString stringWithFormat:@"%@个热门目的地>",totalCount];
    for (int i=0; i<datas.count; i++) {
        EGOImageView *btn=self.btnArrays[i];
//        NSLog(@"%@",datas[i][@"img"]);
//        btn.backgroundColor=[UIColor redColor];
        [btn setImageURL:[NSURL URLWithString:datas[i][@"img"]]];
        UILabel *diming=(UILabel *)[btn viewWithTag:100];
        diming.text=datas[i][@"name"];
        UILabel *dimingE=(UILabel *)[btn viewWithTag:101];
        dimingE.text=datas[i][@"name_en"];
    }
    
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    self.diqu.frame=CGRectMake(marginx, 15, 100, 30);
    self.mudidi.frame=CGRectMake(self.contentView.width-200, 15, 180, 30);
    for (int i=0; i<6; i++) {
        int lie=i%3;
        int hang=i/3;
//        NSLog(@"%f",btnW);
        CGFloat btnH=btnW*1.4;
         EGOImageView *btn=self.btnArrays[i];
        btn.frame=CGRectMake(marginx+(btnW+marginJ)*lie, CGRectGetMaxY(self.diqu.frame)+15+hang*(btnH+marginJ), btnW, btnH);
        UIView *coverView=[btn viewWithTag:99];
        coverView.frame=CGRectMake(0, 0, btn.width, btn.height);
        UILabel *diming=(UILabel *)[btn viewWithTag:100];
        diming.frame=CGRectMake(10, btn.height*0.5+2, btn.width-20, 30);
        UILabel *dimingE=(UILabel *)[btn viewWithTag:101];
        dimingE.frame=CGRectMake(10, CGRectGetMaxY(diming.frame)+5, btn.width-20, 20);
    }
    
}

@end
