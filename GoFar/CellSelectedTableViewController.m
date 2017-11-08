//
//  CellSelectedTableViewController.m
//  GoFar
//
//  Created by 胡彭飞 on 16/3/31.
//  Copyright © 2016年 hpf. All rights reserved.
//  https://api.chufaba.me/themes/show/1fbe8e08311.json    _url	/themes/show/1fbe8e08311

#import "CellSelectedTableViewController.h"
#import "jingxuanSelectednodeModel.h"
#import "jingxuanSelectedTableViewCell.h"
#import "jingxuanSelectednodeFrameModel.h"
const CGFloat topViewH=300;
@interface CellSelectedTableViewController ()
@property(nonatomic,weak) UIImageView *topImageView;
@property(nonatomic,strong) NSArray *cellDataArrays;
@end

@implementation CellSelectedTableViewController
-(NSArray *)cellDataArrays
{
    if (_cellDataArrays==nil) {
        _cellDataArrays =[NSArray array];
    }
    return _cellDataArrays;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets=NO;
    [self setupNav];
    [self loadDatas];
    [self setTableHeaderView];
}
-(void)setTableHeaderView
{
    UIImageView *topImageView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"image_loading~iphone.png"]];
    CGFloat topViewH=300;
    topImageView.frame=CGRectMake(0, -topViewH-20, KscreenW, topViewH);
    topImageView.contentMode=UIViewContentModeScaleAspectFill;
    self.tableView.contentInset=UIEdgeInsetsMake(topViewH+20, 0, 0, 0);
    self.topImageView= topImageView;
    [self.tableView insertSubview:topImageView atIndex:0];
//    NSLog(@"%@",NSStringFromUIEdgeInsets(self.scrntInset));
    
}
-(void)loadDatas
{
    AFHTTPRequestOperationManager *manner=[[AFHTTPRequestOperationManager alloc] init];
    
    NSString *urlStr=[NSString stringWithFormat:@"%@%@%@",@"https://api.chufaba.me",self.jingxuanItem.url,@".json"];
    [manner GET:urlStr parameters:@{} success:^(AFHTTPRequestOperation *operation, id responseObject) {
//                NSLog(@"%@",responseObject);
        NSString *TableHeaderViewWenzi=responseObject[@"desc"];
        NSString *TableHeaderViewTitle=responseObject[@"title"];
        NSString *TableHeaderViewHighlights=responseObject[@"highlights"];
         NSArray *nodesArray=responseObject[@"nodes"];
        UIView *contenview=[[UIView alloc] init];
        UILabel *wenziLabel=[[UILabel alloc] init];
        [contenview addSubview:wenziLabel];
        wenziLabel.numberOfLines=0;
        wenziLabel.textColor=HPcolor(136, 136, 136);
        wenziLabel.font=[UIFont systemFontOfSize:16];
        wenziLabel.text=TableHeaderViewWenzi;
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
        paragraphStyle.lineBreakMode=NSLineBreakByWordWrapping;
        CGFloat LabelH=[TableHeaderViewWenzi boundingRectWithSize:CGSizeMake(KscreenW-20, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16],NSForegroundColorAttributeName:HPcolor(136, 136, 136),NSParagraphStyleAttributeName:paragraphStyle.copy} context:nil].size.height;
        wenziLabel.frame=CGRectMake(10, 0, KscreenW-20, LabelH);
        contenview.frame=CGRectMake(0, 0, KscreenW, LabelH+10);
        self.tableView.tableHeaderView=contenview;
        UIView *hengxianView=[[UIView alloc] initWithFrame:CGRectMake(10, LabelH+10, KscreenW-20, 1)];
        hengxianView.alpha=0.5;
        hengxianView.backgroundColor=[UIColor grayColor];
        [contenview addSubview:hengxianView];
        self.topImageView.image=[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:responseObject[@"image"]]]];
