//
//  HomeViewController.m
//  BaiduDot
//
//  Created by 毛健辉 on 16/4/6.
//  Copyright © 2016年 Mao. All rights reserved.
//

#import "HomeViewController.h"
#import "TableViewCell.h"
#import <Masonry/Masonry.h>
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
    [self createView1];
    [self createView2];
}
#pragma make--创建假数据
-(void)createData{
    
    _hisArray=@[@"北京协和医院",@"北京大学第一医院",@"北京大学第三医院",@"北京大学人民医院",@"中国医学科阜外医院",@"中日友好医院",@"首都医科大学宣武医院",@"中国医学科学院整形外科医院",@"北京大学肿瘤医院",@"北京朝阳医院"];
    _hisNArray=@[@"284",@"153",@"128",@"122",@"116",@"994",@"57",@"39",@"48",@"69"];

}
-(void)createSearch{
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
    [self.navigationController.navigationBar addSubview:view];
    UILabel *label=({
        UILabel *label=[UILabel new];
        [view addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(view.mas_top).offset(10);
            make.left.equalTo(view.mas_left).offset(10);
            make.size.mas_equalTo(CGSizeMake(40, 30));
        }];
        
//        label.backgroundColor=[UIColor redColor];
        label.text=@"北京";
        
        label;
    });
    UISearchBar *search=({

        UISearchBar *search=[UISearchBar new];
        
        [view addSubview:search];
        [search mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(view.mas_top).offset(10);
            make.left.equalTo(label.mas_right).offset(15);
            make.right.equalTo(view.mas_right).offset(-45);
            make.size.mas_equalTo(CGSizeMake(260, 30));
        }];
        search.placeholder=@"请输入疾病/医生/医院/科室";
        search;
    });


}
-(void)createTableView{
    _tableView=({
        UITableView *tableView=[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStyleGrouped];;
        [self.view addSubview:tableView];
        [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self.mas_topLayoutGuide);
            make.left.equalTo(self.view.mas_left);
            make.size.equalTo(self.view);
        }];
        tableView.delegate=self;
        tableView.dataSource=self;
        tableView.contentInset=UIEdgeInsetsMake(340, 0, 0, 0);
        tableView.showsVerticalScrollIndicator=NO;
        tableView.contentOffset=CGPointMake(0, -340);
        [tableView registerNib:[UINib nibWithNibName:@"TableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
        tableView;
    });
    


}
-(void)createScrollView{
    _scrollView =({
        UIScrollView *view=[UIScrollView new];
        [_tableView addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_tableView.mas_top).offset(-360-44);
            make.left.equalTo(_tableView.mas_left);
//            make.right.equalTo(_tableView.mas_right);
            make.size.mas_equalTo(CGSizeMake(self.view.frame.size.width, 165));
        }];
        view.backgroundColor=[UIColor redColor];
        
        view;
    
    });

}
-(void)createView1{
    _view1=({
        UIView *view=[UIView new];
        [_tableView addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_scrollView.mas_bottom);
            make.left.equalTo(_tableView.mas_left);
//            make.right.equalTo(_tableView.mas_right);
            make.size.mas_equalTo(CGSizeMake(self.view.frame.size.width, 95));
        }];
        view.userInteractionEnabled=YES;
        view.backgroundColor=[UIColor whiteColor];
        
        view;
    });

    [self createSublabel1];
    
}
#pragma make  创建三个子label
-(void)createSublabel1{
        NSArray *textArray=@[@"找医院",@"找科室",@"查疾病"];
    UIStackView *stackView=[UIStackView new];
    [_view1 addSubview: stackView];
    [stackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_view1.mas_left).offset(30);
        make.right.equalTo(_view1.mas_right).offset(-30);
        make.top.equalTo(_view1.mas_top).offset(10);
        make.size.height.equalTo(@80);
        make.size.width.equalTo(@80);
    }];
    stackView.axis=UILayoutConstraintAxisHorizontal;
    stackView.alignment=UIStackViewAlignmentCenter;
    stackView.distribution=UIStackViewDistributionEqualSpacing;
    NSArray *array=@[[UIView new],[UIView new],[UIView new]];
    for (int i=0; i<3; i++) {
        UIView *view=array[i];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(60, 80));
            
        }];
        [stackView addArrangedSubview:view];
        UIButton *button=[[UIButton alloc]init];
        [view addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(view.mas_top);
            make.left.equalTo(view.mas_left);
            make.size.mas_equalTo(CGSizeMake(60,60 ));
        }];
        button.layer.cornerRadius=30;
        button.backgroundColor=[UIColor grayColor];
        button.userInteractionEnabled=YES;
        [button addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];

        UILabel *subLabel=[UILabel new];
        [view addSubview:subLabel];
        [subLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(view.mas_bottom);
            make.left.equalTo(view.mas_left);
            make.size.mas_equalTo(CGSizeMake(60, 15));
        }];
        subLabel.frame=CGRectMake(0, 65, 60, 15);
        subLabel.text=textArray[i];
        
        subLabel.textAlignment=NSTextAlignmentCenter;
        
    }

}
#pragma make --常见科室部分
-(void)createView2{
    _view2=[[UIView alloc]initWithFrame:CGRectMake(0, -360-44+165+95+11, self.view.frame.size.width, 121)];
    _view2.backgroundColor=[UIColor whiteColor];
    [_tableView addSubview:_view2];
    //顶部标签
    UILabel *label=[UILabel new];
    [_view2 addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_view2.mas_left).offset(20);
        make.top.equalTo(_view2.mas_top).offset(10);
        make.size.mas_equalTo(CGSizeMake(80, 25));
        
    }];
    label.text=@"常见科室";
    
    [self createSubLabel2];
   
}
-(void)createSubLabel2{
    NSArray *textArray=@[@"内科",@"外科",@"妇产科",@"儿科",@"骨科",@"口腔科",@"眼科",@"更多"];
    UIStackView *stackView1=({
        UIStackView *view=[UIStackView new];
        [_view2 addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_view2.mas_left).offset(17);
            make.right.equalTo(_view2.mas_right).offset(-17);
            make.top.equalTo(_view2.mas_top).offset(35);
            make.size.mas_equalTo(CGSizeMake(80, 30));
        }];
        view;
    });
    stackView1.axis=UILayoutConstraintAxisHorizontal;
    stackView1.alignment=UIStackViewAlignmentCenter;
    stackView1.distribution=UIStackViewDistributionFillEqually;
    stackView1.spacing=10;
    UIStackView *stackView2=({
        UIStackView *view=[UIStackView new];
        [_view2 addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_view2.mas_left).offset(17);
            make.right.equalTo(_view2.mas_right).offset(-17);
            make.top.equalTo(stackView1.mas_bottom).offset(10);
            make.size.mas_equalTo(CGSizeMake(80, 30));
        }];
        view;
    });
    stackView2.axis=UILayoutConstraintAxisHorizontal;
    stackView2.alignment=UIStackViewAlignmentCenter;
    stackView2.distribution=UIStackViewDistributionFillEqually;
    stackView2.spacing=10;
    for (int i=0; i<8; i++) {
        if (i<4) {
            UILabel *label=({
                UILabel *label=[UILabel new];
                [stackView1 addArrangedSubview:label];
                [label mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.height.equalTo(@30);
                }];
                label.backgroundColor=[UIColor colorWithRed:242/255.0 green:247/255.0 blue:255/255.0 alpha:1];
                label.layer.cornerRadius=2;
                label.layer.masksToBounds=YES;
                label.text=textArray[i];
                label.textAlignment=NSTextAlignmentCenter;
                label;
            });
            
        }else{
            UILabel *label=({
                UILabel *label=[UILabel new];
                [stackView2 addArrangedSubview:label];
                [label mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.height.equalTo(@30);
                }];
                label.backgroundColor=[UIColor colorWithRed:242/255.0 green:247/255.0 blue:255/255.0 alpha:1];
                label.layer.cornerRadius=2;
                label.layer.masksToBounds=YES;
                label.text=textArray[i];
                label.textAlignment=NSTextAlignmentCenter;
                if (i==7) {
                    label.backgroundColor=[UIColor colorWithRed:246/255.0 green:246/255.0 blue:246/255.0 alpha:1];
                }
                label;
            });
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
    UILabel *label=({
        UILabel *label=[UILabel new];
        [headerView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(headerView.mas_left).offset(20);
            make.top.equalTo(headerView.mas_top).offset(10);
            make.size.mas_equalTo(CGSizeMake(80, 25));
        }];
        label.text=@"热门医院";
        label;
    });
    
    
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
