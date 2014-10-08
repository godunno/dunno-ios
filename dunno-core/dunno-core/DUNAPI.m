//
//  DUNAPI.m
//  dunno-ipad
//
//  Created by Wanderley Miyata on 8/28/14.
//  Copyright (c) 2014 BlueScreen Sistemas. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
#import "DUNAPI.h"
#import "DUNStudent.h"

@implementation DUNAPI

+ (instancetype) sharedInstance
{
    static dispatch_once_t p = 0;
    __strong static DUNAPI *sharedObject = nil;
    dispatch_once(&p, ^{
        sharedObject = [[self alloc] init];
    });
    return sharedObject;
}

- (void) loginUserWithEmail:(NSString*)email password:(NSString*)password success:(void(^)(DUNUser *user))successBlock error:(void(^)(NSError *error))errorBlock {
    
    NSParameterAssert(email!=nil);
    NSParameterAssert(password!=nil);
 
    NSString *endpoint = API_LOGIN;
 
    NSDictionary *params = @{@"user[email]":email, @"user[password]":password};
 
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager setResponseSerializer:[AFJSONResponseSerializer serializer]];
    
    [manager POST:endpoint parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
 
        NSError *error = nil;
        DUNUser *user = [MTLJSONAdapter modelOfClass:DUNUser.class fromJSONDictionary:responseObject error:&error];
 
        if(!error)
            successBlock(user);
        else
            errorBlock(error);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        errorBlock(error);
    }];
}

- (void)logoutUserWithToken:(NSString*)token success:(void(^)(void))successBlock error:(void(^)(NSError *error))errorBlock {
    NSString *endpoint = API_LOGOUT;
    
    //NSDictionary *params = @{@"_method":@"delete", @"authenticity_token":token};
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager setResponseSerializer:[AFJSONResponseSerializer serializer]];
    
    [manager DELETE:endpoint parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSError *error = nil;
        
        if(!error)
            successBlock();
        else
            errorBlock(error);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        errorBlock(error);
    }];
    
}

- (void) loadTeacherCoursesWithSuccess:(void(^)(NSMutableArray *results))successBlock error:(void(^)(NSError *error))errorBlock {
    NSString *endpoint = API_TEACHER_COURSES;
    
    //NSDictionary *params = @{@"teacher[email]":username, @"teacher[password]":password};
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager setResponseSerializer:[AFJSONResponseSerializer serializer]];
    
    [manager GET:endpoint parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSError *error;
        NSArray *results = [MTLJSONAdapter modelsOfClass:DUNCourse.class fromJSONArray:(NSArray*)responseObject error:&error];
        //KMMessage *message = [MTLJSONAdapter modelOfClass:KMMessage.class fromJSONDictionary:(NSDictionary*)responseObject error:&error];
        
        if (!error)
            successBlock([NSMutableArray arrayWithArray:results]);
        else
            errorBlock(error);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        errorBlock(error);
    }];
}
- (void) loadTeacherEventsWithSuccess:(void(^)(NSMutableArray *results))successBlock error:(void(^)(NSError *error))errorBlock {
    NSString *endpoint = API_TEACHER_EVENTS;
    
    //NSDictionary *params = @{@"teacher[email]":username, @"teacher[password]":password};
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager setResponseSerializer:[AFJSONResponseSerializer serializer]];
    
    [manager GET:endpoint parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"%@", responseObject);
        
        NSError *error;
        NSArray *results = [MTLJSONAdapter modelsOfClass:DUNEvent.class fromJSONArray:(NSArray*)responseObject error:&error];
        //KMMessage *message = [MTLJSONAdapter modelOfClass:KMMessage.class fromJSONDictionary:(NSDictionary*)responseObject error:&error];
        
        if (!error)
            successBlock([NSMutableArray arrayWithArray:results]);
        else
            errorBlock(error);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        errorBlock(error);
    }];
}

