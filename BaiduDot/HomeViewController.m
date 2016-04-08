//
//  HomeViewController.m
//  BaiduDot
//
//  Created by 毛健辉 on 16/4/6.
//  Copyright © 2016年 Mao. All rights reserved.
//

#import "HomeViewController.h"
#import "TableViewCell.h"
@interface HomeViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)UIView *view1;
@property(nonatomic,strong)UIView *view2;
@property(nonatomic,strong)UIView *topView;
@property(nonatomic,strong)NSArray *hisArray;
@property(nonatomic,strong)NSArray *hisNArray;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor lightGrayColor];
    [self createData];
    [self createSearch];
    [self createTableView];
    [self createScrollView];
    [self createLabel1];
    [self createLabel2];
}
#pragma make--创建假数据
-(void)createData{
    
    _hisArray=@[@"北京协和医院",@"北京大学第一医院",@"北京大学第三医院",@"北京大学人民医院",@"中国医学科阜外医院",@"中日友好医院",@"首都医科大学宣武医院",@"中国医学科学院整形外科医院",@"北京大学肿瘤医院",@"北京朝阳医院"];
    _hisNArray=@[@"284",@"153",@"128",@"122",@"116",@"994",@"57",@"39",@"48",@"69"];

}
-(void)createSearch{
    UISearchBar *search=[[UISearchBar alloc]initWithFrame:CGRectMake(70, 10, 260, 20)];
    
    [self.navigationController.navigationBar addSubview:search];
    search.placeholder=@"请输入疾病/医生/医院/科室";
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:(UIBarButtonSystemItemSearch) target:self action:@selector(toMap:)];

}
-(void)createTableView{
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 44, self.view.frame.size.width, self.view.frame.size.height-44-49) style:UITableViewStyleGrouped];
    _tableView.dataSource=self;
    _tableView.delegate=self;
    _tableView.contentInset=UIEdgeInsetsMake(360, 0, 0, 0);
    [_tableView registerNib:[UINib nibWithNibName:@"TableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:_tableView];

}
-(void)createScrollView{
    _scrollView =[[UIScrollView alloc]initWithFrame:CGRectMake(0, -360-44, self.view.frame.size.width, 165)];
    _scrollView.backgroundColor=[UIColor redColor];
    [_tableView addSubview:_scrollView];
}
-(void)createLabel1{
    _view1=[[UILabel alloc]initWithFrame:CGRectMake(0, -360-44+165, self.view.frame.size.width, 95)];
    _view1.userInteractionEnabled=YES;
    _view1.backgroundColor=[UIColor whiteColor];
    [_tableView addSubview:_view1];
    [self createSublabel1];
    
}
#pragma make  创建三个子label
-(void)createSublabel1{
    NSArray *textArray=@[@"找医院",@"找科室",@"查疾病"];
    for (int i=0; i<3; i++) {
        UIButton *button=[[UIButton alloc]init];
        button.frame=CGRectMake(35+125*i, _view1.frame.origin.y+10, 60, 60);
        button.layer.cornerRadius=30;
        button.backgroundColor=[UIColor grayColor];
        button.userInteractionEnabled=YES;
        [button addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
        
        UILabel *subLabel=[[UILabel alloc]initWithFrame:CGRectMake(35+125*i, _view1.frame.origin.y+75, 60, 15)];
        subLabel.text=textArray[i];
    
        subLabel.textAlignment=UITextAlignmentCenter;
        [_tableView addSubview:subLabel];
        [_tableView addSubview:button];
//        [_view1 addSubview:label];
       
       
    }
}
#pragma make --常见科室部分
-(void)createLabel2{
    _view2=[[UILabel alloc]initWithFrame:CGRectMake(0, -360-44+165+95+11, self.view.frame.size.width, 121)];
    _view2.backgroundColor=[UIColor whiteColor];
    [_tableView addSubview:_view2];
    //顶部标签
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(20, _view2.frame.origin.y+10, 80, 25)];
//    label.backgroundColor=[UIColor blackColor];
    label.text=@"常见科室";
    [_tableView addSubview:label];
    [self createSubLabel2];
   
}
-(void)createSubLabel2{
    NSArray *textArray=@[@"内科",@"外科",@"妇产科",@"儿科",@"骨科",@"口腔科",@"眼科",@"更多"];
    for (int i=0; i<8; i++) {
        if (i<4) {
            UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(17+88*i, _view2.frame.origin.y+35, 78, 30)];
            label.backgroundColor=[UIColor colorWithRed:242/255.0 green:247/255.0 blue:255/255.0 alpha:1];
            label.layer.cornerRadius=2;
            label.layer.masksToBounds=YES;
            label.text=textArray[i];
            label.textAlignment=UITextAlignmentCenter;
            [_tableView addSubview:label];
        }else{
        
            UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(17+88*(i-4), _view2.frame.origin.y+35+40, 78, 30)];
            label.backgroundColor=[UIColor colorWithRed:242/255.0 green:247/255.0 blue:255/255.0 alpha:1];
            [_tableView addSubview:label];
            label.layer.cornerRadius=2;
            label.layer.masksToBounds=YES;
            label.text=textArray[i];
            label.textAlignment=UITextAlignmentCenter;
            if (i==7) {
                label.backgroundColor=[UIColor colorWithRed:246/255.0 green:246/255.0 blue:246/255.0 alpha:1];
            }

        }
    }

}
-(void)toMap:(UIBarButtonItem *)leftButton{
    NSLog(@"跳转地图");
}
#pragma make--找医院之类的点击
-(void)action:(UIButton *)button{
    NSLog(@"1");
}
#pragma mak--tableView 代理
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if (cell==nil) {
        cell=[[TableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.hisNameLabel.text=_hisArray[indexPath.row];
    NSMutableString *string=[[NSMutableString alloc]init];
    [string appendFormat:@"%@",_hisNArray[indexPath.row]];
    [string appendString:@"位优质医生"];

    cell.numaberLabel.text=string;
    
    return cell;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headerView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
    headerView.backgroundColor=[UIColor whiteColor];
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(20, 10, 80, 25)];
    label.text=@"热门医院";
    [headerView addSubview:label];
    return headerView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 44;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
