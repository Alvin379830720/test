//
//  A1ViewController.h
//  Test
//
//  Created by 斯远 on 2017/6/21.
//  Copyright © 2017年 wuyuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CellModel.h"
@interface A1ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)CellModel *gCamereSettingModel;
@property (nonatomic,strong)NSMutableArray *receivArr;
@end
