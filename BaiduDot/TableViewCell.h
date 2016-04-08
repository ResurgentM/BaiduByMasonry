//
//  TableViewCell.h
//  BaiduDot
//
//  Created by 毛健辉 on 16/4/7.
//  Copyright © 2016年 Mao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *hisImageView;
@property (weak, nonatomic) IBOutlet UILabel *hisNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *hisStyleLabel;
@property (weak, nonatomic) IBOutlet UILabel *yiBaoLabel;
@property (weak, nonatomic) IBOutlet UILabel *numaberLabel;
-(void)setcell;
@end
