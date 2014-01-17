//
//  DUNLocationJsonMappingTest.m
//  dunno
//
//  Created by fagner feitosa on 1/17/14.
//  Copyright (c) 2014 dunno. All rights reserved.
//
#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <XCTest/XCTest.h>

#import "DUNLocation.h"

static NSDictionary *validJsonDictionary() {
  return @{@"id":@"666",@"name":@"adega perola",@"street": @"rua sao francisco",@"number": @"30",@"complement": @"lado do bar do B",@"neighborhood": @"flamengo",@"city": @"RJ"};
}

@interface DUNLocationJsonMappingTest : XCTestCase
@end

@implementation DUNLocationJsonMappingTest


- (void)testIfMappingIdKeyToEntityIdProperty
{
  DUNLocation *location = [DUNLocation newFromJsonDictionary:validJsonDictionary()];
  
  assertThat(location.entityId, is(notNilValue()));
  assertThat(location.entityId, isNot(isEmpty()));
}

- (void)testIfMappingAllPropertiesFromJsonDictionary
{
  DUNLocation *location = [DUNLocation newFromJsonDictionary:validJsonDictionary()];
  
  assertThat(location.entityId, is(notNilValue()));
  assertThat(location.name, is(notNilValue()));
  assertThat(location.street, is(notNilValue()));
  assertThat(location.number, is(notNilValue()));
  assertThat(location.complement, is(notNilValue()));
  assertThat(location.neighborhood, is(notNilValue()));
  assertThat(location.city, is(notNilValue()));
}

@end
