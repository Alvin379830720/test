//
//  A1ViewController.m
//  Test
//
//  Created by 斯远 on 2017/6/21.
//  Copyright © 2017年 wuyuan. All rights reserved.
//

#import "A1ViewController.h"
#import "SliderCell.h"
#import "SDCircleAndMaxNumCell.h"


static NSString *slidCellId=@"idf";
static NSString *sdCellId=@"SDidf";
@interface A1ViewController ()

@property (strong, nonatomic) IBOutlet UITableView *myTableView;


@end

@implementation A1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}


-(CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

-(NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

#pragma mark---------------uitaleView Delegate
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row>8) {
        
        SDCircleAndMaxNumCell *cell=[tableView dequeueReusableCellWithIdentifier:sdCellId forIndexPath:indexPath];
        
        switch (indexPath.row) {
            case 9:
                cell.maxNumLab.text=@"Voice";
               
                break;
            case 10:
                 cell.maxNumLab.text=@"Video";
                 cell.ON=[self trangeBoolFromString:self.gCamereSettingModel.videoON];
                
                break;
                
            default:
                 cell.maxNumLab.text=@"Other";
                 cell.ON=[self trangeBoolFromString:self.gCamereSettingModel.otherON];
             
                break;
        }
        return cell;
    }
    SliderCell *cell=[tableView dequeueReusableCellWithIdentifier:slidCellId];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    return cell;
}

-(BOOL )trangeBoolFromString:(NSString *)stateString
{
    BOOL result=NO;
    if ([stateString isEqualToString:@"ON"]) {
        result=YES;
        
        //        NSLog(@"开");
        
    } else {
        //    NSLog(@"关");
    }
    return result;
}




-(void )addAlert
{
    if (self.presentedViewController) {
        NSLog(@"存在");
//        [_alertVC dismissViewControllerAnimated:YES completion:nil];
    }else {
        NSLog(@"消失");
    }
    UIAlertController *alertVC=[UIAlertController alertControllerWithTitle:@"附加" message:@"dddd" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *sureAction=[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //                            [[HomeTabBarViewController sharedTabbar]forcedExitLogin];
        
    }];
    
    [alertVC addAction:sureAction];
    
    [self presentViewController:alertVC animated:YES completion:nil];
    
}

- (IBAction)changeScreenOritend:(id)sender {
    
    NSLog(@"切换方向");
    
}

//是否自动旋转,返回YES可以自动旋转
-(BOOL)shouldAutorotate{
    return YES;
}
//
//支持的方向
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskLandscapeLeft;
}

//一开始的方向  很重要(这个是返回优先方向 )
-(UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    return UIInterfaceOrientationLandscapeLeft;
}



-(void)dealloc
{
    NSLog(@"release %@",[self class]);
    
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
