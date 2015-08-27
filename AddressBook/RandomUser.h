//
//  RandomUser.h
//  AddressBook
//
//  Created by Matt on 2015-08-26.
//  Copyright (c) 2015 Matthew Szymanski. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RandomUser : NSObject

- (id) initWithNSDictionary:(NSDictionary*)randomUser;

@property (copy,nonatomic) NSDictionary* name;
@property (copy,nonatomic) NSDictionary* location;
@property (copy,nonatomic) NSString* title;
@property (copy,nonatomic) NSString* firstName;
@property (copy,nonatomic) NSString* lastName;
@property (copy,nonatomic) NSString* street;
@property (copy,nonatomic) NSString* city;
@property (copy,nonatomic) NSString* state;
@property (copy,nonatomic) NSString* zip;
@property (copy,nonatomic) NSString* email;
@property (copy,nonatomic) NSString* phone;
@property (copy,nonatomic) NSString* cell;


@end
