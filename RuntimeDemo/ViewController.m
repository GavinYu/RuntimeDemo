//
//  ViewController.m
//  RuntimeDemo
//
//  Created by yc-sh-vr-pc05 on 16/5/26.
//  Copyright © 2016年 YunEEC. All rights reserved.
//

#import "ViewController.h"

#import "Person.h"
#import <objc/runtime.h>
#import <objc/message.h>
#import "Person+YLGPerson.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self testRuntime];
}

/*!
 *  @author YunEEC, 16-05-26 09:05:21
 *
 *  测试函数
 */
- (void)testRuntime {
    Person  *testP = [Person new];
    testP.name = @"GavinYu";
    testP.age = @"18";
    
    //测试获取对象的所有的属性名称
    size_t size = class_getInstanceSize(testP.class);
    NSLog(@"size:%ld",size);
    for (NSString *item in testP.allProperties) {
        NSLog(@"property:%@", item);
    }
    
    //测试获取对象所有的属性名称及其对应的属性值
    NSDictionary *dict = testP.allPropertyNamesAndValues;
    for (NSString *propertyName in dict.allKeys) {
        NSLog(@"propertyName: %@ propertyValue: %@", propertyName, dict[propertyName]);
    }
    
    //测试获取对象的所有的方法名称
    [testP allMethods];
    
    //测试获取对象的所有的成员变量名称
    for (NSString *varName in testP.allMemberVariables) {
        NSLog(@"成员变量名称：%@", varName);
    }
    
    //测试运行时发送消息
    objc_msgSend(testP, @selector(allMethods));
    
//    objc_msgSend(testP, @selector(age));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
