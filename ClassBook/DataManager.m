//
//  DataManager.m
//  ClassBook
//
//  Created by Student on 7/24/15.
//  Copyright (c) 2015 Student_Ralph. All rights reserved.
//

#import "DataManager.h"
#import "Person.h"
#import "AFNetworking.h"

@interface DataManager()
@property (nonatomic, strong) NSArray* peopleList;
@end

#define kFileName @"/people.Plist"

@implementation DataManager

static DataManager *SINGLETON = nil;
static bool isFirstAccess = YES;

#pragma mark - Public Method

+ (id)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        isFirstAccess = NO;
        SINGLETON = [[super allocWithZone:NULL] init];    
    });
    
    return SINGLETON;
}

#pragma mark - Instance Method
- (NSArray *)fetchPeopleFromPlist
{
    [self checkForPlist];
    NSString *filePath = self.dataFilePath;
    NSArray *array = [[NSArray alloc] init];
    if([[NSFileManager defaultManager] fileExistsAtPath:filePath])
    {
        array = [[NSArray alloc] initWithContentsOfFile:filePath];
    }
    
    //parse dictionary
    NSMutableArray *people = [[NSMutableArray alloc] init];
    for (int i=0; i < array.count; i++) {
        [people addObject:[self parseData:[array objectAtIndex:i]]];
    }
    
    return people;
}

#pragma mark - Private Methods
-(void)checkForPlist
{
    NSString *filePath = self.dataFilePath;
    
    if(![[NSFileManager defaultManager] fileExistsAtPath:filePath])
    {
        //[self parsePlist];
    //}else
    //{
        //[[NSNotificationCenter defaultCenter] addObserver:self
        //                                        selector:@selector(buildPeoplePlist)
        //                                             name:@"Build Plist"
        //                                           object:nil];
        [self createPlist];
    }
}

- (NSArray *)parsePlist
{
    NSString *filePath = [self dataFilePath];
    
    NSArray *array = [[NSArray alloc]init];
    if([[NSFileManager defaultManager] fileExistsAtPath:filePath])
    {
        array = [[NSArray alloc] initWithContentsOfFile:filePath];
    }
    
    return array;
}

- (NSString *)dataFilePath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return [documentsDirectory stringByAppendingString:kFileName];
}

- (void)createPlist
{
    /*NSDictionary *peopleDictionary1 = @{
                                       @"firstName": @"Homer",
                                       @"lastname" : @"Simpson",
                                       @"address"  : @"123 Main St",
                                       @"city"     : @"Springfield",
                                       @"state"    : @"CA",
                                       @"zip"      : @"90064",
                                       @"mobile"   : @"818-111-1111"
                                       };
    
    NSDictionary *peopleDictionary2 = @{
                                       @"firstName": @"Marge",
                                       @"lastname" : @"Simpson",
                                       @"address"  : @"123 Main St",
                                       @"city"     : @"Springfield",
                                       @"state"    : @"CA",
                                       @"zip"      : @"90064",
                                       @"mobile"   : @"818-111-1111"
                                       };
    
    NSDictionary *peopleDictionary3 = @{
                                       @"firstName": @"Bart",
                                       @"lastname" : @"Simpson",
                                       @"address"  : @"123 Main St",
                                       @"city"     : @"Springfield",
                                       @"state"    : @"CA",
                                       @"zip"      : @"90064",
                                       @"mobile"   : @"818-111-1111"
                                       };
     
     NSArray *peopleArray = [[NSMutableArray alloc] initWithArray: @[peopleDictionary1, peopleDictionary2, peopleDictionary3]];
     */
    [self getPeople];
    
    
   /* NSMutableArray *people = [[NSMutableArray alloc] init];
    Person *myPerson = [[Person alloc] init];
    myPerson.firstName = @"Homer";
    myPerson.lastName = @"Simpson";
    myPerson.address = @"123 Main St";
    myPerson.city = @"Springfield";
    myPerson.state = @"CA";
    myPerson.zip = @"90064";
    myPerson.mobile = @"818-111-1111";
    [people addObject:myPerson];
    
    
    Person *myPerson1 = [[Person alloc] init];
    myPerson1.firstName = @"Margie";
    myPerson1.lastName = @"Simpson";
    myPerson1.address = @"123 Main St";
    myPerson1.city = @"Springfield";
    myPerson1.state = @"CA";
    myPerson1.zip = @"90064";
    myPerson1.mobile = @"818-111-1111";
    [people addObject:myPerson1];
    
    Person *myPerson2 = [[Person alloc] init];
    myPerson2.firstName = @"Bart";
    myPerson2.lastName = @"Simpson";
    myPerson2.address = @"123 Main St";
    myPerson2.city = @"Springfield";
    myPerson2.state = @"CA";
    myPerson2.zip = @"90064";
    myPerson2.mobile = @"818-111-1111";
    [people addObject:myPerson2];
   
    NSArray *peopleArray = [[NSMutableArray alloc] initWithArray: @[myPerson, myPerson1, myPerson2]];
    */
    
}

