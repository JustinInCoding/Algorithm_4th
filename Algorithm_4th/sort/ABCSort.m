//
//  ABCSort.m
//  Algorithm_4th
//
//  Created by 王晟骏 on 2019/12/21.
//  Copyright © 2019 justin. All rights reserved.
//

#import "ABCSort.h"

@implementation ABCSort

- (void)selectionSort:(NSMutableArray *)array {
	if (!array || array.count <= 1) return;
	NSUInteger n = array.count;
	for (int i = 0; i < n; ++i) {
		int min = i;
		for (int j = i + 1; j < n; ++j)
			if ([self less:[array[j] intValue] andB:[array[min] intValue]]) min = j;
		[self exchangeInArray:array ofIndex:i toIndex:min];
	}
}

- (BOOL)less:(int)a andB:(int)b {
	return a < b;
}

- (void)exchangeInArray:(NSMutableArray *)arr ofIndex:(int)i toIndex:(int)j {
	int tmp = [arr[i] intValue];
	arr[i] = arr[j];
	arr[j] = @(tmp);
}

- (void)show:(NSArray *)array {
	NSMutableString *log = [NSMutableString stringWithString:@""];
	for (int i = 0; i < array.count; ++i)
		[log appendFormat:@"%@ ", [array[i] stringValue]];
	NSLog(@"%@", log);
}

- (BOOL)isSorted:(NSArray *)arr {
	for (int i = 1; i < arr.count; ++i)
		if ([self less:[arr[i] intValue] andB:[arr[i - 1] intValue]]) return NO;
	return YES;
}

@end
