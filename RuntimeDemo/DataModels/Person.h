//
//  Person.h
//  RuntimeDemo
//
//  Created by yc-sh-vr-pc05 on 16/5/26.
//  Copyright © 2016年 YunEEC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    NSString *_variableString;
}

@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSMutableArray *array;

/*!
 *  @author YunEEC, 16-05-26 09:05:02
 *
 *  获取对象所有的属性名
 *
 *  @return 属性数组
 */
- (NSArray *)allProperties;
/*!
 *  @author YunEEC, 16-05-26 09:05:32
 *
 *  获取对象的所有属性名及其对应的属性值
 *
 *  @return 属性名及其对应的属性值字典
 */
- (NSDictionary *)allPropertyNamesAndValues;
/*!
 *  @author YunEEC, 16-05-26 10:05:03
 *
 *  获取对象的所有方法名
 *
 *  @return
 */
- (void)allMethods;
/*!
 *  @author YunEEC, 16-05-26 10:05:41
 *
 *  获取对象的所有成员变量名称
 *
 *  @return 存储所有成员变量名称数组
 */
- (NSArray *)allMemberVariables;
@end
