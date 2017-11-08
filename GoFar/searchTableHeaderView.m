//
//  searchTableHeaderView.m
//  GoFar
//
//  Created by 胡彭飞 on 16/3/15.
//  Copyright © 2016年 hpf. All rights reserved.
//

#import "searchTableHeaderView.h"
@interface searchTableHeaderView ()
@property(nonatomic,strong) UIView *content;
@end
@implementation searchTableHeaderView
static CGFloat marginx=30;
-(instancetype)initWithFrame:(CGRect)frame
{
    
    if (self=[super initWithFrame:frame]) {
        self.backgroundColor=HPcolor(236, 236, 236);
        UIView *content=[[UIView alloc] initWithFrame:CGRectMake(0, 0, KscreenW, CGRectGetHeight(frame)-10)];
        content.backgroundColor=[UIColor whiteColor];
        self.content=content;
        UILabel *remenlab=[[UILabel alloc] initWithFrame:CGRectMake(marginx, marginx-10, 150, 20)];
        remenlab.text=@"热门搜索";
        remenlab.textColor=HPcolor(128, 128, 128);
        [content addSubview:remenlab];
        [self addSubview:content];
    }
    return self;
}
-(void)setSearchData:(NSArray *)searchData
{
    _searchData=searchData;
    for (int i=0; i<searchData.count; i++) {
        
        int lie=i%3;
        int hang=i/3;
        CGFloat marginJ=10;
        CGFloat btnW=(KscreenW-2*marginx-2*marginJ)/3;
        CGFloat btnH=55;
        UIButton *btn=[[UIButton alloc] initWithFrame:CGRectMake(marginx+(btnW+marginJ)*lie, 85+hang*(btnH+marginJ), btnW, btnH)];
        [btn setBackgroundImage:[UIImage imageNamed:@"CTAssetsPickerVideo"] forState:UIControlStateNormal];
        btn.tag=i;
//        [btn setBackgroundColor:[UIColor redColor]];
        [btn setTitle:searchData[i] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnclick:) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.content addSubview:btn];
    }

}
-(void)btnclick:(UIButton *)btn
{
    if ([self.delegate respondsToSelector:@selector(searchTableHeaderView:clickBtnTag:)]) {
        [self.delegate searchTableHeaderView:self clickBtnTag:btn.tag];
    }
}
@end
