//
//  DongtaiTableViewController.m
//  GoFar
//
//  Created by 胡彭飞 on 16/3/17.
//  Copyright © 2016年 hpf. All rights reserved.
//https://api.chufaba.me/v2/discovery/feed.json?
//https://api.chufaba.me/v2/discovery/feed.json?before=1459062000000  上拉加载更多
//https://api.chufaba.me/v2/users/feed.json?auth_token=uqZmp4ZupiMdKPUphayr
//http://chufaba.me/users/auth/qq_connect/callback?code=C799CC45987C30AEEE699D16AE0D7966&state=5a944710283d7cde6aa7914ab614898212f539cd12969245
//<html><body>You are being <a href="chufaba://qq_logon?auth_token=uqZmp4ZupiMdKPUphayr&amp;avatar=http%3A%2F%2Fqzapp.qlogo.cn%2Fqzapp%2F100379396%2FD56C6E4C7DC1757A4F213129DCD2AFBB%2F100&amp;id=272859&amp;intro=&amp;name=May%C2%A8&amp;phone=&amp;qq_uid=D56C6E4C7DC1757A4F213129DCD2AFBB&amp;vip=false&amp;vip_intro=">redirected</a>.</body></html>
#define tabbleViewHeaderH 250
#import "DongtaiTableViewController.h"
#import "EGOImgeView/EGOImageView.h"
#import "remenModel.h"
#import "remenFramModel.h"
#import "dongtaiRemenTableViewCell.h"
#import "LoginViewController.h"
#import "sdk/sdkCall.h"
#define SelecFont [UIFont systemFontOfSize:19]
#define NormalFont [UIFont systemFontOfSize:17]
@interface DongtaiTableViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,weak) UIButton *titleLab1;
@property(nonatomic,weak) UIButton *titleLab2;
@property(nonatomic,weak) UIView *lvsexianView;
@property(nonatomic,weak) UIScrollView *scrollView;
@property(nonatomic,weak) UITableView *tableView1;
@property(nonatomic,weak) UITableView *tableView2;
@property(nonatomic,weak) UIView *guanzhuView;
/**
 *  数据
 */
@property(nonatomic,strong) NSArray *Topicsdatas;
@property(nonatomic,strong) NSMutableArray *remenFrameArrays;
@end

