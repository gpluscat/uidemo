//
//  Card+CoreDataProperties.h
//  uidemo
//
//  Created by qingqing on 16/3/28.
//  Copyright © 2016年 qingqing. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Card.h"

NS_ASSUME_NONNULL_BEGIN

@interface Card (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *no;
@property (nullable, nonatomic, retain) Person *person;

@end

NS_ASSUME_NONNULL_END
