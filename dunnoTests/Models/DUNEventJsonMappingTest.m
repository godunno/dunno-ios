//
//  DUNEventTest.m
//  dunno
//
//  Created by fagner feitosa on 1/16/14.
//  Copyright (c) 2014 dunno. All rights reserved.
//

#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <XCTest/XCTest.h>

#import "DUNEvent.h"

static NSDictionary *validJsonDictionary() {
  return @{@"id" : @"123", @"name": @"xxx", @"description": @"xxx", @"picture": @"http://www.s3.com/xx123.png", @"start_at": @"2012-02-14T12:01:41Z", @"finish_at": @"2012-02-14T16:01:41Z", @"speakers":@[@{@"uid":@"123", @"name": @"xxx", @"picture": @"xxx.png"}], @"owner":@{@"id":@"666",@"name":@"gildo"},@"location":@{},@"organization":@{@"id":@"666",@"name":@"acme"}};
}

@interface DUNEventJsonMappingTest : XCTestCase
@end

@implementation DUNEventJsonMappingTest

- (void)testFailTryMappingNewInstanceWithNilJsonDictionary
{
  assertThat([DUNEvent newFromJsonDictionary:nil], is(nilValue()));
}

- (void)testIfMappingIdKeyToEntityIdProperty
{
  DUNEvent *event = [DUNEvent newFromJsonDictionary:validJsonDictionary()];
  
  assertThat(event.entityId, is(notNilValue()));
  assertThat(event.entityId, isNot(isEmpty()));
}

- (void)testIfMappingPictureKeyToPictureURLStringProperty
{
  DUNEvent *event = [DUNEvent newFromJsonDictionary:validJsonDictionary()];
  
  assertThat(event.pictureURLString, is(notNilValue()));
  assertThat(event.pictureURLString, isNot(isEmpty()));
}


- (void)testIfMappingDescriptionKeyToShortDescriptionProperty
{
  DUNEvent *event = [DUNEvent newFromJsonDictionary:validJsonDictionary()];
  
  assertThat(event.shortDescription, is(notNilValue()));
  assertThat(event.shortDescription, isNot(isEmpty()));
}


- (void)testIfMappingSpeakersAssociationAndItHasOneAtLeast
{
  DUNEvent *event = [DUNEvent newFromJsonDictionary:validJsonDictionary()];
  assertThat(event.speakers[0], is(notNilValue()));
}

- (void)testIfMappingAllPropertiesFromJsonDictionary
{
  DUNEvent *event = [DUNEvent newFromJsonDictionary:validJsonDictionary()];
  
  assertThat(event.entityId, is(notNilValue()));
  assertThat(event.name, is(notNilValue()));
  assertThat(event.shortDescription, is(notNilValue()));
  assertThat(event.startAt, is(notNilValue()));
  assertThat(event.finishAt, is(notNilValue()));
  assertThat(event.pictureURLString, is(notNilValue()));

  assertThat(event.location, is(notNilValue()));
  assertThat(event.speakers, is(notNilValue()));
  assertThat(event.owner, is(notNilValue()));
  assertThat(event.organization, is(notNilValue()));
  
}

@end
