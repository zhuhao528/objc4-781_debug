//
//  LGPerson.m
//  KCObjc
//
//  Created by Cooci on 2020/7/24.
//

#import "LGPerson.h"
#import <objc/runtime.h>

@implementation LGPerson

void sendMsg(id self,SEL _cmd){
    NSLog(@"custom");
}

- (void)test{
    NSLog(@"test");
}

+ (BOOL)resolveInstanceMethod:(SEL)sel{
    NSString *methodName = NSStringFromSelector(sel);
    if([methodName isEqualToString:@"test"]){
        class_addMethod([LGPerson class], sel, (IMP)sendMsg, "v@:");
    }
    return NO;
}

- (id)forwardingTargetForSelector:(SEL)aSelector{
    NSString *methodName = NSStringFromSelector(aSelector);
    if([methodName isEqualToString:@"test"]){
        return [LGPerson new];
    }
    return [super forwardingTargetForSelector:aSelector];
}

//- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
//
//}

- (void)forwardInvocation:(NSInvocation *)anInvocation{

}

@end