@implementation DongtaiTableViewController
-(NSArray *)Topicsdatas
{
    if (_Topicsdatas==nil) {
        _Topicsdatas=[NSArray array];
    }
    return _Topicsdatas;
}
-(NSArray *)remenFrameArrays
{
    if (_remenFrameArrays==nil) {
        _remenFrameArrays=[NSArray array];
    }
    return _remenFrameArrays;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loginSuccess) name:kLoginSuccessed object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(GetUserInfoResponse:) name:kGetUserInfoResponse object:nil];
    self.automaticallyAdjustsScrollViewInsets=NO;
    [self setupNavi];
    [self setupScrollViewAndTableView];
    [self loadDatas];
}
-(void)loadDatas
{
    
    AFHTTPRequestOperationManager *manner=[[AFHTTPRequestOperationManager alloc] init];
    [manner GET:@"https://api.chufaba.me/v2/discovery/feed.json?" parameters:@{} success:^(AFHTTPRequestOperation *operation, id responseObject) {
//                   NSLog(@"%@",responseObject);
        NSArray *Topicsdatas=responseObject[@"topics"];
        self.Topicsdatas=Topicsdatas;
        NSArray *listDatas=responseObject[@"data"];
        NSArray *remenmodels=[remenModel objectArrayWithKeyValuesArray:listDatas];
        NSMutableArray *remenFrameArray=[NSMutableArray array];
        for (remenModel *remenmodel in remenmodels) {
            remenFramModel *remenFramemodel=[[remenFramModel alloc] init];
            remenFramemodel.remenModels=remenmodel;
            [remenFrameArray addObject:remenFramemodel];
        }
        self.remenFrameArrays=remenFrameArray;
        [self.tableView1 reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
    
}
-(void)setupScrollViewAndTableView
{
    UIScrollView *scrollView=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, KscreenW, KscreenH-64)];
    self.scrollView=scrollView;
    scrollView.contentSize=CGSizeMake(KscreenW*2, 0);
    scrollView.delegate=self;
    scrollView.pagingEnabled=YES;
    scrollView.bounces=NO;
    scrollView.showsHorizontalScrollIndicator=NO;
    scrollView.showsVerticalScrollIndicator=NO;
//    scrollView.backgroundColor=[UIColor redColor];
    [self.view addSubview:scrollView];
    UITableView *tableView1=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, KscreenW, KscreenH-64) style:UITableViewStyleGrouped];
    self.tableView1=tableView1;
    tableView1.separatorStyle=UITableViewCellSeparatorStyleNone;
    tableView1.backgroundColor=HPcolor(228, 228, 228);
    tableView1.delegate=self;
    tableView1.dataSource=self;
    [tableView1 addFooterWithTarget:self action:@selector(loadMoreDatas)];
    [tableView1 addHeaderWithTarget:self action:@selector(loadNewDatas)];
    [scrollView addSubview:tableView1];
    UITableView *tableView2=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, KscreenW, KscreenH-64)];
    self.tableView2=tableView2;
    tableView2.x=KscreenW;
    tableView2.delegate=self;
    tableView2.dataSource=self;
    [scrollView addSubview:tableView2];
    UIView *guanzhuView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, KscreenW, KscreenH-64)];
    self.guanzhuView=guanzhuView;
    guanzhuView.x=KscreenW;
    [scrollView addSubview:guanzhuView];
    UIButton *dengluBtn=[[UIButton alloc] initWithFrame:CGRectMake(0,CGRectGetHeight(guanzhuView.frame)*0.5-15, KscreenW, 30)];
    [dengluBtn setTitle:@"点击登录查看好友动态" forState:UIControlStateNormal];
    [dengluBtn addTarget:self action:@selector(dengluBtnClick) forControlEvents:UIControlEventTouchUpInside];
    dengluBtn.titleLabel.font=[UIFont systemFontOfSize:15];
    [dengluBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [guanzhuView addSubview:dengluBtn];

 
    
    
}
-(void)setupNavi
{
    UIView *nearbyContent=[[UIView alloc] init];
    nearbyContent.size=CGSizeMake(20, 20);
    UIButton *nearbyImageV=[[UIButton alloc] init];
    [nearbyImageV setBackgroundImage:[UIImage imageNamed:@"user_add~iphone"] forState:UIControlStateNormal];
    nearbyImageV.frame=CGRectMake(0, 0, 20, 20);
    [nearbyContent addSubview:nearbyImageV];
    [nearbyImageV addTarget:self action:@selector(nearbyClick) forControlEvents:UIControlEventTouchUpInside];
    //    nearbyImageV.contentMode=UIViewContentModeCenter;
    self.navigationItem.leftBarButtonItem =[[UIBarButtonItem alloc] initWithCustomView:nearbyContent];
    UIView *titleContentView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 44)];
    UIButton *titleLab1=[[UIButton alloc] init];
    [titleLab1 addTarget:self action:@selector(titleSelected:) forControlEvents:UIControlEventTouchUpInside];
    self.titleLab1=titleLab1;
    titleLab1.tag=1;
    titleLab1.frame=CGRectMake(0, 0, 100, 44);
    [titleLab1 setTitle:@"热门" forState:UIControlStateNormal];
    titleLab1.titleLabel.font=SelecFont;
