//
//  searchTableHeaderView.h
//  GoFar
//
//  Created by 胡彭飞 on 16/3/15.
//  Copyright © 2016年 hpf. All rights reserved.
//
@class searchTableHeaderView;
@protocol searchTableHeaderViewDelegate <NSObject>

@optional
-(void)searchTableHeaderView:(searchTableHeaderView *)headerView clickBtnTag:(NSInteger)tag;
@end
#import <UIKit/UIKit.h>

@interface searchTableHeaderView : UIView
@property(nonatomic,strong) NSArray *searchData;
@property(nonatomic,weak) id<searchTableHeaderViewDelegate> delegate;
@end
