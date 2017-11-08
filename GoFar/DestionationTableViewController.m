//
//  DestionationTableViewController.m
//  GoFar
//
//  Created by 胡彭飞 on 16/3/17.
//  Copyright © 2016年 hpf. All rights reserved.
//

#import "DestionationTableViewController.h"
#import "HPSearchNavigationController.h"
#import "DestinationTableViewCell.h"
@interface DestionationTableViewController ()
@property(nonatomic,strong) NSDictionary *guidesArray;
@end

@implementation DestionationTableViewController
-(NSDictionary *)guidesArray
{
    if (_guidesArray==nil) {
        _guidesArray=[NSDictionary dictionary];
    }
    return _guidesArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.contentInset=UIEdgeInsetsMake(0, 0, 64, 0);
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self setupNavi];
    [self loadDatas];
}
-(void)setupNavi
{
    UIView *nearbyContent=[[UIView alloc] init];
    nearbyContent.size=CGSizeMake(20, 20);
    UIButton *nearbyImageV=[[UIButton alloc] init];
   [nearbyImageV setBackgroundImage:[UIImage imageNamed:@"nearby~iphone"] forState:UIControlStateNormal];
    nearbyImageV.frame=CGRectMake(0, 0, 20, 20);
    [nearbyContent addSubview:nearbyImageV];
    [nearbyImageV addTarget:self action:@selector(nearbyClick) forControlEvents:UIControlEventTouchUpInside];
//    nearbyImageV.contentMode=UIViewContentModeCenter;
    self.navigationItem.leftBarButtonItem =[[UIBarButtonItem alloc] initWithCustomView:nearbyContent];
    UILabel *titleLab=[[UILabel alloc] init];
    titleLab.size=CGSizeMake(100, 44);
    titleLab.text=@"目的地";
    titleLab.font=[UIFont systemFontOfSize:22];
    titleLab.textAlignment=NSTextAlignmentCenter;
    titleLab.textColor=[UIColor whiteColor];
    self.navigationItem.titleView=titleLab;
    UIView *searchContent=[[UIView alloc] init];
    searchContent.size=CGSizeMake(20, 20);
    UIButton *searchImageV=[[UIButton alloc] init];
   [searchImageV setBackgroundImage:[UIImage imageNamed:@"discover_search~iphone"] forState:UIControlStateNormal];
    searchImageV.frame=CGRectMake(0, 0, 20, 20);
    [searchContent addSubview:searchImageV];
    [searchImageV addTarget:self action:@selector(searchClick) forControlEvents:UIControlEventTouchUpInside];
//    searchImageV.contentMode=UIViewContentModeCenter;
    self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc] initWithCustomView:searchContent];

}
-(void)loadDatas
{

    AFHTTPRequestOperationManager *manner=[[AFHTTPRequestOperationManager alloc] init];
    [manner GET:@"https://api.chufaba.me/v2/guides/hot" parameters:@{} success:^(AFHTTPRequestOperation *operation, id responseObject) {
//           NSLog(@"%@",responseObject);
        NSDictionary *datas=responseObject[@"data"];
        self.guidesArray=datas;
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
    
}
#pragma mark navi左边点击
-(void)nearbyClick
{

}
#pragma mark navi右边点击
-(void)searchClick
{
    HPSearchNavigationController *searchNvc=[[HPSearchNavigationController alloc] init];
    [self.navigationController pushViewController:searchNvc animated:YES];
}
#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellItem=@"travelDestination";
    DestinationTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:CellItem];
    if (cell==nil) {
        cell=[[DestinationTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellItem];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
    }
    if (indexPath.row==0) {
         cell.Traveldatas=self.guidesArray[@"domestic"];
        cell.diquStr=@"境内";
    }
    if (indexPath.row==1) {
        cell.Traveldatas=self.guidesArray[@"abroad"];
        cell.diquStr=@"境外";
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    return 400;

}

@end