- (void)writeToPlist:(id)data
{
    NSMutableArray *peopleArray = [[NSMutableArray alloc] init];
    
    for (NSDictionary *person in data) {
        NSMutableDictionary *tempDictionary = [[NSMutableDictionary alloc]initWithDictionary:person];
        [peopleArray addObject:tempDictionary];
    }
    
    [peopleArray writeToFile:[self dataFilePath] atomically:YES];
    //[(NSArray *)data writeToFile:[self dataFilePath] atomically:YES];
    
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"Build Plist"
                                                        object:nil];
  
  }

-(Person *)parseData:(NSDictionary *) dict
{
    Person *parsedData = [Person new];
    parsedData.address = [dict valueForKey:@"Address"];
    parsedData.firstName = [dict valueForKey:@"FirstName"];
    parsedData.lastName = [dict valueForKey:@"Lastname"];
    parsedData.city = [dict valueForKey:@"City"];
    parsedData.state = [dict valueForKey:@"State"];
    parsedData.mobile = [dict valueForKey:@"Mobile"];
    parsedData.zip = [dict valueForKey:@"ZipCode"];
    return parsedData;
}

#pragma mark - Life Cycle

+ (id) allocWithZone:(NSZone *)zone
{
    return [self sharedInstance];
}

+ (id)copyWithZone:(struct _NSZone *)zone
{
    return [self sharedInstance];
}

+ (id)mutableCopyWithZone:(struct _NSZone *)zone
{
    return [self sharedInstance];
}

- (id)copy
{
    return [[DataManager alloc] init];
}

- (id)mutableCopy
{
    return [[DataManager alloc] init];
}

- (id) init
{
    if(SINGLETON){
        return SINGLETON;
    }
    if (isFirstAccess) {
        [self doesNotRecognizeSelector:_cmd];
    }
    self = [super init];
    return self;
}

#pragma mark - Webservice calls
-(void) getPeople
{
    NSURL *url = [NSURL URLWithString:@"https://qa.ffemobile.com/iostrainingapi/api/person/getlist"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];

    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
       //NSError *e = nil;
        //NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData: responseObject options: NSJSONReadingMutableContainers error: &e];
        
        
        // 3
        //self.peopleList = [[NSArray alloc] initWithArray:responseObject];
        [self writeToPlist:responseObject];
        
        //NSDictionary *currentData = [[data objectForKey:@"current_condition"] objectAtIndex:0];
        
        //self.cloudCover = [currentCondition[@"cloudCover"] intValue];
        
        //self.currentCondition = [[CurrentCondition alloc] init];
        
        /*for (int i=0; i < currentData.count; i++) {
         
         }*/
        
        //NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
        //numberFormatter.numberStyle = NSNumberFormatterDecimalStyle;
        
        
        
        //self.currentCondition.cloudCover = [NSNumber numberWithInteger:(int)[self extractValue:[currentData valueForKey:@"cloudcover"]]];
        
        //self.title = @"JSON Retrieved";
        //[self.tableView reloadData];
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        //return nil;
        // 4
        /*UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error Retrieving Weather"
         message:[error localizedDescription]
         delegate:nil
         cancelButtonTitle:@"Ok"
         otherButtonTitles:nil];
         [alertView show];*/
    }];
    
    // 5
    [operation start];
}

@end
