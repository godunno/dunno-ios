//
//  DUNSpeakerJsonMappingTest.m
//  dunno
//
//  Created by fagner feitosa on 1/17/14.
//  Copyright (c) 2014 dunno. All rights reserved.
//


#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <XCTest/XCTest.h>

#import "DUNSpeaker.h"

static NSDictionary *validJsonDictionary() {
  return @{@"uid":@"123", @"name": @"xxx", @"pictureURLString": @"xxx.png",@"bio": @"jedi master"};
}

@interface DUNSpeakerJsonMappingTest : XCTestCase
@end

@implementation DUNSpeakerJsonMappingTest

- (void)testIfMappingIdKeyToEntityIdProperty
{
  DUNSpeaker *speaker = [DUNSpeaker newFromJsonDictionary:validJsonDictionary()];
  
  assertThat(speaker.entityId, is(notNilValue()));
  assertThat(speaker.entityId, is(equalTo(@"123")));
}

- (void)testIfMappingPictureKeyToPictureURLStringProperty
{
  DUNSpeaker *speaker = [DUNSpeaker newFromJsonDictionary:validJsonDictionary()];
  
  assertThat(speaker.pictureURLString, is(notNilValue()));
  assertThat(speaker.pictureURLString, is(equalTo(@"xxx.png")));
}

- (void)testIfMappingAllPropertiesFromJsonDictionary
{
  DUNSpeaker *speaker = [DUNSpeaker newFromJsonDictionary:validJsonDictionary()];
  
  assertThat(speaker.entityId, is(notNilValue()));
  assertThat(speaker.name, is(notNilValue()));
  assertThat(speaker.bio, is(notNilValue()));
  assertThat(speaker.pictureURLString, is(notNilValue()));
}


@end
