//
//  MySlider.m
//  Test
//
//  Created by 斯远 on 2017/8/22.
//  Copyright © 2017年 wuyuan. All rights reserved.
//

#import "MySlider.h"
#define SLIDER_X_BOUND 30
#define SLIDER_Y_BOUND 40
@implementation MySlider

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

//-(CGRect)thumbRectForBounds:(CGRect)bounds trackRect:(CGRect)rect value:(float)value
//{
//
//    //y轴方向改变手势范围
//    rect.origin.y = rect.origin.y - 10;
//    rect.size.height = rect.size.height + 20;
//    return CGRectInset ([super thumbRectForBounds:bounds trackRect:rect value:value], 10 ,10);
//   
//}


- (CGRect)thumbRectForBounds:(CGRect)bounds trackRect:(CGRect)rect value:(float)value;
{
    
    rect.origin.x = rect.origin.x;
    rect.size.width = rect.size.width;
    CGRect result = [super thumbRectForBounds:bounds trackRect:rect value:value];
    //记录下最终的frame
    self.lastBounds = result;
    return result;
}
//检查点击事件点击范围是否能够交给self处理
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    //调用父类方法,找到能够处理event的view
    UIView* result = [super hitTest:point withEvent:event];
    if (result != self) {
        /*如果这个view不是self,我们给slider扩充一下响应范围,
         这里的扩充范围数据就可以自己设置了
         */
        NSLog(@"不是本类");
        if ((point.y >= -15) &&
            (point.y < (self.lastBounds.size.height + SLIDER_Y_BOUND)) &&
            (point.x >= 0 && point.x < CGRectGetWidth(self.bounds))) {
            //如果在扩充的范围类,就将event的处理权交给self
            NSLog(@"强转");
            result = self;
        }
    }
    //否则,返回能够处理的view
    return result;
}
//检查是点击事件的点是否在slider范围内
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    //调用父类判断
    BOOL result = [super pointInside:point withEvent:event];
    
    if (!result) {
        //同理,如果不在slider范围类,扩充响应范围
        if ((point.x >= (self.lastBounds.origin.x - SLIDER_X_BOUND)) && (point.x <= (self.lastBounds.origin.x + self.lastBounds.size.width + SLIDER_X_BOUND))
            && (point.y >= -SLIDER_Y_BOUND) && (point.y < (self.lastBounds.size.height + SLIDER_Y_BOUND))) {
            //在扩充范围内,返回yes
            result = YES;
        }
    }
    
    //NSLog(@"UISlider(%d).pointInside: (%f, %f) result=%d", self, point.x, point.y, result);
    //否则返回父类的结果
    NSLog(@"%ld",result);
    return result;
}



@end
