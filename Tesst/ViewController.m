//
//  ViewController.m
//  Tesst
//
//  Created by Kola on 16/8/18.
//  Copyright © 2016年 Kola. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"提交第一个版本");
    
}

-(void)getinfor:(id)sender
{
    UIAlertView *alert = nil;
    
    UIButton*b = (UIButton*)sender;
    
    alert = [[UIAlertView alloc] initWithTitle:@"Delete Camera" message:@"Are You Sure?"
                                      delegate:self cancelButtonTitle:@"NO" otherButtonTitles:@"YES", nil];
    
    
    [alert show];

    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if([segue.identifier isEqualToString:@"gotoCameraDetails"])
    {
        
        NSLog(@"prepareForSegue: %@", segue.identifier);
        
    }
}


#pragma mark -- btserver delegate
-(void)didStopScan
{
    dispatch_async(dispatch_get_main_queue(), ^{
        //self.txtInfo.text = @"scan stoped";
    });
}

- (BOOL)shouldAutorotate{
    return NO;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
