//
//  ABCSeek.m
//  Algorithm_4th
//
//  Created by 王晟骏 on 2019/12/22.
//  Copyright © 2019 justin. All rights reserved.
//

#import "ABCSeek.h"

@implementation ABCSeek

- (int)binerySeek:(int)key inArray:(NSArray *)array {
	int low = 0;
	int high = (int) (array.count - 1);
	int mid = 0;
	while (low <= high) {
		mid = low + (high - low) / 2;
		if ([array[mid] intValue] < key) {
			low = mid + 1;
		} else if ([array[mid] intValue] > key) {
			high = mid - 1;
		} else {
			return mid;
		}
	}
	return -1;
}

- (int)normalSeek:(int)key iniArray:(NSArray *)array {
	for (int i = 0; i < array.count; ++i) {
		if ([array[i] intValue] == key) {
			return i;
		}
	}
	return -1;
}

@end
