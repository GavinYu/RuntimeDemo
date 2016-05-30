//
//  Person.m
//  RuntimeDemo
//
//  Created by yc-sh-vr-pc05 on 16/5/26.
//  Copyright © 2016年 YunEEC. All rights reserved.
//

#import "Person.h"

#import <objc/runtime.h>

@implementation Person

#pragma mark 获取对象所有的属性名
- (NSArray *)allProperties {
    unsigned int count;
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    NSMutableArray *propertiesArray = [NSMutableArray arrayWithCapacity:count];
    
    for (int i = 0; i < count; ++i) {
        const char *propertyName = property_getName(properties[i]);
        NSString *name = [NSString stringWithUTF8String:propertyName];
        
        [propertiesArray addObject:name];
    }
    
    free(properties);
    
    return propertiesArray;
}

#pragma mark 获取所有属性名及对应的属性值
- (NSDictionary *)allPropertyNamesAndValues {
    NSMutableDictionary *resultDict = [NSMutableDictionary dictionary];
    
    unsigned int outCount;
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    
    for (int i = 0; i < outCount; ++i) {
        objc_property_t property = properties[i];
        
        const char *name = property_getName(property);
        //得到属性名称
        NSString *propertyName = [NSString stringWithUTF8String:name];
        //获取属性值
        id propertyValue = [self valueForKey:propertyName];
        if (propertyValue && propertyValue != nil) {
            [resultDict setObject:propertyValue forKey:propertyName];
        }
    }
    
    free(properties);
    
    return resultDict;
}

#pragma mark 获取对象的所有方法名
- (void)allMethods {
    unsigned int outcount = 0;
    Method *methods = class_copyMethodList([self class], &outcount);
    
    for (int i = 0; i < outcount; ++i) {
        Method method = methods[i];
        SEL methodSEL = method_getName(method);
        const char *name = sel_getName(methodSEL);
        NSString *methodName = [NSString stringWithUTF8String:name];
        
        int arguments = method_getNumberOfArguments(method);
        NSLog(@"方法名：%@， 参数个数：%d", methodName, arguments);
    }
    
    free(methods);
}

#pragma mark  获取对象的所有成员变量名称
- (NSArray *)allMemberVariables {
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList([self class], &count);
    
    NSMutableArray *resultArr = [[NSMutableArray alloc] initWithCapacity:count];
    
    for (int i = 0; i < count; ++i) {
        Ivar variable = ivars[i];
        
        const char *name = ivar_getName(variable);
        NSString *varName = [NSString stringWithUTF8String:name];
        
        [resultArr addObject:varName];
    }
    
    free(ivars);
    
    return resultArr;
}

@end
