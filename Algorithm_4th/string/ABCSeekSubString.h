//
//  ABCSeekSubString.h
//  Algorithm_4th
//
//  Created by 王晟骏 on 2019/12/22.
//  Copyright © 2019 justin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ABCSeekSubString : NSObject

- (int)search1:(NSString *)patternStr inText:(NSString *)text;
- (int)search2:(NSString *)patternStr inText:(NSString *)text;

@end

NS_ASSUME_NONNULL_END
