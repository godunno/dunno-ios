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
  return @{@"id" : @"123", @"name": @"xxx", @"description": @"xxx", @"picture": @"xx123.png", @"start_at": @"2012-02-14T12:01:41Z", @"finish_at": @"2012-02-14T16:01:41Z", @"speakers":@[@{@"uid":@"123", @"name": @"xxx", @"picture": @"xxx.png"}], @"owner":@{@"id":@"6669",@"name":@"gildo"},@"location":@{@"id" : @"555"},@"organization":@{@"id":@"888",@"name":@"acme"}};
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
  assertThat(event.entityId, is(equalTo(@"123")));
}

- (void)testIfMappingPictureKeyToPictureURLStringProperty
{
  DUNEvent *event = [DUNEvent newFromJsonDictionary:validJsonDictionary()];
  
  assertThat(event.pictureURLString, is(notNilValue()));
  assertThat(event.pictureURLString, is(equalTo(@"xx123.png")));
}


- (void)testIfMappingDescriptionKeyToShortDescriptionProperty
{
  DUNEvent *event = [DUNEvent newFromJsonDictionary:validJsonDictionary()];
  
  assertThat(event.shortDescription, is(notNilValue()));
  assertThat(event.shortDescription, is(equalTo(@"xxx")));
}


- (void)testIfMappingSpeakersAssociationAndItHasOneAtLeast
{
  DUNEvent *event = [DUNEvent newFromJsonDictionary:validJsonDictionary()];
  assertThat(event.speakers[0], is(notNilValue()));
  assertThat(((DUNSpeaker*)[event.speakers objectAtIndex:0]).entityId, is(notNilValue()));
  assertThat(((DUNSpeaker*)[event.speakers objectAtIndex:0]).entityId, is(equalTo(@"123")));
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
  assertThat(event.location.entityId, is(
                                         equalTo(@"555")));
  assertThat(event.speakers, is(notNilValue()));
  assertThat(event.speakers[0], is(notNilValue()));
  assertThat(event.owner, is(notNilValue()));
  assertThat(event.owner.entityId, is(
                                      equalTo(@"6669")));
  assertThat(event.organization, is(notNilValue()));
  assertThat(event.organization.entityId, is(
                                             equalTo(@"888")));
}

@end
