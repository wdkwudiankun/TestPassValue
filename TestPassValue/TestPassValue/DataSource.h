//
//  DataSource.h
//  TestPassValue
//
//  Created by DiankunWu on 16/4/25.
//  Copyright © 2016年 DiankunWu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataSource : NSObject

@property (nonatomic,strong) NSString *myname;
+(DataSource *)shareDataSource;
@end
