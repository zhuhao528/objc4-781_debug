//
//  LGPerson.m
//  KCObjc
//
//  Created by Cooci on 2020/7/24.
//

#import "LGPerson.h"
#import "ForwardClass.h"
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
    if([methodName isEqualToString:@"sendMsg"]){
        class_addMethod([LGPerson class], sel, (IMP)sendMsg, "v@:");
    }
    return NO;
}

- (id)forwardingTargetForSelector:(SEL)aSelector{
    NSString *methodName = NSStringFromSelector(aSelector);
    if([methodName isEqualToString:@"forwardMethod"]){
        return [ForwardClass new];
    }
    return [super forwardingTargetForSelector:aSelector];
}

//- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
//    if ((NSSelectorFromString(@"breakWind")) == aSelector) {
//        return  [NSMethodSignature signatureWithObjCTypes:"v@:@"];
//    }
//    return [super methodSignatureForSelector:aSelector];
//}
//
//- (void)forwardInvocation:(NSInvocation *)anInvocation {
//    ForwardClass *forword = [ForwardClass new];
//    anInvocation.target = forword;
//    anInvocation.selector = sel_registerName("getMessageFromFarter:");
//    NSString *way = @"help me to break wind";
//    [anInvocation setArgument:&way atIndex:2];
//    [anInvocation invoke];
//}

@end
