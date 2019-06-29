//
//  MyTableViewTests.m
//  MyTableViewTests
//
//  Created by macOS on 13/06/19.
//  Copyright © 2019 macOS. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "UserModel.h"
#import <Foundation/Foundation.h>

@interface MyTableViewTests : XCTestCase

@property(nonatomic) UserModel *testUserModel;

@end

@implementation MyTableViewTests


- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.testUserModel = [[UserModel alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

@end