- (void)loadTeacherCourseWithUuid:(NSString*)uuid success:(void(^)(DUNCourse *result))successBlock error:(void(^)(NSError *error))errorBlock {
    
    NSString *endpoint = [NSString stringWithFormat:@"%@/%@", API_TEACHER_COURSES, uuid];
    
    //NSDictionary *params = @{@"teacher[email]":username, @"teacher[password]":password};
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager setResponseSerializer:[AFJSONResponseSerializer serializer]];
    
    [manager GET:endpoint parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"%@", responseObject);
        
        NSError *error;
        NSDictionary *jsonDictionary = (NSDictionary*)responseObject;
        DUNCourse *result = [MTLJSONAdapter modelOfClass:DUNCourse.class fromJSONDictionary:[jsonDictionary objectForKey:@"course"] error:&error];
        //DUNCourse *result = [MTLJSONAdapter modelsOfClass:DUNCourse.class fromJSONArray:(NSArray*)responseObject error:&error];
        //KMMessage *message = [MTLJSONAdapter modelOfClass:KMMessage.class fromJSONDictionary:(NSDictionary*)responseObject error:&error];
        
        if (!error)
            successBlock(result);
        else
            errorBlock(error);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        errorBlock(error);
    }];
}
- (void)loadTeacherEventWithUuid:(NSString*)uuid success:(void(^)(DUNEvent *result))successBlock error:(void(^)(NSError *error))errorBlock {
    
    NSString *endpoint = [NSString stringWithFormat:@"%@/%@", API_TEACHER_EVENTS, uuid];
    
    //NSDictionary *params = @{@"teacher[email]":username, @"teacher[password]":password};
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager setResponseSerializer:[AFJSONResponseSerializer serializer]];
    
    [manager GET:endpoint parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        //NSLog(@"%@", responseObject);
        
        NSError *error;
        //NSDictionary *jsonDictionary = (NSDictionary*)responseObject;
        DUNEvent *result = [MTLJSONAdapter modelOfClass:DUNEvent.class fromJSONDictionary:responseObject error:&error];
        //DUNCourse *result = [MTLJSONAdapter modelsOfClass:DUNCourse.class fromJSONArray:(NSArray*)responseObject error:&error];
        //KMMessage *message = [MTLJSONAdapter modelOfClass:KMMessage.class fromJSONDictionary:(NSDictionary*)responseObject error:&error];
        
        if (!error)
            successBlock(result);
        else
            errorBlock(error);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        errorBlock(error);
    }];
}

- (void)loadTeacherCourseStudentsWithUuid:(NSString*)uuid success:(void(^)(NSMutableArray*results))successBlock error:(void(^)(NSError *error))errorBlock {
    NSString *endpoint = [NSString stringWithFormat:API_TEACHER_COURSE_STUDENTS, uuid];
    
    //NSDictionary *params = @{@"teacher[email]":username, @"teacher[password]":password};
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager setResponseSerializer:[AFJSONResponseSerializer serializer]];
    
    //NSError *authError = [[NSError alloc] initWithDomain:@"Kantoo" code:999 userInfo:@{NSLocalizedDescriptionKey: @"Senha Inválida. Por favor, tente novamente."}];
    
    [manager GET:endpoint parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"%@", responseObject);
        
        NSError *error;
        NSArray *results = [MTLJSONAdapter modelsOfClass:DUNStudent.class fromJSONArray:(NSArray*)responseObject error:&error];
        //KMMessage *message = [MTLJSONAdapter modelOfClass:KMMessage.class fromJSONDictionary:(NSDictionary*)responseObject error:&error];
        
        if (!error)
            successBlock([NSMutableArray arrayWithArray:results]);
        else
            errorBlock(error);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        errorBlock(error);
    }];

}


- (void)getListWithUrl:(NSString*)url class:(Class)objectClass success:(void(^)(NSArray *resultList))successBlock error:(void(^)(NSError *error))errorBlock {
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager setResponseSerializer:[AFJSONResponseSerializer serializer]];
    
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSError *error;
        NSArray *resultList = [MTLJSONAdapter modelsOfClass:objectClass fromJSONArray:responseObject error:&error];
        
        if (!error)
            successBlock(resultList);
        else {
            errorBlock(error);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        errorBlock(error);
    }];
}

- (void)getObjectWithUrl:(NSString*)url class:(Class)objectClass success:(void(^)(id result))successBlock error:(void(^)(NSError *error))errorBlock {
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager setResponseSerializer:[AFJSONResponseSerializer serializer]];
    
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSError *error;
        id result = [MTLJSONAdapter modelOfClass:objectClass fromJSONDictionary:responseObject error:&error];
        
        if (!error)
            successBlock(result);
        else {
            errorBlock(error);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        errorBlock(error);
    }];
}

@end
