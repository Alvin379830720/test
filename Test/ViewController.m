//
//  ViewController.m
//  Test
//
//  Created by 斯远 on 2017/5/10.
//  Copyright © 2017年 wuyuan. All rights reserved.
//

#import "ViewController.h"
#import "AsyncSocket.h"
#import "AFNetworking.h"


@interface ViewController ()<AsyncSocketDelegate,UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource>
{
    
}
@property (strong, nonatomic) IBOutlet UITableView *myTableViewq;


@property (nonatomic,copy)NSDictionary *dic;
@property (nonatomic,copy)NSMutableDictionary *muDic;


@property (strong, nonatomic) IBOutlet UITextField *TF;


@property (strong, nonatomic) IBOutlet UIImageView *imageView;


@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
//  [_myTableViewq registerNib:[UINib nibWithNibName:@"TestCell" bundle:nil] forCellReuseIdentifier:@"cellID"];
//    
//    [self initALi];

    
    //轨道图片
    UIImage *stetchLeftTrack = [UIImage imageNamed:@"thick"];
    UIImage *stetchRightTrack = [UIImage imageNamed:@"thick"];
    
    //滑块图片
    UIImage *thumbImage = [UIImage imageNamed:@"thumb"];
    
    //创建slider
    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(30, 300, 300, 7)];
    slider.backgroundColor = [UIColor clearColor];
    slider.value = 1.0;
    slider.minimumValue = 0.5;
    slider.maximumValue = 1.0;
    
    //设置轨道的图片
    [slider setMinimumTrackImage:stetchLeftTrack forState:UIControlStateNormal];
    [slider setMaximumTrackImage:stetchRightTrack forState:UIControlStateNormal];
    
    //设置滑块的图片
    //[slider setThumbImage:thumbImage forState:UIControlStateHighlighted];
    [slider setThumbImage:thumbImage forState:UIControlStateNormal];
    
    //滑动滑块添加事件
    //滑动过程中不断触发事件
    [slider addTarget:self action:@selector(onThumb:) forControlEvents:UIControlEventValueChanged];
    //滑动完成添加事件
    //滑动完成后触发事件
    [slider addTarget:self action:@selector(endThumb:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:slider];
    
    
}




-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 125;

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
