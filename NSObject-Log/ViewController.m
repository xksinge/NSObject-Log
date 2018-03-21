//
//  ViewController.m
//  NSObject-Log
//
//  Created by 熊坤 on 2018/3/20.
//  Copyright © 2018年 xk. All rights reserved.
//

#import "ViewController.h"
#import "NSPerson.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSPerson *person = NSPerson.new;
    person.name = @"哈哈";
    person.age = 4;
    person.sex = nil;
    person.isNO = YES;
    person.iconArray = @[@"NS"];
    person.dict = @{@"xx":@(1)};
    person.number = @(1);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
