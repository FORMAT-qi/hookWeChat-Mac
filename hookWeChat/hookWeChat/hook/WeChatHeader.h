//
//  WeChatHeader.h
//  WeChatEX
//
//  Created by 贾仕琪 on 2020/5/8.
//  Copyright © 2020 贾仕琪. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MMLoginOneClickViewController : NSViewController
- (void)onLoginButtonClicked:(id)arg1;
@end

@interface WeChat : NSObject
- (BOOL)IsAuthOK;
@end

@interface CUtility : NSObject
+ (id)GetCurrentUserName;
@end

@interface MMServiceCenter : NSObject
+ (id)defaultCenter;
- (id)getService:(Class)arg1;
@end

@interface MessageService : NSObject
- (id)SendTextMessage:(id)arg1 toUsrName:(id)arg2 msgText:(id)arg3 atUserList:(id)arg4;
@end



