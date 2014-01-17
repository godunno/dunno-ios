//
//  DUNOrganizationJsonMappingTest.m
//  dunno
//
//  Created by fagner feitosa on 1/17/14.
//  Copyright (c) 2014 dunno. All rights reserved.
//

#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <XCTest/XCTest.h>

#import "DUNOrganization.h"

static NSDictionary *validJsonDictionary() {
  return @{@"id":@"666",@"name":@"gildo",@"picture": @"xxx.png"};
}

@interface DUNOrganizationJsonMappingTest : XCTestCase
@end

@implementation DUNOrganizationJsonMappingTest

- (void)testIfMappingIdKeyToEntityIdProperty
{
  DUNOrganization *organization = [DUNOrganization newFromJsonDictionary:validJsonDictionary()];
  
  assertThat(organization.entityId, is(notNilValue()));
  assertThat(organization.entityId, is(equalTo(@"666")));
}

- (void)testIfMappingPictureKeyToPictureURLStringProperty
{
  DUNOrganization *organization = [DUNOrganization newFromJsonDictionary:validJsonDictionary()];
  
  assertThat(organization.pictureURLString, is(notNilValue()));
  assertThat(organization.pictureURLString, is(equalTo(@"xxx.png")));
}

- (void)testIfMappingAllPropertiesFromJsonDictionary
{
  DUNOrganization *organization = [DUNOrganization newFromJsonDictionary:validJsonDictionary()];
  
  assertThat(organization.entityId, is(notNilValue()));
  assertThat(organization.name, is(notNilValue()));
  assertThat(organization.pictureURLString, is(notNilValue()));
}


@end
