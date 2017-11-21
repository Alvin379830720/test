//
//  SDCircleAndMaxNumCell.h
//  TrailCamera
//
//  Created by 斯远 on 16/6/22.
//  Copyright © 2016年 sifar. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^PickShowBlock) (UITextField *textFiled);
typedef void (^SwitchBlock) (NSString *ON);
@interface SDCircleAndMaxNumCell : UITableViewCell<UITextFieldDelegate>
@property (nonatomic,copy)PickShowBlock pickBlock;
@property (nonatomic,copy)SwitchBlock switchBlock;
//@property (strong, nonatomic) IBOutlet UISwitch *circleSwitch;

@property (strong, nonatomic) IBOutlet UITextField *maxTF;

@property (strong, nonatomic) IBOutlet UILabel *maxNumLab;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *titlleLabRightLayout;

@property (strong, nonatomic) IBOutlet UIView *maxSwitchBg;

@property (nonatomic,assign)BOOL ON;

@end
