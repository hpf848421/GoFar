//
//  MakeTravelViewController.m
//  GoFar
//
//  Created by 胡彭飞 on 16/3/16.
//  Copyright © 2016年 hpf. All rights reserved.
//https://api.chufaba.me/destination_lists/all.json
#import "guoneiModel.h"
#import "guowaiModel.h"
#import "guowaizhouModel.h"
#import "guowaicountryModel.h"
#import "placeModel.h"
#import "guoneiALLmodel.h"
#import "guoneiCountryModel.h"
#import "MakeTravelViewController.h"
#import "makeTravelSearchBar.h"
@interface MakeTravelViewController ()<UISearchBarDelegate,UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,weak) UIView *backView;
@property(nonatomic,weak) UISearchBar *search;
@property(nonatomic,weak) UIButton *cancelBtn;
@property(nonatomic,weak) UIView *secondbackView;
@property(nonatomic,weak) UIView *bottomView;
@property(nonatomic,strong) NSArray *dataArray;

@property(nonatomic,strong) UITableView *guowaiTableView;
@property(nonatomic,strong) UITableView *guoneiTableView;
/**
 *  国外数据
 */
@property(nonatomic,strong)NSArray *guowaimodelArrays;
/**
 *  国内数据
 */
@property(nonatomic,strong) NSArray *guoneimodelArrays;


@property(nonatomic,weak) UIScrollView *tableViewContentscrollView;
@end

@implementation MakeTravelViewController
-(NSArray *)dataArray
{
    if (_dataArray==nil) {
        _dataArray=[NSMutableArray array];
    }
    return _dataArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    [self setupNavi];
    [self setupTopsearchView];
    [self addTableView];
    [self addbottomView];
    [self loadData];
}
-(void)loadData
{
    AFHTTPRequestOperationManager *manner=[[AFHTTPRequestOperationManager alloc] init];
    [manner GET:@"https://api.chufaba.me/destination_lists/all.json" parameters:@{} success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray *Guowaiitems=responseObject[0][@"items"];
        NSArray *guowaimodelArrays=[guowaiModel objectArrayWithKeyValuesArray:Guowaiitems];
        self.guowaimodelArrays=guowaimodelArrays;
        
        NSArray *Guoneiitems=responseObject[1][@"items"];
        NSArray *guoneimodelArrays=[guoneiModel objectArrayWithKeyValuesArray:Guoneiitems];
        self.guoneimodelArrays=guoneimodelArrays;
        
        [self.guowaiTableView reloadData];
        [self.guoneiTableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
    
}
-(void)addbottomView
{
    UIView *bottomSelectView=[[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.tableViewContentscrollView.frame), KscreenW, 44)];
    bottomSelectView.backgroundColor=HPcolor(45, 203, 154);
    [self.view addSubview:bottomSelectView];
    UILabel *oneSelectDestinaLabel=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, KscreenW, CGRectGetHeight(bottomSelectView.frame))];
    oneSelectDestinaLabel.text=@"1.选择目的地(可多选)";
    oneSelectDestinaLabel.textColor=[UIColor whiteColor];
    oneSelectDestinaLabel.font=[UIFont systemFontOfSize:18];
    oneSelectDestinaLabel.textAlignment=NSTextAlignmentCenter;
    [bottomSelectView addSubview:oneSelectDestinaLabel];
}
-(void)addTableView
{
    UIScrollView *tableViewContentscrollView=[[UIScrollView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.secondbackView.frame), KscreenW, KscreenH-CGRectGetMaxY(self.secondbackView.frame)-44)];
    self.tableViewContentscrollView=tableViewContentscrollView;
