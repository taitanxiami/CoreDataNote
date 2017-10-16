//
//  AppDelegate.h
//  CoreDataNote
//
//  Created by taitanxiami on 2017/10/15.
//  Copyright © 2017年 taitanxiami. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

// 被管理对象上下文（数据管理器）相当于一个临时数据库
//@property (strong, nonatomic) NSManagedObjectContext *managerObjecrContext;

// 对象模型
//@property (strong, nonatomic) NSManagedObjectModel *managerObejectModel;
//数据持久助理（数据链接器）
@property (readonly, strong) NSPersistentContainer *persistentContainer;


//将临时数据库的数据变化永久保存
- (void)saveContext;


@end

