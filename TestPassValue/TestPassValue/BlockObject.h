//
//  BlockObject.h
//  TestPassValue
//
//  Created by DiankunWu on 16/4/25.
//  Copyright © 2016年 DiankunWu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^switchColor)(UIColor *newColor);
@interface BlockObject : NSObject

+(void)switchButtonColor:(switchColor)switchColor;

@end
