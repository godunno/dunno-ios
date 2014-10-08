//
//  DUNAPI.h
//  dunno-ipad
//
//  Created by Wanderley Miyata on 8/28/14.
//  Copyright (c) 2014 BlueScreen Sistemas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DUNUser.h"
#import "DUNCourse.h"
#import "DUNEvent.h"

#define API_SERVER  @"http://staging.dunno.vc/api/v1"
#define API_LOGIN   API_SERVER @"/users/sign_in.json"
#define API_LOGOUT  API_SERVER @"/users/sign_out"

#define API_TEACHER_COURSES API_SERVER @"/teacher/courses"
#define API_TEACHER_EVENTS API_SERVER @"/teacher/events"
#define API_TEACHER_COURSE_STUDENTS API_SERVER @"/teacher/courses/%@/students.json"

//#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface DUNAPI : NSObject

+ (instancetype) sharedInstance;

- (void) loginUserWithEmail:(NSString*)email password:(NSString*)password success:(void(^)(DUNUser *user))successBlock error:(void(^)(NSError *error))errorBlock;

- (void)logoutUserWithToken:(NSString*)token success:(void(^)(void))successBlock error:(void(^)(NSError *error))errorBlock;

- (void)loadTeacherCoursesWithSuccess:(void(^)(NSMutableArray *results))successBlock error:(void(^)(NSError *error))errorBlock;
- (void)loadTeacherCourseWithUuid:(NSString*)uuid success:(void(^)(DUNCourse *result))successBlock error:(void(^)(NSError *error))errorBlock;
- (void)loadTeacherEventsWithSuccess:(void(^)(NSMutableArray *results))successBlock error:(void(^)(NSError *error))errorBlock;
- (void)loadTeacherEventWithUuid:(NSString*)uuid success:(void(^)(DUNEvent *result))successBlock error:(void(^)(NSError *error))errorBlock;

- (void)loadTeacherCourseStudentsWithUuid:(NSString*)uuid success:(void(^)(NSMutableArray*results))successBlock error:(void(^)(NSError *error))errorBlock;

@end
