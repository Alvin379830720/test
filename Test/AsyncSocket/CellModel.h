//
//  CellModel.h
//  Test
//
//  Created by 斯远 on 2017/9/26.
//  Copyright © 2017年 wuyuan. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface CellModel : JSONModel
@property (nonatomic,copy)NSString *voiceON;
@property (nonatomic,copy)NSString *videoON;
@property (nonatomic,copy)NSString *otherON;
@end
