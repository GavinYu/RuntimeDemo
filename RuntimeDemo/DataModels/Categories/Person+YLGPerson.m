//
//  Person+YLGPerson.m
//  RuntimeDemo
//
//  Created by yc-sh-vr-pc05 on 16/5/26.
//  Copyright © 2016年 YunEEC. All rights reserved.
//

#import "Person+YLGPerson.h"

#import <objc/runtime.h>

const void *s_AgeKey = "s_AgeKey";

@implementation Person (YLGPerson)

@dynamic age;

- (void)setAge:(NSString *)age {
    objc_setAssociatedObject(self, @selector(age), age, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
}

- (NSString *)age {
    return objc_getAssociatedObject(self, @selector(age));
}

@end
