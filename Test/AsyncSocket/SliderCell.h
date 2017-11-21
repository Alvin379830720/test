//
//  SliderCell.h
//  TrailCamera
//
//  Created by 斯远 on 16/6/20.
//  Copyright © 2016年 sifar. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SliderBlock) (NSInteger value);
@interface SliderCell : UITableViewCell
@property (nonatomic,copy)SliderBlock sliderBlock;

/**
 *  标题
 */
@property (strong, nonatomic) IBOutlet UILabel *titleLab;

/**
 *  滑块
 */


/**
 *  滑动值
 */
@property (strong, nonatomic) IBOutlet UILabel *valueLab;


@end
