//
//  SqViewController.m
//  uidemo
//
//  Created by qingqing on 16/3/28.
//  Copyright © 2016年 qingqing. All rights reserved.
//

#import "SqViewController.h"
#import <CoreData/CoreData.h>
#import "Person.h"
#import "Card.h"

@interface SqViewController ()

@end

@implementation SqViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    if(sqlite3_open([[self getDBPath] UTF8String], &db) != SQLITE_OK) {
//        sqlite3_close(db);
//    }
//    
//    char *errmsg;
//    const char *createsql = "CREATE TABLE IF NOT EXISTS INFO (ID INTEGER PRIMARY KEY AUTOINCREMENT, NUM TEXT, CLASSNAME TEXT,NAME TEXT)";
//    if (sqlite3_exec(db, createsql, NULL, NULL, &errmsg)!=SQLITE_OK) {
//        NSLog(@"create table failed.b");
//    }
    
    
    NSManagedObjectModel *model = [NSManagedObjectModel mergedModelFromBundles:nil];
    
    NSPersistentStoreCoordinator *psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];
    
    
    NSPersistentStore *store = [psc addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:[NSURL fileURLWithPath:[self getDBPath]] options:nil error:nil];
    
    if(store == nil){
        NSLog(@">>>>>>>>>>...fail");
    }
    
    NSManagedObjectContext *context = [[NSManagedObjectContext alloc] init];
    context.persistentStoreCoordinator = psc;
    
    
//    NSManagedObject *person = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:context];
//    [person setValue:@"MJ" forKey:@"name"];
//    [person setValue:[NSNumber numberWithInt:27] forKey:@"age"];
//    
//    NSManagedObject *card = [NSEntityDescription insertNewObjectForEntityForName:@"Card" inManagedObjectContext:context];
//    [card setValue:@"4414241933432" forKey:@"no"];
//    
//    
//    [person setValue:card forKey:@"card"];
//    
//    BOOL success = [context save:nil];
//    NSLog(@">>>>>>>>>>success %d", success);
    
    
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Person"];
    
    NSArray *arr = [context executeFetchRequest:request error:nil];
    NSLog(@"arr %@", arr);
    for(Person *p in arr){
        NSLog(@">>>>>>>>>>name %@ age %d", p.name, p.age.intValue);
    }
}

- (NSString *)getDBPath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documents = [paths objectAtIndex:0];
    NSString *database_path = [documents stringByAppendingPathComponent:@"test_db.data"];
    return database_path;
}

@end
