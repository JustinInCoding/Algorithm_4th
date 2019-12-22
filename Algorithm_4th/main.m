//
//  main.m
//  Algorithm_4th
//
//  Created by 王晟骏 on 2019/12/21.
//  Copyright © 2019 justin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ABCSort.h"
#import "ABCSeek.h"
#import "ABCSeekSubString.h"

void testSort() {

//	NSMutableArray *array = [@[@(2), @(6), @(1), @(3), @(7)] mutableCopy];
//	ABCSort *sort = [[ABCSort alloc] init];
//	[sort partitionSort:array];
//	assert([sort isSorted:array]);
//	[sort show:array];

//	ABCSeek *seek = [[ABCSeek alloc] init];
//	int index = [seek normalSeek:3 iniArray:array];
//	NSLog(@"find index = %d", index);

	ABCSeekSubString *seekSubString = [[ABCSeekSubString alloc] init];
	int textIndex = [seekSubString search2:@"AAB" inText:@"AAAAAAB"];
	NSLog(@"txt index = %d", textIndex);

}

int main(int argc, const char * argv[]) {
	@autoreleasepool {

		testSort();

	}
	return 0;
}


