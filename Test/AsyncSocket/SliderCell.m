//
//  SliderCell.m
//  TrailCamera
//
//  Created by 斯远 on 16/6/20.
//  Copyright © 2016年 sifar. All rights reserved.
//

#import "SliderCell.h"

@implementation SliderCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code

    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (IBAction)changeValue:(UISlider *)sender {
    NSInteger value;
    if ([self.titleLab.text isEqualToString:@"Video Length"]) {
        value=54*sender.value+5;
        
    } else {
            value=4*sender.value+1;
    }

    self.valueLab.text=[NSString stringWithFormat:@"%ld",(long)value];
//    if ([self.titleLab.text isEqualToString:@"Video Length"]) {
//        
//       self.valueLab.text=[NSString stringWithFormat:@"%0.f",54*sender.value+5];
//    }
//    else {
//        self.valueLab.text=[NSString stringWithFormat:@"%0.f",4*sender.value+1];
//    }
    
    
}


- (IBAction)dragOut:(UISlider *)sender {
    NSInteger value;
    if ([self.titleLab.text isEqualToString:@"Video Length"]) {
        value=54*sender.value+5;
    }
    else {
            //彩信
            value=4*sender.value+1;
     
        
    }
    if (self.sliderBlock) {
        NSLog(@"%ld",(long)value);
        self.sliderBlock(value);
    }
//    NSLog(@"停止拖动");
}





@end
