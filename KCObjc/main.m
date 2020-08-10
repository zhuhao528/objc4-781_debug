//
//  main.m
//  KCObjc
//
//  Created by Cooci on 2020/7/24.
//

#import <Foundation/Foundation.h>
#import "LGPerson.h"
/// 运行时的头文件
#import <objc/runtime.h>
/// 消息转发的头文件
#import <objc/message.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        NSObject *objc = [[NSObject alloc] init];
        LGPerson *person = [[LGPerson alloc] init];

        NSLog(@"Hello, World!\n %@ \n - %@",objc,person);
        
        /// 对象方法 依然调用msg_send所以仍然调用lookUpImpOrForward
        [LGPerson TestClassMethod];
        
        /// 消息转发流程 直接消息转发会崩溃
        ((void (*)(id,SEL))_objc_msgForward)([LGPerson new],@selector(test));
    }
    return 0;
}
