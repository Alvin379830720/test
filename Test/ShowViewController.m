//
//  ShowViewController.m
//  Test
//
//  Created by 斯远 on 2017/5/26.
//  Copyright © 2017年 wuyuan. All rights reserved.
//

#import "ShowViewController.h"

@interface ShowViewController ()
{
    IBOutlet UITextField *TF;
    NSInteger rowNum;
    UIAlertController *_alertVC;
}
@property (nonatomic, strong) dispatch_source_t timer;

@property (strong, nonatomic) IBOutlet UILabel *valueLab;



@end

@implementation ShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    self.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    //延时触发
    dispatch_time_t start = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC));
    //间隔
    uint64_t interval = (uint64_t)(1.0 * NSEC_PER_SEC);
    dispatch_source_set_timer(self.timer, start, interval, 0);
    
    dispatch_source_set_event_handler(self.timer, ^{
    
        NSLog(@"调用详情接口++++++++++++++++++++++++++++");
    });

    
    UIColor *color = [UIColor colorWithPatternImage:[UIImage imageNamed:@"labBg"]];
    self.valueLab.backgroundColor = color;
    
    
}

- (IBAction)changeData:(id)sender {
    NSLog(@"点击暂停");
    dispatch_suspend(self.timer);
}






- (IBAction)reFresh:(id)sender {
    
    //开始
     dispatch_resume(self.timer);
    NSLog(@"点击开始");
}


-(void)dealloc
{
    NSLog(@"33");

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
