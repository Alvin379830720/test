//
//  AController.m
//  Test
//
//  Created by 斯远 on 2017/6/21.
//  Copyright © 2017年 wuyuan. All rights reserved.
//

#import "AController.h"
#import "A1ViewController.h"



#define TabbarHeight     ([[UIApplication sharedApplication] statusBarFrame].size.height>20?83:49) // 适配iPhone x 底栏高度


@interface AController ()

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic,assign)NSInteger value;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic,copy)NSString *string1;

@property (strong, nonatomic) IBOutlet UITextField *TF;


@end

@implementation AController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.translucent=NO;
//    NSString *homeDirectory = NSHomeDirectory();
//    _tabBarView.frame = CGRectMake(0, CurrentScreenHeight - TabbarHeight, CurrentScreenWidth, TabbarHeight);
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSLog(@"%@",paths);
//    CGRect statusBarFrame = [[UIApplication sharedApplication] statusBarFrame];
    self.navigationController.navigationBarHidden=YES;

//    UIViewController *vc=[[NSClassFromString(@"aa") alloc]init];
//    [vc performSelector:@selector(f) withObject:nil afterDelay:0];
//    [vc performSelector:NSSelectorFromString(@"method") withObject:nil];
//    NSLog(@"线程睡眠");
//    [NSThread sleepForTimeInterval:3];
//    NSLog(@"线程恢复");
//    [self performSelectorOnMainThread:@selector(testWith:) withObject:@"bbb" waitUntilDone:YES];
    
//    [self performSelector:@selector(testWith:) withObject:@"aaa" afterDelay:3];
//    NSLog(@"线程结束");

    
    NSString *filePath=@"http://www.wuyuancloud.com//a02c369d54cb/20171115090809047WVHO0926.MOV";
    NSURL *url=[NSURL URLWithString:filePath];
    NSData *videoData=[NSData dataWithContentsOfURL:url];
    NSString *tmpDir = NSTemporaryDirectory();
    
    NSString *fileStr = [tmpDir stringByAppendingPathComponent:@"20171115090809047WVHO0926.MOV"];
    
//    UIImage *image=[UIImage imageWithData:imageData];
//    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
    [[NSFileManager defaultManager]createFileAtPath:fileStr contents:videoData attributes:nil];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        UISaveVideoAtPathToSavedPhotosAlbum(fileStr, self, @selector(video:didFinishSavingWithError:contextInfo:), nil);
        
    });
    
    NSLog(@"完成");
}

- (void)video:(NSString *)videoPath didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    if (error) {
        NSLog(@"%@",error);
    }
    
}
-(void )testWith:(NSString *)a
{
    NSLog(@"%@",a);
    
}

- (IBAction)start:(id)sender {
    
    [self performSelector:@selector(testWith:) withObject:@"aaa" afterDelay:2];
    NSLog(@"线程结束");
    
}


- (IBAction)end:(id)sender {
    [[NSObject class]cancelPreviousPerformRequestsWithTarget:self selector:@selector(testWith:) object:@"aaa"];
    
}


-(void)viewDidLayoutSubviews
{
//    for (UIView *view in self.view.subviews) {
//        NSLog(@"%@",NSStringFromCGRect(view.frame));
//    }
//    NSLog(@"%@",NSStringFromCGRect([UIScreen mainScreen].bounds));
    
    
}

-(void)viewWillAppear:(BOOL)animated
{
//    NSLog(@"---%@",self.dataArray);
    
}

- (IBAction)click:(id)sender {
    
    A1ViewController *vc=[[A1ViewController alloc]init];
    vc.receivArr=[NSMutableArray arrayWithArray:self.dataArray];
    
    [self.navigationController pushViewController:vc
                                         animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)dealloc
{
    NSLog(@"release %@",[self class]);

}
- (UIViewController *)getCurrentVC
{
    UIViewController *result = nil;
    
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]])
        result = nextResponder;
    else
        result = window.rootViewController;
    
    return result;
}
//支持旋转
-(BOOL)shouldAutorotate{
    return NO;
}

//支持的方向 因为界面A我们只需要支持竖屏
//- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
//    return UIInterfaceOrientationMaskPortrait;
//}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
