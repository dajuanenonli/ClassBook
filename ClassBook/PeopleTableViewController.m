//
//  PeopleTableViewController.m
//  ClassBook
//
//  Created by Student on 7/23/15.
//  Copyright (c) 2015 Student_Ralph. All rights reserved.
//

#import "PeopleTableViewController.h"
#import "Person.h"

@interface PeopleTableViewController ()

@property (nonatomic, strong) NSMutableArray *people;

@end

@implementation PeopleTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.people = [[NSMutableArray alloc] init];
    [self populatePeople];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return self.people.count;
}

/**/
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *SimpleTableIdentifier = @"SimpleTableIndentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SimpleTableIdentifier];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:SimpleTableIdentifier];
        
    }
    Person *person = [self.people objectAtIndex:indexPath.row];
    cell.textLabel.text = [person.firstName stringByAppendingString:[@" " stringByAppendingString:person.lastName]];
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void) populatePeople
{
    Person *myPerson = [[Person alloc] init];
    myPerson.firstName = @"Homer";
    myPerson.lastName = @"Simpson";
    myPerson.address = @"123 Main St";
    myPerson.city = @"Springfield";
    myPerson.state = @"CA";
    myPerson.zip = @"90064";
    myPerson.mobile = @"818-111-1111";
    [self.people addObject:myPerson];
    
    Person *myPerson1 = [[Person alloc] init];
    myPerson1.firstName = @"Maggie";
    myPerson1.lastName = @"Simpson";
    myPerson1.address = @"123 Main St";
    myPerson1.city = @"Springfield";
    myPerson1.state = @"CA";
    myPerson1.zip = @"90064";
    myPerson1.mobile = @"818-111-1111";
    [self.people addObject:myPerson1];
    
    Person *myPerson2 = [[Person alloc] init];
    myPerson2.firstName = @"Bart";
    myPerson2.lastName = @"Simpson";
    myPerson2.address = @"123 Main St";
    myPerson2.city = @"Springfield";
    myPerson2.state = @"CA";
    myPerson2.zip = @"90064";
    myPerson2.mobile = @"818-111-1111";
    [self.people addObject:myPerson2];
}

@end
