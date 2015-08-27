//
//  AddressViewController.m
//  AddressBook
//
//  Created by Matt on 2015-08-27.
//  Copyright (c) 2015 Matthew Szymanski. All rights reserved.
//

#import "AddressViewController.h"

@interface AddressViewController ()

@end

@implementation AddressViewController

-(id)initWithRandomUser:(RandomUser*) u{
    //initialize this viewcontroller with a RandomUser object
    self = [super init];
    user = u;
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"CONTACT INFO";
    
    //set all the labels in the view with the values passed in from the randomUser object
    //I formatted some of these to make the app look more insteresting
    
    self.nameLabel.text = [NSString stringWithFormat:@"%@. %@ %@",[user.title uppercaseString],[user.firstName uppercaseString],[user.lastName uppercaseString]];
    self.streetLabel.text = [NSString stringWithFormat:@"%@",user.street];
    self.cityAndStateLabel.text = [NSString stringWithFormat:@"%@, %@.",[user.city capitalizedString],[user.state capitalizedString]];
    self.zipLabel.text = [NSString stringWithFormat:@"%@",user.zip];
    self.phoneLabel.text = [NSString stringWithFormat:@"%@",user.phone];
    self.cellLabel.text = [NSString stringWithFormat:@"%@",user.cell];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
