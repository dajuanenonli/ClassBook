//
//  DataManager.h
//  ClassBook
//
//  Created by Student on 7/24/15.
//  Copyright (c) 2015 Student_Ralph. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataManager : NSObject

/**
 * gets singleton object.
 * @return singleton
 */
+ (DataManager*)sharedInstance;

- (NSArray *)fetchPeopleFromPlist;
- (NSArray *)parsePlist;
- (NSString *)dataFilePath;
- (void)createPlist;
@end
