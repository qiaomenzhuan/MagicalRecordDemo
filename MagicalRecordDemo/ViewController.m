//
//  ViewController.m
//  MagicalRecordDemo
//
//  Created by 杨磊 on 2018/7/12.
//  Copyright © 2018年 csda_Chinadance. All rights reserved.
//

#import "ViewController.h"
#import <MagicalRecord/MagicalRecord.h>
#import "StudyModel+CoreDataClass.h"
#import "StudyModel+CoreDataProperties.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}


/**
 增加一条数据
 */
- (IBAction)add:(id)sender {
    
    StudyModel *student = [StudyModel MR_createEntity];//新建一条记录
    student.name = @"张三";
    student.age  = arc4random()%100 + 1;
    
    StudyModel *student2 = [StudyModel MR_createEntity];//新建一条记录
    student2.name = @"李四";
    student2.age  = 18;
    
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];//保存数据
}

/**
 删除数据
 */

- (IBAction)delete:(id)sender
{
    //1.根据某些条件删除数据
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name=%@ && age=%d",@"张三",18];//多条件谓词查询
    NSArray *dataArr = [StudyModel MR_findAllSortedBy:@"age" ascending:YES withPredicate:predicate];//按照年龄大小排序
    for (StudyModel *student in dataArr)
    {
        [student MR_deleteEntity];//删除
    }
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];//保存数据
    
    //删除一张表中所有的数据
    [StudyModel MR_truncateAll];
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
}

/**
 改变一条数据
 */
- (IBAction)change:(id)sender
{
    //根据条件查询出内容然后修改
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name=%@",@"张三",18];//多条件谓词查询
    NSArray *dataArr = [StudyModel MR_findAllSortedBy:@"age" ascending:YES withPredicate:predicate];//按照年龄大小排序
    for (StudyModel *student in dataArr)
    {
        student.age = 119;//修改数据
    }
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];//保存数据
}

/**
 查询一条数据
 */
- (IBAction)find:(id)sender
{
    //1.谓词多条件查询 实际应用中用的最多的就是这种 给几个变量 然后查出来符合条件的model排序给一个model数组
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name=%@ && age=%d",@"李四",18];//多条件谓词查询
    NSArray *dataArr = [StudyModel MR_findAllSortedBy:@"age" ascending:YES withPredicate:predicate];//按照年龄大小排序
    for (StudyModel *student in dataArr)
    {
        NSLog(@"%@ %lld",student.name,student.age);
    }
    
    //2.根据某一条件查询
    NSArray *dataArr2 = [StudyModel MR_findByAttribute:@"name" withValue:@"李四"];
    for (StudyModel *student in dataArr2)
    {
        NSLog(@"dataArr2%@ %lld",student.name,student.age);
    }
    
    //这张表中所有的数据
    NSArray *dataArr3 = [StudyModel MR_findAll];
    for (StudyModel *student in dataArr3)
    {
        NSLog(@"dataArr3%@ %lld",student.name,student.age);
    }
    
    //还有很多查询方法 可以自己摸索
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
