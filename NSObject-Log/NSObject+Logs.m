//
//  NSObject+Logs.m
//  NSObject-Log
//
//  Created by 熊坤 on 2018/3/20.
//  Copyright © 2018年 xk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSObject+Logs.h"
#import <objc/runtime.h>

@implementation NSObject (Logs)

+ (void)load {
//    交换两个方法
    method_exchangeImplementations(class_getInstanceMethod([NSObject class], @selector(description)), class_getInstanceMethod([NSObject class], @selector(customDescription)));
}

/**
 *  该方法是用来自定义模型(直接继承NSObject)的输出格式
 *
 *  @return 格式化后的字符串
 */
- (NSString *)customDescription {
    Class class = [self class];
    NSMutableString *descString = [NSMutableString stringWithFormat:@"%@ = {\n", [self customDescription]];
    while (class != [NSObject class]) {

        if ([[class description] hasPrefix:@"NS"] || [[class description] hasPrefix:@"__"] || [[class description] hasPrefix:@"AV"] || [[class description] hasPrefix:@"_UIFlowLayout"] || [[class description] hasPrefix:@"UITouchesEvent"] || [class isSubclassOfClass:[UIResponder class]] || [class isSubclassOfClass:[CALayer class]] || [class isSubclassOfClass:[UIImage class]]) return [self customDescription];

        unsigned int count = 0;
        Ivar *ivars = class_copyIvarList(class, &count);
        
        for (int i = 0; i < count; i ++) {
            // 根据位置获取成员变量
            Ivar ivar = ivars[i];
            // 获取成员变量名
            const char *name = ivar_getName(ivar);
            // 将获取到的成员变量转为OC字符串
            NSString *ivarName = [NSString stringWithUTF8String:name];
            // 根据成员变量名获取对应的值
            id value = [self valueForKey:ivarName];
            [descString appendFormat:@"\t%@ = %@;\n", ivarName, value];
        }
        // 释放指针
        free(ivars);
        class = class_getSuperclass(class);
    }
    [descString appendFormat:@"}\n"];
    return descString;
}

@end
