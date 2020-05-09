//
//  Main.m
//  hookWeChat
//
//  Created by 贾仕琪 on 2020/5/8.
//  Copyright © 2020 贾仕琪. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "Wechat+hook.h"


static void __attribute__((constructor)) initialize(void) {
    NSLog(@"++++++++ loaded ++++++++");
    //    CBHookClassMethod();
    [NSObject hookWeChat];
}
