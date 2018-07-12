//
//  StudyModel+CoreDataProperties.h
//  MagicalRecordDemo
//
//  Created by 杨磊 on 2018/7/12.
//  Copyright © 2018年 csda_Chinadance. All rights reserved.
//
//

#import "StudyModel+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface StudyModel (CoreDataProperties)

+ (NSFetchRequest<StudyModel *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nonatomic) int64_t age;

@end

NS_ASSUME_NONNULL_END
