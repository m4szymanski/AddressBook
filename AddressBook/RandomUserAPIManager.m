//
//  RandomUserAPIManager.m
//  AddressBook
//
//  Created by Matt on 2015-08-26.
//  Copyright (c) 2015 Matthew Szymanski. All rights reserved.
//

#import "RandomUserAPIManager.h"

@implementation RandomUserAPIManager

// Class method that can be accessed from our tableviewcontroller when we want to grab a JSON file from
// the random user API
// This class takes in an input of how many users we want returned in the JSON file

+ (void) getRandomUsers:(int) numResults completionBlock:(URLCompletionBlock)completion{
    NSString* urlString = [NSString stringWithFormat:@"http://api.randomuser.me/?results=%d", numResults];
    NSURL* url = [[NSURL alloc] initWithString:urlString];
    NSURLSession* session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask * dataTask = [session dataTaskWithURL:url
                                             completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
                                       {
                                           //data returned from URL request
                                           
                                           if (error == nil){
                                               
                                               //Once we've finished downloading the JSON, create an NSDictionary from
                                               //that JSON that is returned from the API call
                                               //and pass it to the completion handler
                                               NSDictionary* randomUsers = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                                               completion(randomUsers);
                                               
                                           }else{
                                               //NSLog(@"something went wrong when trying to grab the JSON");
                                           }
                                           
                                       }
                                       ];
    [dataTask resume];
}



@end