//    tableViewContentscrollView.backgroundColor=[UIColor redColor];
    tableViewContentscrollView.contentSize=CGSizeMake(2*KscreenW, KscreenH-CGRectGetMaxY(self.secondbackView.frame)-44);
    tableViewContentscrollView.pagingEnabled=YES;
    tableViewContentscrollView.delegate=self;
    tableViewContentscrollView.showsHorizontalScrollIndicator=NO;
    tableViewContentscrollView.bounces=NO;
    [self.view addSubview:tableViewContentscrollView];
    
    UITableView *guowaiTableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, KscreenW, KscreenH-CGRectGetMaxY(self.secondbackView.frame)-44) style:UITableViewStylePlain];
    self.guowaiTableView=guowaiTableView;
    guowaiTableView.delegate=self;
    guowaiTableView.dataSource=self;
    [tableViewContentscrollView addSubview:guowaiTableView];

    UITableView *guoneiTableView=[[UITableView alloc] initWithFrame:CGRectMake(KscreenW, 0, KscreenW, KscreenH-CGRectGetMaxY(self.secondbackView.frame)-44) style:UITableViewStylePlain];
    self.guoneiTableView=guoneiTableView;
    guoneiTableView.delegate=self;
    guoneiTableView.dataSource=self;
    [tableViewContentscrollView addSubview:guoneiTableView];
}
-(void)setupTopsearchView
{
    UIView *backview=[[UIView alloc] initWithFrame:CGRectMake(0, 64, KscreenW, 44)];
    backview.backgroundColor=HPcolor(204, 204, 204);
    [self.view addSubview:backview];
    makeTravelSearchBar *search=[[makeTravelSearchBar alloc] initWithFrame:CGRectMake(0, 0, KscreenW, 44)];
    search.tintColor=[UIColor whiteColor];
    self.search=search;
    search.delegate=self;
    search.placeholder=@"国家或城市";
    [backview addSubview:search];
    self.backView=backview;
    
    UIView *secondbackView=[[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.backView.frame), KscreenW, 54)];
    self.secondbackView=secondbackView;
    [self.view addSubview:secondbackView];
    UIButton *guowaiBtn=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, KscreenW*0.5, CGRectGetHeight(secondbackView.frame))];
    guowaiBtn.tag=0;
    [guowaiBtn setTitle:@"国外" forState:UIControlStateNormal];
    [guowaiBtn addTarget:self action:@selector(countryClick:) forControlEvents:UIControlEventTouchUpInside];
    [guowaiBtn setTitleColor:HPcolor(121, 121, 121) forState:UIControlStateNormal];
    guowaiBtn.titleLabel.font=[UIFont systemFontOfSize:18];
    [secondbackView addSubview:guowaiBtn];
    UIView *bottomView=[[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(secondbackView.frame)-5, KscreenW*0.5, 5)];
    self.bottomView=bottomView;
    bottomView.backgroundColor=HPcolor(45, 203, 154);
    [secondbackView addSubview:bottomView];
    
    UIButton *guoneiBtn=[[UIButton alloc] initWithFrame:CGRectMake(KscreenW*0.5, 0, KscreenW*0.5, CGRectGetHeight(secondbackView.frame))];
    [guoneiBtn setTitle:@"国内" forState:UIControlStateNormal];
    guoneiBtn.tag=1;
    [guoneiBtn addTarget:self action:@selector(countryClick:) forControlEvents:UIControlEventTouchUpInside];
    [guoneiBtn setTitleColor:HPcolor(121, 121, 121) forState:UIControlStateNormal];
    guoneiBtn.titleLabel.font=[UIFont systemFontOfSize:18];
    [secondbackView addSubview:guoneiBtn];
    
}
-(void)countryClick:(UIButton *)btn  //0 国外 1 国内
{
    if (btn.tag==0) {
        [UIView animateWithDuration:0.1 animations:^{
               self.bottomView.x=0;
            CGPoint point=self.tableViewContentscrollView.contentOffset;
            point.x=0;
            self.tableViewContentscrollView.contentOffset=point;
        }];
     
    }else
    {
        [UIView animateWithDuration:0.1 animations:^{
            self.bottomView.x=KscreenW*0.5;
            CGPoint point=self.tableViewContentscrollView.contentOffset;
            point.x=KscreenW;
            self.tableViewContentscrollView.contentOffset=point;
        }];
        
    }

}
-(BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    [UIView animateWithDuration:0.1 animations:^{
        self.navigationController.navigationBar.y=-64;
        self.backView.y=0;
        self.search.width=KscreenW-40;
        self.backView.height=64;
        self.search.y=20;
        self.secondbackView.y-=44;
        UIButton *cancelBtn=[[UIButton alloc] initWithFrame:CGRectMake(KscreenW-40, 20, 30, 44)];
        self.cancelBtn=cancelBtn;
        [cancelBtn addTarget:self action:@selector(cancelClick) forControlEvents:UIControlEventTouchUpInside];
        [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        cancelBtn.titleLabel.font=[UIFont systemFontOfSize:15];
        [cancelBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.backView addSubview:cancelBtn];
    }];
    
    self.navigationController.navigationBar.hidden=YES;
//    [self.view setNeedsDisplay];
    return YES;
}
-(void)cancelClick
{
    self.navigationController.navigationBar.hidden=NO;
    [UIView animateWithDuration:0.1 animations:^{
        self.navigationController.navigationBar.y=20;
        [self.cancelBtn removeFromSuperview];
        self.search.width=KscreenW;
        self.backView.y=64;
        self.backView.height=44;
        self.search.y=0;
        self.secondbackView.y+=44;
     
    }];
    [self.search resignFirstResponder];
    
}
-(void)setupNavi
{
    self.automaticallyAdjustsScrollViewInsets=NO;
    UIButton *XXbtn=[[UIButton alloc] init];
    XXbtn.size=CGSizeMake(44, 44);
    [XXbtn setImage:[UIImage imageNamed:@"cancel_x~iphone"] forState:UIControlStateNormal];
    [XXbtn addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc] initWithCustomView:XXbtn];
    UILabel *titleLab=[[UILabel alloc] init];
    titleLab.size=CGSizeMake(100, 44);
    titleLab.text=@"做行程";
    titleLab.font=[UIFont systemFontOfSize:22];
    titleLab.textAlignment=NSTextAlignmentCenter;
    titleLab.textColor=[UIColor whiteColor];
//    titleLab.backgroundColor=[UIColor redColor];
    self.navigationItem.titleView=titleLab;
}
-(void)backClick
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark tableview
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    if (tableView==self.guowaiTableView) {
        if (self.guowaimodelArrays.count) {
            return (self.guowaimodelArrays.count-1);
        }
    }else if(tableView ==self.guoneiTableView)
    {
     return 1;
    }
     return 0;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *tableviewHeader=[[UIView alloc] initWithFrame:CGRectMake(0, 0, KscreenW, 30)];
    tableviewHeader.backgroundColor=HPcolor(250, 250, 250);
    UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(10, 0, 100, 30)];
    if (tableView==self.guowaiTableView) {
        if (self.guowaimodelArrays.count) {
            guoneiModel *guoneimodel=self.guowaimodelArrays[section+1];
            label.text= [guoneimodel.name stringByAppendingString:@" a-z"];
            label.textColor=HPcolor(177, 177, 177);
            label.font=[UIFont systemFontOfSize:13];
        }
      
    }else if(tableView ==self.guoneiTableView)
    {
        return nil;
    }
    [tableviewHeader addSubview:label];
    return tableviewHeader;
   
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView==self.guowaiTableView) {
        if (self.guowaimodelArrays.count) {
         guowaiModel *guowaimodel=self.guowaimodelArrays[section+1];
           NSArray *zhoumodel=guowaimodel.items;
            return zhoumodel.count;
        }
    }else if(tableView ==self.guoneiTableView)
    {
        if (self.guoneimodelArrays.count) {
            guoneiModel *guoneimodel=self.guoneimodelArrays[1];
            return guoneimodel.items.count;
        }
        
     
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView==self.guowaiTableView) {
        static NSString *CellItem=@"guowai";
        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:CellItem];
        if (cell==nil) {
            cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellItem];
        }
        if (self.guowaimodelArrays.count) {
           guowaiModel *guowaimodel=self.guowaimodelArrays[indexPath.section+1];
         guowaizhouModel *gezhouData=guowaimodel.items[indexPath.row];
        cell.textLabel.text=gezhouData.name;
        cell.accessoryView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"destination_expand~iphone"]];
        return cell;
        }
    }else if(tableView ==self.guoneiTableView){
        if (self.guoneimodelArrays.count) {
            guoneiModel *guoneimodel=self.guoneimodelArrays[1];
            static NSString *CellItem=@"guonei";
            UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:CellItem];
            if (cell==nil) {
                cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellItem];
            }
            guoneiALLmodel *allmodel=guoneimodel.items[indexPath.row];
            cell.textLabel.text=allmodel.name;
            return cell;
        }

    }
    return nil;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *SelectedtabbleViewCell=[tableView cellForRowAtIndexPath:indexPath];
    if ([SelectedtabbleViewCell.reuseIdentifier isEqualToString:@"guowai"]) {  //国内 第一级Cell
//        NSArray  *zhouDatas=self.totalguowaiDatas[indexPath.section];
//        NSDictionary *zhouDic=zhouDatas[indexPath.row];
//        NSArray *smallDatas=zhouDic[@"items"];
    }else if ([SelectedtabbleViewCell.reuseIdentifier isEqualToString:@"guonei"])
    {
    
    
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (tableView==self.guowaiTableView) {
         return 30;
    }else
    {
        return 0;
    }
   
}
#pragma mark scrollview
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
//NSLog(@"%@",NSStringFromCGPoint(self.tableViewContentscrollView.contentOffset));
    if (self.tableViewContentscrollView.contentOffset.x==KscreenW) {
        self.bottomView.x=KscreenW*0.5;
    }else
    {
        self.bottomView.x=0;
    }
}
@end
