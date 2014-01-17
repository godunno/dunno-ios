//
//  DUNUserJsonMappingTest.m
//  dunno
//
//  Created by fagner feitosa on 1/17/14.
//  Copyright (c) 2014 dunno. All rights reserved.
//
#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <XCTest/XCTest.h>

#import "DUNUser.h"

static NSDictionary *validJsonDictionary() {
  return @{@"id":@"666",@"name":@"gildo",@"picture": @"xxx.png",@"email": @"fag@gmail.com"};
}


@interface DUNUserJsonMappingTest : XCTestCase
@end

@implementation DUNUserJsonMappingTest

- (void)testIfMappingIdKeyToEntityIdProperty
{
  DUNUser *user = [DUNUser newFromJsonDictionary:validJsonDictionary()];
  
  assertThat(user.entityId, is(notNilValue()));
  assertThat(user.entityId, is(equalTo(@"666")));
}

- (void)testIfMappingPictureKeyToPictureURLStringProperty
{
  DUNUser *user = [DUNUser newFromJsonDictionary:validJsonDictionary()];
  
  assertThat(user.pictureURLString, is(notNilValue()));
  assertThat(user.pictureURLString, is(equalTo(@"xxx.png")));
}

- (void)testIfMappingAllPropertiesFromJsonDictionary
{
  DUNUser *user = [DUNUser newFromJsonDictionary:validJsonDictionary()];
  
  assertThat(user.entityId, is(notNilValue()));
  assertThat(user.name, is(notNilValue()));
  assertThat(user.email, is(notNilValue()));
  assertThat(user.pictureURLString, is(notNilValue()));
}


@end
