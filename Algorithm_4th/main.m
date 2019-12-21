//
//  main.m
//  Algorithm_4th
//
//  Created by 王晟骏 on 2019/12/21.
//  Copyright © 2019 justin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ABCSort.h"

void testSort() {

	NSMutableArray *array = [@[@(2), @(6), @(1), @(3), @(7)] mutableCopy];
	ABCSort *sort = [[ABCSort alloc] init];
	[sort selectionSort:array];
	assert([sort isSorted:array]);
	[sort show:array];

}

int main(int argc, const char * argv[]) {
	@autoreleasepool {

		testSort();

	}
	return 0;
}


