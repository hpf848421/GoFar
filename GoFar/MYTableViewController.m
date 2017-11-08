//
//  MYTableViewController.m
//  GoFar
//
//  Created by 胡彭飞 on 16/3/23.
//  Copyright © 2016年 hpf. All rights reserved.
//

#import "MYTableViewController.h"

@interface MYTableViewController ()

@end

@implementation MYTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavi];
    [self setupTableHeaderView];
}
-(void)setupTableHeaderView
{
    UIView *Headercontent=[[UIView alloc] init];
    Headercontent.size=CGSizeMake(KscreenW, 112);
    UIButton *btn=[[UIButton alloc] initWithFrame:Headercontent.bounds];
    [Headercontent addSubview:btn];
    [btn setBackgroundImage:[UIImage imageNamed:@"click_tologin"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(dengruclick) forControlEvents:UIControlEventTouchUpInside];
    self.tableView.tableHeaderView=Headercontent;
}
-(void)setupNavi
{
    UIView *leftContent=[[UIView alloc] init];
    leftContent.size=CGSizeMake(20, 20);
    UIButton *leftImageV=[[UIButton alloc] init];
    [leftImageV setBackgroundImage:[UIImage imageNamed:@"site_w~iphone"] forState:UIControlStateNormal];
    leftImageV.frame=CGRectMake(0, 0, 20, 20);
    [leftContent addSubview:leftImageV];
    [leftImageV addTarget:self action:@selector(leftClick) forControlEvents:UIControlEventTouchUpInside];
    //    nearbyImageV.contentMode=UIViewContentModeCenter;
    self.navigationItem.leftBarButtonItem =[[UIBarButtonItem alloc] initWithCustomView:leftContent];
    
    UIView *titleContentView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
    UILabel *titleLab1=[[UILabel alloc] init];
    titleLab1.frame=CGRectMake(0, 0, 100, 44);
    titleLab1.text=@"我的";
    titleLab1.font=[UIFont systemFontOfSize:20];
    titleLab1.textAlignment=NSTextAlignmentCenter;
    titleLab1.textColor=[UIColor whiteColor];
    self.navigationItem.titleView=titleLab1;
  
    [titleContentView addSubview:titleLab1];
  
    self.navigationItem.titleView=titleContentView;
    
  
    self.navigationItem.rightBarButtonItem =nil;

}
-(void)leftClick
{
    

}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    return KscreenH-64-112-50;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *Headercontent=[[UIView alloc] init];
    Headercontent.backgroundColor=[UIColor whiteColor];
    Headercontent.size=CGSizeMake(KscreenW, 50);
    UIButton *btn1=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, KscreenW/3, 50)];
    [Headercontent addSubview:btn1];
    [btn1 setTitle:@"行程" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(clickBtn) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btn2=[[UIButton alloc] initWithFrame:CGRectMake(KscreenW/3, 0, KscreenW/3, 50)];
    [Headercontent addSubview:btn2];
    //    [btn1 setBackgroundImage:[UIImage imageNamed:@"click_tologin"] forState:UIControlStateNormal];
    [btn2 setTitle:@"印象" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(clickBtn) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *btn3=[[UIButton alloc] initWithFrame:CGRectMake(KscreenW/3*2, 0, KscreenW/3, 50)];
    [Headercontent addSubview:btn3];
    //    [btn1 setBackgroundImage:[UIImage imageNamed:@"click_tologin"] forState:UIControlStateNormal];
    [btn3 setTitle:@"收藏" forState:UIControlStateNormal];
    [btn3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn3 addTarget:self action:@selector(clickBtn) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *lvseView=[[UIView alloc] initWithFrame:CGRectMake(0, 50-5, KscreenW/3, 5)];
    lvseView.backgroundColor=HPcolor(45, 205, 105);
    [Headercontent addSubview:lvseView];
    return Headercontent;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    static NSString *CellItem=@"cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:CellItem];
    if (cell==nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellItem];
    }
    UIImageView *noDatas=[[UIImageView alloc] init];
    noDatas.alpha=0.4;
    noDatas.image=[UIImage imageNamed:@"myplan_u~iphone"];
    noDatas.frame=CGRectMake(0, 0, KscreenW/3.5, KscreenW/3.5);
    noDatas.center=CGPointMake(KscreenW/2, 200);
    UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, KscreenW, 40)];
    label.textAlignment=NSTextAlignmentCenter;
    label.center=CGPointMake(KscreenW*0.5, CGRectGetMaxY(noDatas.frame)+30);
    label.text=@"点击下方\"+\"添加行程";
    label.alpha=0.4;
    label.textColor=[UIColor blackColor];
    label.font=[UIFont systemFontOfSize:18];
    [cell addSubview:label];
    [cell addSubview:noDatas];
    return cell;
}
-(void)clickBtn
{


}
-(void)dengruclick
{


}
@end
