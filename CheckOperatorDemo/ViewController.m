//
//  ViewController.m
//  CheckOperatorDemo
//
//  Created by ZhangMeng on 13-9-29.
//  Copyright (c) 2013年 zhangM. All rights reserved.
//

#import "ViewController.h"
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCarrier.h>
#import <Reachability.h>
#import <AFNetworking.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    

    [self checkChinaMobile];
}

- (void)checkChinaMobile
{
    
    CTTelephonyNetworkInfo *info = [[CTTelephonyNetworkInfo alloc] init];
    CTCarrier *carrier = [info subscriberCellularProvider];
    if (carrier == nil) {
        
        return ;
    }
    
    NSString *code = [carrier mobileNetworkCode];
    if (code == nil) {
        return;
    }
    
    if ([code isEqualToString:@"00"] || [code isEqualToString:@"02"] || [code isEqualToString:@"07"]) { //中国移动
           NSLog(@"中国移动");
    
    }else if ([code isEqualToString:@"01"] || [code isEqualToString:@"06"]){ //中国联通
           NSLog(@"中国联通");
    
    }else if ([code  isEqualToString:@"03"] || [code isEqualToString:@"05"]){ //中国电信
           NSLog(@"中国电信");
    
    }else if([code isEqualToString:@"20"]){  //中国铁通
          NSLog(@"中国铁通");
    
    }
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
