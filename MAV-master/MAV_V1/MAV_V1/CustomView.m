//
//  CustomView.m
//  MAV_V1
//
//  Created by ko on 2016/1/7.
//  Copyright © 2016年 KK. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

int curX;
int curY;


-(void) touchesBegan: (NSSet *) touches withEvent: (UIEvent *) event
{
}

- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{

    UITouch *touch = [touches anyObject];
    CGPoint lastTouch = [touch locationInView:self];
    curX = lastTouch.x;
    curY = lastTouch.y;
    NSLog(@"x=%d", curX);
    NSLog(@"y=%d", curY);
    
    //---get all touches on the screen---
    NSSet *allTouches = [event allTouches];
    
    
    //---compare the number of touches on the screen---
    switch ([allTouches count])
    {
            //---single touch---
        case 1: {
            
            //---get info of the touch---
            // UITouch *touch = [[allTouches allObjects] objectAtIndex:0];
            // CGPoint point = [touch locationInView:self];
            // NSLog(@"x=%f", point.x);
            //NSLog(@"y=%f", point.y);
            
            //curX = point.x;
            //curY = point.y;
            
            //---compare the touches---
            switch ([touch tapCount])
            {
                    //---single tap---
                case 1: {
                    NSLog(@"Single tap");
                } break;
                    
                    //---double tap---
                case 2: {
                    NSLog(@"Double tap");
                    
                } break;
                    
            }
            
        }  break;
    }
    
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(ctx, [[UIColor greenColor] CGColor]);
    CGContextFillEllipseInRect(ctx, CGRectMake(curX - 50, curY - 50 , 100 , 100));
    
    }


@end
