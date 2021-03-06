//
//  ViewController.m
//  MAV_V1
//
//  Created by ko on 2016/1/7.
//  Copyright © 2016年 KK. All rights reserved.
//

#import "ViewController.h"
#import <CoreMotion/CoreMotion.h>

@interface ViewController ()
{
    CMMotionManager *motionManager;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)theSwitch:(id)sender {
    UISwitch * switcher = (UISwitch *)sender;
    if(switcher.on)
    {
        if(motionManager==nil)  motionManager=[CMMotionManager new];
        
        // Check if Gyroscope is available
        if(motionManager.gyroAvailable == NO)
        {
            [sender setOn:NO animated:YES];
            return;
        }
        
        motionManager.gyroUpdateInterval=0.2;
        
        [motionManager startGyroUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:^(CMGyroData *gyroData, NSError *error) {
            
            if(error==nil)
            {
                NSString *info=[NSString stringWithFormat:@"x:%+.02fr/s,y:%+.02fr/s,z:%+.02fr/s"
                                ,gyroData.rotationRate.x
                                ,gyroData.rotationRate.y
                                ,gyroData.rotationRate.z];
                
                _infoLabel.text=info;
            }
            
        }];
    }
    else
    {
        [motionManager stopGyroUpdates];
    }
    

    
}
@end
