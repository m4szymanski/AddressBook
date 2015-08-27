//
//  TableViewController.m
//  AddressBook
//
//  Created by Matt on 2015-08-26.
//  Copyright (c) 2015 Matthew Szymanski. All rights reserved.
//

#import "TableViewController.h"
#import "RandomUserAPIManager.h"
#import "RandomUser.h"
#import "AddressViewController.h"

@interface TableViewController ()

@end

//Number of Contacts we are going to grab from the JSON returned by the RandomUser API call
static int numberOfRandomUsers = 100;

//Cell Reuse Identifier for our TableViewCells
static NSString* reuseTableCellID = @"addressCellID";


@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.randomUserArray = [[NSMutableArray alloc] init];
    
    // API call to grab the JSON from RandomUser page
    [RandomUserAPIManager getRandomUsers:numberOfRandomUsers completionBlock:^(NSDictionary *dict) {
        dispatch_async(dispatch_get_main_queue(), ^{
            
            
            for (int i=0; i<numberOfRandomUsers; i++) {
                //Create a RandomUser Object using our model, initializing it with the results obtained from the JSON
                //which we are passing as an NSDictionary, we want to grab each user in the results node of the JSON
                self.randomUser = [[RandomUser alloc] initWithNSDictionary:dict[@"results"][i]];
                
                //Add the randomUser Object to an NSMutable array of objects which we will use for knowing the number of rows
                //in our UITableView
                [self.randomUserArray addObject:self.randomUser];
            }
            
            
            //Since the view will load before our JSON finishes downloading we need to reload the data in the tableview in this completion block of code, otherwise our tableview will be empty and not contain any cells
            [self.tableView reloadData];
        });
    }];
    
    self.title = @"Matt's Random Address Book";
    
    //Register the tableViewCell class instead of registering a NIB since my TableViewCells are pretty simple and
    //done through code
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:reuseTableCellID];
    
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
    return self.randomUserArray.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseTableCellID forIndexPath:indexPath];
    
    //grab the randomUser Object that corresponds to the row indexpath from the randomUser Array
    self.randomUser = self.randomUserArray[indexPath.row];
    
    // Configure the cell...
    cell.textLabel.text = [NSString stringWithFormat:@"%@, %@", [self.randomUser.lastName capitalizedString], [self.randomUser.firstName capitalizedString]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    //grab the randomUser Object that corresponds to the row indexpath from the randomUser Array
    self.randomUser = self.randomUserArray[indexPath.row];

    //Push an AddressViewController (UIViewController) that is initialized with one of our randomUser objects
    AddressViewController* addressVC = [[AddressViewController alloc] initWithRandomUser:self.randomUser];
    [self.navigationController pushViewController:addressVC animated:YES];

}


@end