//    titleLab1.textAlignment=NSTextAlignmentCenter;
    [titleLab1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.navigationItem.titleView=titleLab1;
    UIButton *titleLab2=[[UIButton alloc] init];
    titleLab2.tag=2;
    [titleLab2 addTarget:self action:@selector(titleSelected:) forControlEvents:UIControlEventTouchUpInside];
    self.titleLab2=titleLab2;
    titleLab2.frame=CGRectMake(100, 0, 100, 44);
    [titleLab2 setTitle:@"关注" forState:UIControlStateNormal];
    titleLab2.titleLabel.font=NormalFont;
//    titleLab2.textAlignment=NSTextAlignmentCenter;
    [titleLab2 setTitleColor:HPcolor(145, 153, 160) forState:UIControlStateNormal];
    [titleContentView addSubview:titleLab1];
    [titleContentView addSubview:titleLab2];
    self.navigationItem.titleView=titleContentView;
    
    UIView *searchContent=[[UIView alloc] init];
    searchContent.size=CGSizeMake(56, 20);
    UIButton *searchImageV=[[UIButton alloc] init];
    [searchImageV setBackgroundImage:[UIImage imageNamed:@"impression_add~iphone"] forState:UIControlStateNormal];
    searchImageV.frame=CGRectMake(0, 0, 56, 20);
    [searchContent addSubview:searchImageV];
    [searchImageV addTarget:self action:@selector(searchClick) forControlEvents:UIControlEventTouchUpInside];
    //    searchImageV.contentMode=UIViewContentModeCenter;
    self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc] initWithCustomView:searchContent];
    
    UIView *lvsexianView=[[UIView alloc] initWithFrame:CGRectMake(0, 44-7, 100, 5)];
    self.lvsexianView=lvsexianView;
    lvsexianView.backgroundColor=HPcolor(44, 204, 154);
    [titleContentView addSubview:lvsexianView];
}
#pragma mark 各种点击事件==================================
-(void)titleSelected:(UIButton *)btn
{
    switch (btn.tag) {
        case 1:
        {
            self.titleLab1.titleLabel.font=SelecFont;
             [self.titleLab1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            self.titleLab2.titleLabel.font=NormalFont;
            [self.titleLab2 setTitleColor:HPcolor(145, 153, 160) forState:UIControlStateNormal];
            [UIView animateWithDuration:0.3 animations:^{
                self.lvsexianView.x=0;
                [self.scrollView setContentOffset:CGPointZero];
            }];
            break;
        }
        case 2:
        {
            self.titleLab2.titleLabel.font=SelecFont;
            [self.titleLab2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            self.titleLab1.titleLabel.font=NormalFont;
            [self.titleLab1 setTitleColor:HPcolor(145, 153, 160) forState:UIControlStateNormal];
            [UIView animateWithDuration:0.3 animations:^{
                self.lvsexianView.x=100;
                [self.scrollView setContentOffset:CGPointMake(KscreenW, 0)];
            }];
        
            break;
        }
    }

}
-(void)searchClick
{

}
-(void)nearbyClick
{

}
-(void)dengluBtnClick
{
    LoginViewController *loginVC=[[LoginViewController alloc] init];
    [self presentViewController:loginVC animated:YES completion:nil];

}
#pragma mark tabbleview==================================
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *contenView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, KscreenW, tabbleViewHeaderH)];
    contenView.backgroundColor=[UIColor whiteColor];
    if (self.Topicsdatas.count) {
        NSDictionary *firstDatas=self.Topicsdatas[0];
        NSDictionary *secondDatas=self.Topicsdatas[1];
         NSDictionary *thirdDatas=self.Topicsdatas[2];
    
        EGOImageView *firstImage=[[EGOImageView alloc] initWithFrame:CGRectMake(10, 10, KscreenW-20, (tabbleViewHeaderH-30)*0.65)];
        [contenView addSubview:firstImage];
        firstImage.contentMode=UIViewContentModeScaleAspectFill;
        firstImage.layer.cornerRadius=5;
        firstImage.clipsToBounds=YES;
        if (firstDatas) {
            firstImage.imageURL=[NSURL URLWithString:firstDatas[@"image"]];
        }
        UILabel *firstTitle=[[UILabel alloc] initWithFrame:CGRectMake(0, firstImage.height*0.5-20, firstImage.width, 30)];
        firstTitle.textColor=[UIColor whiteColor];
         firstTitle.lineBreakMode=NSLineBreakByTruncatingMiddle;
        firstTitle.textAlignment=NSTextAlignmentCenter;
        firstTitle.font=[UIFont systemFontOfSize:28];
        [firstImage addSubview:firstTitle];
        UIButton *firstBtn=[[UIButton alloc] initWithFrame:firstImage.bounds];
        [firstImage addSubview:firstBtn];
        if (firstDatas) {
            firstTitle.text=[NSString stringWithFormat:@"#%@#",firstDatas[@"name"]];
        }
        
        UIImageView *canyuhuati=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"canyu~iphone"]];
        canyuhuati.center=CGPointMake(firstImage.width*0.5, firstImage.height*0.5+30);
        [firstImage addSubview:canyuhuati];
        
        
        EGOImageView *secondImage=[[EGOImageView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(firstImage.frame)+10, (KscreenW-30)*0.5, (tabbleViewHeaderH-30)*0.3)];
        [contenView addSubview:secondImage];
        secondImage.contentMode=UIViewContentModeScaleAspectFill;
        secondImage.layer.cornerRadius=5;
        secondImage.clipsToBounds=YES;
        if (secondDatas) {
            secondImage.imageURL=[NSURL URLWithString:secondDatas[@"image"]];
        }
        [contenView addSubview:secondImage];
        UIButton *secondBtn=[[UIButton alloc] initWithFrame:secondImage.bounds];
        [secondImage addSubview:secondBtn];
        UILabel *secondTitle=[[UILabel alloc] initWithFrame:secondImage.bounds];
        secondTitle.lineBreakMode=NSLineBreakByTruncatingMiddle;
        secondTitle.textColor=[UIColor whiteColor];
        secondTitle.textAlignment=NSTextAlignmentCenter;
        secondTitle.font=[UIFont systemFontOfSize:22];
        if (secondDatas) {
            secondTitle.text=[NSString stringWithFormat:@"#%@#",secondDatas[@"name"]];
        }
        [secondImage addSubview:secondTitle];
        
        
        EGOImageView *thirdImage=[[EGOImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(secondImage.frame)+10, CGRectGetMaxY(firstImage.frame)+10, (KscreenW-30)*0.5, (tabbleViewHeaderH-30)*0.3)];
        [contenView addSubview:thirdImage];
        thirdImage.contentMode=UIViewContentModeScaleAspectFill;
        thirdImage.layer.cornerRadius=5;
        thirdImage.clipsToBounds=YES;
        if (thirdDatas) {
            thirdImage.imageURL=[NSURL URLWithString:thirdDatas[@"image"]];
        }
        [contenView addSubview:thirdImage];
        UIButton *thirdBtn=[[UIButton alloc] initWithFrame:thirdImage.bounds];
        [thirdImage addSubview:thirdBtn];
        UILabel *thirdTitle=[[UILabel alloc] initWithFrame:secondImage.bounds];
        thirdTitle.lineBreakMode=NSLineBreakByTruncatingMiddle;
        thirdTitle.textColor=[UIColor whiteColor];
        thirdTitle.textAlignment=NSTextAlignmentCenter;
        thirdTitle.font=[UIFont systemFontOfSize:22];
        if (thirdDatas) {
            thirdTitle.text=[NSString stringWithFormat:@"#%@#",thirdDatas[@"name"]];
        }
        [thirdImage addSubview:thirdTitle];
        
        
    }
   

    return contenView;

}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{

    return tabbleViewHeaderH;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.remenFrameArrays.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellItem=@"listDatas";
    dongtaiRemenTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:CellItem];
    if (cell==nil) {
        cell=[[dongtaiRemenTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellItem];
    }
    cell.remenframeModel=self.remenFrameArrays[indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    remenFramModel *remenFmodel=self.remenFrameArrays[indexPath.row];
    return remenFmodel.cellH;
}
-(void)loadMoreDatas
{
    AFHTTPRequestOperationManager *manner=[[AFHTTPRequestOperationManager alloc] init];
    remenFramModel *remenFramLastmodel=[self.remenFrameArrays lastObject];
    remenModel *remenlastmodel=remenFramLastmodel.remenModels;
    NSString *urlstr=[NSString stringWithFormat:@"%@%@",@"https://api.chufaba.me/v2/discovery/feed.json?before=",remenlastmodel.time];
    [manner GET:urlstr parameters:@{} success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //                   NSLog(@"%@",responseObject);
        [self.tableView1 footerEndRefreshing];
        NSArray *listDatas=responseObject[@"data"];
        NSArray *remenmodels=[remenModel objectArrayWithKeyValuesArray:listDatas];
        NSMutableArray *remenFrameArray=[NSMutableArray array];
        for (remenModel *remenmodel in remenmodels) {
            remenFramModel *remenFramemodel=[[remenFramModel alloc] init];
            remenFramemodel.remenModels=remenmodel;
            [remenFrameArray addObject:remenFramemodel];
        }
        [self.remenFrameArrays addObjectsFromArray:remenFrameArray];
        [self.tableView1 reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];

}
-(void)loadNewDatas
{

    AFHTTPRequestOperationManager *manner=[[AFHTTPRequestOperationManager alloc] init];
    remenFramModel *remenFramLastmodel=[self.remenFrameArrays firstObject];
    remenModel *remenlastmodel=remenFramLastmodel.remenModels;
    NSString *urlstr=[NSString stringWithFormat:@"%@%@",@"https://api.chufaba.me/v2/discovery/feed.json?after=",remenlastmodel.time];
    [manner GET:urlstr parameters:@{} success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //                   NSLog(@"%@",responseObject);
        [self.tableView1 headerEndRefreshing];
        NSArray *listDatas=responseObject[@"data"];
        if (listDatas.count) {
            NSArray *remenmodels=[remenModel objectArrayWithKeyValuesArray:listDatas];
            NSMutableArray *remenFrameArray=[NSMutableArray array];
            for (remenModel *remenmodel in remenmodels) {
                remenFramModel *remenFramemodel=[[remenFramModel alloc] init];
                remenFramemodel.remenModels=remenmodel;
                [remenFrameArray addObject:remenFramemodel];
            }
            [self.remenFrameArrays insertObjects:remenFrameArray atIndexes:[NSIndexSet indexSetWithIndex:0]];
            [self.tableView1 reloadData];
        }
     
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];


}
#pragma mark scrollview==================================
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //NSLog(@"%@",NSStringFromCGPoint(self.tableViewContentscrollView.contentOffset));
    if (self.scrollView.contentOffset.x==KscreenW) {
        [self titleSelected:self.titleLab2];
    }else
    {
        [self titleSelected:self.titleLab1];
    }
}
#pragma mark loginsuccess
-(void)loginSuccess
{
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.guanzhuView removeFromSuperview];
}
-(void)GetUserInfoResponse:(NSNotification *)notifi
{
    NSLog(@"%@",notifi.userInfo[kResponse]);
    
}
@end
