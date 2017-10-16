//
//  Clothes+CoreDataProperties.m
//  CoreDataNote
//
//  Created by taitanxiami on 2017/10/15.
//  Copyright © 2017年 taitanxiami. All rights reserved.
//
//

#import "Clothes+CoreDataProperties.h"

@implementation Clothes (CoreDataProperties)

+ (NSFetchRequest<Clothes *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Clothes"];
}

@dynamic name;
@dynamic price;

@end
