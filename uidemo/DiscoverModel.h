//
//  DiscoverModel.h
//  uidemo
//
//  Created by qingqing on 16/2/16.
//  Copyright © 2016年 qingqing. All rights reserved.
//

#import "JSONModel/JSONModel.h"

@interface UserInfoModel : JSONModel

@property (strong, nonatomic) NSString *photo;
@property (strong, nonatomic) NSString *nn;
@property (assign, nonatomic) int sex;

@end

@protocol PhotoModel
@end

@interface PhotoModel : JSONModel

@property (assign, nonatomic) int width;
@property (assign, nonatomic) int heigh;

@property (strong, nonatomic) NSString *url;

@end

@protocol ContextModel
@end

@interface ContextModel : JSONModel

@property (strong, nonatomic) NSString *blogid;
@property (strong, nonatomic) NSString *siteid;
@property (assign, nonatomic) int srctype;
@property (strong, nonatomic) NSString<Optional> *title;
@property (strong, nonatomic) NSString<Optional> *pic;

@property (strong, nonatomic) NSArray<PhotoModel, Optional> *photo;

@property (strong, nonatomic) UserInfoModel *userinfo;

@end

@interface DiscoverModel : JSONModel

@property (strong, nonatomic) NSArray<ContextModel> *context;

@end
