//
//  HPjingxuanViewController.m
//  GoFar
//
//  Created by 胡彭飞 on 16/3/11.
//  Copyright © 2016年 hpf. All rights reserved.
//
//https://api.chufaba.me/v2/discovery/index.json?offset=0
#import "HPjingxuanViewController.h"
#import "BMAdScrollView.h"
#import "HPjingxuanItem.h"
#import "HPjingxuanTableViewCell.h"
#import "HPSearchNavigationController.h"
#import "HPtextField.h"
#import "CellSelectedTableViewController.h"
@interface HPjingxuanViewController ()<UITextFieldDelegate>
@property(nonatomic,strong) BMAdScrollView *AdScrollView;
@property(nonatomic,strong) NSMutableArray *dataArray;
@property(nonatomic,strong) UITextField *textField;
@property(nonatomic,strong) UIView *searchContentView;
@property(nonatomic,assign) int loadCount;
@end

@implementation HPjingxuanViewController
-(NSArray *)dataArray
{
    if (_dataArray==nil) {
        _dataArray=[NSMutableArray array];
    }
    return _dataArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    if (kSystemVersionMore11) {
        self.tableView.contentInsetAdjustmentBehavior=UIScrollViewContentInsetAdjustmentNever;
    }else{
        self.automaticallyAdjustsScrollViewInsets=NO;
    }
    UIView *searchContentView=[[UIView alloc] initWithFrame:CGRectMake(10, 27, KscreenW-20, 64-20)];
    self.searchContentView=searchContentView;
    HPtextField *textField=[[HPtextField alloc] initWithFrame:CGRectMake(0, 7, KscreenW-20, 64-34)];
    [searchContentView addSubview:textField];
    self.textField=textField;
    textField.backgroundColor=HPcolor(65, 74, 81);
    textField.delegate=self;
    textField.layer.cornerRadius=5;
    textField.clipsToBounds=YES;
    //    textField.placeholder=@"搜索目的地、行程、用户";
    textField.attributedPlaceholder=[[NSAttributedString alloc] initWithString:@"搜索目的地、行程、用户" attributes:@{NSForegroundColorAttributeName:HPcolor(131, 136, 142),NSFontAttributeName:[UIFont systemFontOfSize:15]}];
    //    textField.textColor=HPcolor(131, 136, 142);
    textField.textAlignment=NSTextAlignmentLeft;
    UIImageView *searchImage=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cost_search~iphone"]];
    searchImage.frame=CGRectMake(30, 0, KscreenW*0.25, 14);
    searchImage.contentMode=UIViewContentModeRight;
    textField.leftView=searchImage;
    //    textField.
    textField.leftViewMode=UITextFieldViewModeAlways;
//    HPHomeNaviViewController *navigationVC=(HPHomeNaviViewController *)self.navigationController;
//    [navigationVC.bgImage addSubview:textField];
    
    self.view.backgroundColor=[UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    self.loadCount=0;
    self.tableView.contentInset=UIEdgeInsetsMake(64, 0, 49, 0);
//    self.refreshControl=[[UIRefreshControl alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    [self.tableView addHeaderWithTarget:self action:@selector(newData)];
    [self.tableView addFooterWithTarget:self action:@selector(loadmoreData)];
//    [self loadKeywords];
    [self loadData];
    
}
#pragma mark  -----UITextFieldDelegate-------
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
//    HPHomeNaviViewController *navigationVC=(HPHomeNaviViewController *)self.navigationController;
//    navigationVC.bgImage.hidden=YES;
//    [self.textField removeFromSuperview];
    HPSearchNavigationController *searTableView=[[HPSearchNavigationController alloc] init];
    [self.navigationController pushViewController:searTableView animated:YES];
    return NO;
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
     self.navigationController.navigationBar.barTintColor=HPcolor(44, 52, 61);
     [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    self.navigationItem.leftBarButtonItem=nil;
    self.navigationItem.rightBarButtonItem=nil;
    self.navigationItem.titleView=self.searchContentView;
   
}
#pragma mark 下拉刷新
-(void)newData
{
    [self loadData];
    [self.tableView headerEndRefreshing];
}
-(void)loadData
{
    AFHTTPRequestOperationManager *manner=[[AFHTTPRequestOperationManager alloc] init];
    [manner GET:@"https://api.chufaba.me/v2/discovery/index.json" parameters:@{@"offset":@(0)} success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //        NSLog(@"%@",responseObject);
        [self.dataArray removeAllObjects];
        NSArray *adArray=responseObject[@"banners"];
        NSArray *dataItems=responseObject[@"items"];
        self.dataArray=(NSMutableArray *)[HPjingxuanItem objectArrayWithKeyValuesArray:dataItems];
        NSMutableArray *namearr=[NSMutableArray array];
        for (int i=0; i<adArray.count; i++) {
            NSString *image1=adArray[i][@"image1"];
            NSString *image2=adArray[i][@"image"];
            if (image1) {
                [namearr addObject:image1];
            }
            if (image2) {
                [namearr addObject:image2];
            }
        }
        BMAdScrollView *AdScrollView;
        if(iPhone5){
            AdScrollView=[[BMAdScrollView alloc]  initWithNameArr:namearr titleArr:namearr height:KscreenH*0.3 offsetY:64 offsetx:0];
        }else {
            
            AdScrollView=[[BMAdScrollView alloc]  initWithNameArr:namearr titleArr:namearr height:KscreenH*0.3 offsetY:64 offsetx:0];
        }
        
        //        AdScrollView.backgroundColor=[UIColor redColor];
        AdScrollView.autoresizingMask=UIViewAutoresizingNone;
        self.AdScrollView=AdScrollView;
        //        [self.view addSubview:AdScrollView];
        self.tableView.tableHeaderView=AdScrollView;
        
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
    
}
#pragma mark 上拉加载更多
-(void)loadmoreData
{
    self.loadCount+=10;
    [self loadmoreDataByAFN];
    [self.tableView footerEndRefreshing];
}
-(void)loadmoreDataByAFN
{
    AFHTTPRequestOperationManager *manner=[[AFHTTPRequestOperationManager alloc] init];
    [manner GET:@"https://api.chufaba.me/v2/discovery/index.json" parameters:@{@"offset":@(self.loadCount)} success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //        NSLog(@"%@",responseObject);
        NSArray *dataItems=responseObject[@"items"];
        NSArray *newData=[NSArray array];
        newData=(NSMutableArray *)[HPjingxuanItem objectArrayWithKeyValuesArray:dataItems];
        [self.dataArray addObjectsFromArray:newData];
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
    
}

#pragma mark --------tableView----------

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellItem=@"cell";
    HPjingxuanTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:CellItem];
    if (cell==nil) {
        cell=[[HPjingxuanTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellItem];
    }
    cell.item=self.dataArray[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    HPjingxuanItem *jingxuanItem=self.dataArray[indexPath.row];
    CellSelectedTableViewController *cellSelectTableView=[[CellSelectedTableViewController alloc] init];
    cellSelectTableView.jingxuanItem=jingxuanItem;
    [self.navigationController pushViewController:cellSelectTableView animated:YES];
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return KscreenH*0.32;
}
@end
