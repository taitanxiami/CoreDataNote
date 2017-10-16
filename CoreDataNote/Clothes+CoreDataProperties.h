//
//  Clothes+CoreDataProperties.h
//  CoreDataNote
//
//  Created by taitanxiami on 2017/10/15.
//  Copyright © 2017年 taitanxiami. All rights reserved.
//
//

#import "Clothes+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Clothes (CoreDataProperties)

+ (NSFetchRequest<Clothes *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nonatomic) int64_t price;

@end

NS_ASSUME_NONNULL_END
