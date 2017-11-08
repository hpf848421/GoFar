//
//  HPSearchNavigationController.m
//  GoFar
//
//  Created by 胡彭飞 on 16/3/11.
//  Copyright © 2016年 hpf. All rights reserved.
//

#import "HPSearchNavigationController.h"
#import "HPsearBar.h"
#import "searchTableHeaderView.h"
@interface HPSearchNavigationController ()<UITextFieldDelegate,searchTableHeaderViewDelegate>
@property(nonatomic,strong) NSArray *keyWordsArray;
@property(nonatomic,strong) UIView *searchContentView;
@property(nonatomic,strong) HPsearBar *textField;
@property(nonatomic,strong) UIImageView *searchImage;
@property(nonatomic,strong) UIButton *cancel;
@end

@implementation HPSearchNavigationController
-(NSArray *)keyWordsArray
{
    if (_keyWordsArray==nil) {
        _keyWordsArray=[NSArray array];
    }
    return _keyWordsArray;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNav];
    [self loadKeywords];
}
-(void)setupNav
{
    //    UIView *bgImage=[[UIView alloc] initWithFrame:CGRectMake(0, -20, KscreenW, 64)];
    //    bgImage.backgroundColor=HPcolor(44, 52, 61);
    //    [self.view addSubview:bgImage];
    self.navigationItem.hidesBackButton=YES;
    UIButton *backBtn=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    [backBtn addTarget:self action:@selector(backVc) forControlEvents:UIControlEventTouchUpInside];
    [backBtn setImage:[UIImage imageNamed:@"back_white~iphone"] forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc] initWithCustomView:backBtn];
    
    UIView *searchContentView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, KscreenW, 64-20)];
    self.searchContentView=searchContentView;
    HPsearBar *textField=[[HPsearBar alloc] initWithFrame:CGRectMake(0, 7, KscreenW-130, 64-34)];
    self.textField=textField;
    [searchContentView addSubview:textField];
    textField.backgroundColor=HPcolor(65, 74, 81);
    textField.delegate=self;
    textField.layer.cornerRadius=5;
    textField.clipsToBounds=YES;
    [textField becomeFirstResponder];
    //    textField.placeholder=@"搜索目的地、行程、用户";
    textField.attributedPlaceholder=[[NSAttributedString alloc] initWithString:@"搜索目的地、行程、用户" attributes:@{NSForegroundColorAttributeName:HPcolor(131, 136, 142),NSFontAttributeName:[UIFont systemFontOfSize:15]}];
    //    textField.textColor=HPcolor(131, 136, 142);
    textField.textAlignment=NSTextAlignmentLeft;
    UIImageView *searchImage=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cost_search~iphone"]];
    searchImage.frame=CGRectMake(0, 0, 14, 14);
    self.searchImage=searchImage;
    searchImage.contentMode=UIViewContentModeRight;
    textField.leftView=searchImage;
    //    textField.
    textField.leftViewMode=UITextFieldViewModeAlways;
    //    [navigationVC.bgImage addSubview:textField];
    self.navigationItem.titleView=searchContentView;
    
    UIButton *cancel=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 30)];
    self.cancel=cancel;
    [cancel addTarget:self action:@selector(reloadsearchTool) forControlEvents:UIControlEventTouchUpInside];
    [cancel setTitle:@"取消" forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithCustomView:cancel];

}
-(void)reloadsearchTool
{
    
    [UIView animateWithDuration:0.1 animations:^{
        self.searchImage.width=40;
        self.searchContentView.width=KscreenW-60;
        self.textField.width=KscreenW-100;
        self.navigationItem.rightBarButtonItem=nil;
    }];
  [self.textField resignFirstResponder];
}
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [UIView animateWithDuration:0.1 animations:^{
        self.searchImage.width=14;
        self.searchContentView.width=KscreenW-60;
        self.textField.width=KscreenW-130;
      
    }];
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithCustomView:self.cancel];
}
-(void)loadKeywords
{
    AFHTTPRequestOperationManager *manner=[[AFHTTPRequestOperationManager alloc] init];
    [manner GET:@"https://api.chufaba.me/v2/discovery/keywords" parameters:@{} success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //        NSLog(@"%@",responseObject);
        self.keyWordsArray=responseObject[@"keywords"];
        searchTableHeaderView *searchView=[[searchTableHeaderView alloc] initWithFrame:CGRectMake(0, 0, KscreenW, 230)];
        searchView.delegate=self;
        searchView.searchData=self.keyWordsArray;
        self.tableView.tableHeaderView=searchView;

        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
    
}
-(void)backVc
{
    HPHomeNaviViewController *navigationVC=(HPHomeNaviViewController *)self.navigationController;
    for (UIView *view in navigationVC.bgImage.subviews) {
        [view removeFromSuperview];
    }
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark --------searchTableHeaderView----------
/**
 *  按钮点击响应事件
 *
 *  @param headerView headerView
 *  @param tag        第几个按钮
 */
-(void)searchTableHeaderView:(searchTableHeaderView *)headerView clickBtnTag:(NSInteger)tag
{
    

}
#pragma mark --------tableView----------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    static NSString *CellItem=@"cell";
//    HPjingxuanTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:CellItem];
//    if (cell==nil) {
//        cell=[[HPjingxuanTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellItem];
//    }
//    cell.item=self.dataArray[indexPath.row];
    return nil;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return KscreenH*0.32;
}

@end
