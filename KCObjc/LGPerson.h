//
//  LGPerson.h
//  KCObjc
//
//  Created by Cooci on 2020/7/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LGPerson : NSObject

/// 动态解析
- (void)test;

// 类方法
+ (void)TestClassMethod;

// 消息转发
- (void)forwardMethod;

@end

NS_ASSUME_NONNULL_END