//        NSLog(@"%f %f",self.tableView.tableHeaderView.height,LabelH);
        UILabel *titleLabel=[[UILabel alloc] initWithFrame:CGRectMake(0, self.topImageView.height*0.5-15, KscreenW, 30)];
        titleLabel.font=[UIFont systemFontOfSize:25];
        titleLabel.textColor=[UIColor whiteColor];
        titleLabel.textAlignment=NSTextAlignmentCenter;
        titleLabel.text=TableHeaderViewTitle;
        [self.topImageView addSubview:titleLabel];
        UILabel *highLabel=[[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(titleLabel.frame), KscreenW, 20)];
        highLabel.font=[UIFont systemFontOfSize:15];
        highLabel.textColor=[UIColor whiteColor];
        highLabel.textAlignment=NSTextAlignmentCenter;
        highLabel.text=[NSString stringWithFormat:@"── · %@ · ──",TableHeaderViewHighlights];
        [self.topImageView addSubview:highLabel];
        NSArray *objectArrays=[jingxuanSelectednodeModel objectArrayWithKeyValuesArray:nodesArray];
        NSMutableArray *frameModels=[NSMutableArray array];
        for (int i=0; i<objectArrays.count; i++) {
            jingxuanSelectednodeFrameModel *frameModel=[[jingxuanSelectednodeFrameModel alloc] init];
            frameModel.nodemodel=objectArrays[i];
            [frameModels addObject:frameModel];
        }
        self.cellDataArrays=frameModels;
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];

}
-(void)setupNav
{
    self.view.backgroundColor=[UIColor whiteColor];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"nothing~iphone.png"] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    UIView *nearbyContent=[[UIView alloc] init];
    nearbyContent.size=CGSizeMake(20, 20);
    UIButton *leftImageV=[[UIButton alloc] init];
    [leftImageV setBackgroundImage:[UIImage imageNamed:@"back_white~iphone.png"] forState:UIControlStateNormal];
    leftImageV.frame=CGRectMake(0, 0, 20, 20);
    [nearbyContent addSubview:leftImageV];
    [leftImageV addTarget:self action:@selector(nearbyClick) forControlEvents:UIControlEventTouchUpInside];
    //    nearbyImageV.contentMode=UIViewContentModeCenter;
    self.navigationItem.leftBarButtonItem =[[UIBarButtonItem alloc] initWithCustomView:nearbyContent];
    
    UIView *searchContent=[[UIView alloc] init];
    searchContent.size=CGSizeMake(87, 24);
    UIButton *righImageV=[[UIButton alloc] init];
    [righImageV setBackgroundImage:[UIImage imageNamed:@"copy~iphone"] forState:UIControlStateNormal];
    righImageV.frame=CGRectMake(0, 0, 87, 24);
    [searchContent addSubview:righImageV];
    [righImageV addTarget:self action:@selector(searchClick) forControlEvents:UIControlEventTouchUpInside];
    //    searchImageV.contentMode=UIViewContentModeCenter;
    self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc] initWithCustomView:searchContent];
    
}
-(void)nearbyClick
{
    [self.navigationController popViewControllerAnimated:YES];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(self.cellDataArrays.count){
       return self.cellDataArrays.count;
    }
    return 0;
 
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellItem=@"cell";
    jingxuanSelectedTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:CellItem];
    if (cell==nil) {
        cell=[[jingxuanSelectedTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellItem];
    }
    cell.nodeFrameModel=self.cellDataArrays[indexPath.row];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    jingxuanSelectednodeFrameModel *nodeFrameModel=self.cellDataArrays[indexPath.row];
    return nodeFrameModel.cellHight;
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"%f",self.tableView.contentOffset.y);
   
    if (self.tableView.contentOffset.y>-320){
        if (self.tableView.contentOffset.y>0) {
            return;
        }
        if (self.tableView.contentOffset.y<-100) {
            [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"nothing~iphone.png"] forBarMetrics:UIBarMetricsDefault];
            [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
        }
        if (self.tableView.contentOffset.y>-100) {
            CGFloat count=self.tableView.contentOffset.y;
//            self.navigationController.navigationBar.backgroundColor=HPcolor(44, 52, 61);
//            [UINavigationBar appearance].barTintColor=HPcolor(44, 52, 61);
            [self.navigationController.navigationBar setBarTintColor:HPcolor(44, 52, 61)];
            [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
            self.navigationController.navigationBar.alpha=(10-(-91-(count)))/10;
        }
        return;
    }
    self.topImageView.y=self.tableView.contentOffset.y;
    self.topImageView.height=-320-self.tableView.contentOffset.y+topViewH;
 
}
@end
