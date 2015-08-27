//
//  RandomUserAPIManager.h
//  AddressBook
//
//  Created by Matt on 2015-08-26.
//  Copyright (c) 2015 Matthew Szymanski. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^URLCompletionBlock)(NSDictionary* dict);

@interface RandomUserAPIManager : NSObject

+ (void) getRandomUsers:(int) numResults completionBlock:(URLCompletionBlock)completion;


@end
