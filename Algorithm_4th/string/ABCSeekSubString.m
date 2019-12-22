//
//  ABCSeekSubString.m
//  Algorithm_4th
//
//  Created by 王晟骏 on 2019/12/22.
//  Copyright © 2019 justin. All rights reserved.
//

#import "ABCSeekSubString.h"

@implementation ABCSeekSubString

- (int)search1:(NSString *)patternStr inText:(NSString *)text {

	int M = (int)(patternStr.length);
	int N = (int)(text.length);

	for (int i = 0; i < N - M; ++i) {
		int j;
		for (j = 0; j < M; ++j) {
			if ([patternStr characterAtIndex:j] != [text characterAtIndex:i + j]) {
				break;
			}
		}
		if (j == M) {
			return i;
		}
	}
	return -1;
}

- (int)search2:(NSString *)patternStr inText:(NSString *)text {

	int M = (int)(patternStr.length);
	int N = (int)(text.length);

	int i, j;

	for (i = 0, j = 0; i < N && j < M; ++i) {
		if ([patternStr characterAtIndex:j] == [text characterAtIndex:i]) {
			j++;
		} else {
			i = i - j;
			j = 0;
		}
	}

	if (j == M) {
		return i - M;
	} else {
		return -1;
	}

}

@end
