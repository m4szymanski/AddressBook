//
//  AddressViewController.h
//  AddressBook
//
//  Created by Matt on 2015-08-27.
//  Copyright (c) 2015 Matthew Szymanski. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RandomUser.h"

@interface AddressViewController : UIViewController{
    RandomUser* user;
}

-(id)initWithRandomUser:(RandomUser*) u;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *streetLabel;
@property (weak, nonatomic) IBOutlet UILabel *cityAndStateLabel;
@property (weak, nonatomic) IBOutlet UILabel *zipLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;
@property (weak, nonatomic) IBOutlet UILabel *cellLabel;

@end
