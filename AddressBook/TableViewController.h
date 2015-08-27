//
//  TableViewController.h
//  AddressBook
//
//  Created by Matt on 2015-08-26.
//  Copyright (c) 2015 Matthew Szymanski. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RandomUser.h"

@interface TableViewController : UITableViewController
@property (retain,nonatomic) NSMutableArray* randomUserArray;
@property (retain,nonatomic) RandomUser* randomUser;
@end
