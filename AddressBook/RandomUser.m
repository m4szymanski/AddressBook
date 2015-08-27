//
//  RandomUser.m
//  AddressBook
//
//  Created by Matt on 2015-08-26.
//  Copyright (c) 2015 Matthew Szymanski. All rights reserved.
//

#import "RandomUser.h"
#import "RandomUserAPIManager.h"

@implementation RandomUser

- (id) initWithNSDictionary:(NSDictionary*)randomUser{
    //initialize a RandomUser Object with values from a JSON file that was passed in as an NSDictionary
    self.name = randomUser[@"user"][@"name"];
    self.location= randomUser[@"user"][@"location"];
    self.email = randomUser[@"user"][@"email"];
    self.title = self.name[@"title"];
    self.firstName = self.name[@"first"];
    self.lastName = self.name[@"last"];
    self.street = self.location[@"street"];
    self.city = self.location[@"city"];
    self.state = self.location[@"state"];
    self.zip = self.location[@"zip"];
    self.phone = randomUser[@"user"][@"phone"];
    self.cell = randomUser[@"user"][@"cell"];

    return self;
}

@end
