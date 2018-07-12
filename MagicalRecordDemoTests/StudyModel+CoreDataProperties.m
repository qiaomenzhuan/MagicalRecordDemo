//
//  StudyModel+CoreDataProperties.m
//  MagicalRecordDemo
//
//  Created by 杨磊 on 2018/7/12.
//  Copyright © 2018年 csda_Chinadance. All rights reserved.
//
//

#import "StudyModel+CoreDataProperties.h"

@implementation StudyModel (CoreDataProperties)

+ (NSFetchRequest<StudyModel *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"StudyModel"];
}

@dynamic name;
@dynamic age;

@end
