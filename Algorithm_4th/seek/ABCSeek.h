//
//  ABCSeek.h
//  Algorithm_4th
//
//  Created by 王晟骏 on 2019/12/22.
//  Copyright © 2019 justin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ABCSeek : NSObject

- (int)normalSeek:(int)key iniArray:(NSArray *)array;
- (int)binerySeek:(int)key inArray:(NSArray *)array;

@end

NS_ASSUME_NONNULL_END
