//
//  SDCircleAndMaxNumCell.m
//  TrailCamera
//
//  Created by 斯远 on 16/6/22.
//  Copyright © 2016年 sifar. All rights reserved.
//

#import "SDCircleAndMaxNumCell.h"

@implementation SDCircleAndMaxNumCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.maxTF.delegate=self;
    
    [self.maxTF setValue:[UIColor grayColor] forKeyPath:@"_placeholderLabel.textColor"];
    self.maxTF.backgroundColor=[UIColor darkGrayColor];
   
    self.maxTF.layer.borderWidth = 1.0;
    self.maxTF.layer.borderColor =[UIColor blackColor].CGColor;

    

//    [self.maxSwitchBg addSubview:self.maxSwitch];
    
//    [self.maxSwitch addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    
    
    
    // Initialization code
}

-(void)setON:(BOOL)ON
{
    NSLog(@"设置");
    if (_ON) {
//        [self.maxSwitch removeObserver:self forKeyPath:@"isON"];
    }
    _ON=ON;
    
    //注册观察者监听isON
//    [self.maxSwitch addObserver:self forKeyPath:@"isON" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
//{
//    if ([keyPath isEqualToString:@"isON"]) {
//        if (change[@"new"]!=change[@"old"]) {
//            NSLog(@"自定义UI捕获到的改变值");
//            [self.maxSwitch sendActionsForControlEvents:UIControlEventValueChanged];
//            
//        }else {
//            NSLog(@"没有改变值");
//        }
//    }
//}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    
    
    NSLog(@"将要开始编辑");
    if (self.pickBlock) {
        _pickBlock(textField);
    }
    
    return NO;
}

-(void)dealloc
{
    NSLog(@"release sdcircelAndMaxNumcell");
//    [self.maxSwitch removeObserver:self forKeyPath:@"isON"];
}

@end
