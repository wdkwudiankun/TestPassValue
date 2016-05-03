//
//  SecondViewController.h
//  TestPassValue
//
//  Created by DiankunWu on 16/4/25.
//  Copyright © 2016年 DiankunWu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^Block)(NSString *str);
@protocol secondDelegate <NSObject>

-(void)showName:(NSString *)nameStr;

@end

@interface SecondViewController : UIViewController

@property (nonatomic,weak) id<secondDelegate> delegate;

@property (nonatomic,copy) Block block;

@end
