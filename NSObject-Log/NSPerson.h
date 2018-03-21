//
//  Person.h
//  NSObject-Log
//
//  Created by 熊坤 on 2018/3/20.
//  Copyright © 2018年 xk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSPerson : NSObject

@property (nonatomic , copy) NSString * name;
@property (nonatomic , assign) NSInteger age;
@property (nonatomic , copy) NSString * sex;
@property (nonatomic , copy) NSArray *iconArray;
@property (nonatomic , strong) NSDictionary *dict;
@property (nonatomic , assign) BOOL isNO;
@property (nonatomic , strong) NSNumber *number;
@property (nonatomic , strong) NSData *data;


@end
