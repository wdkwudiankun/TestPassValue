//
//  DataSource.m
//  TestPassValue
//
//  Created by DiankunWu on 16/4/25.
//  Copyright © 2016年 DiankunWu. All rights reserved.
//

#import "DataSource.h"

@implementation DataSource

+(DataSource *)shareDataSource{

    static DataSource *dataSource = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        dataSource = [DataSource new];
    });
    return dataSource;
}
@end
