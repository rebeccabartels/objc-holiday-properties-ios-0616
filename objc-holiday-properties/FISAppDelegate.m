//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

- (NSArray *)holidaysInSeason:(NSString *)season {
    
    return [self.database[season] allKeys];
//holidaysInSeason: to return an array of all of the "holiday" keys in the sub-dictionary associated with the submitted "season" argument.
}

- (NSArray *)suppliesInHoliday:(NSString *)holiday
                      inSeason:(NSString *)season {
  return [NSArray arrayWithArray:self.database[season][holiday] ];
//suppliesInHoliday:inSeason: to return the mutable array of all of the supplies for the submitted "holiday" in the submitted "season".
    
}

- (BOOL)holiday:(NSString* )holiday
     isInSeason:(NSString *)season {
    
   return [[self.database[season] allKeys] containsObject:holiday];
//holiday:isInSeason: to return whether or not the submitted "season" contains a key that matches the "holiday" argument.
}

- (BOOL)supply:(NSString *)supply
   isInHoliday:(NSString *)holiday
      inSeason:(NSString *)season {
//supply:isInHoliday:inSeason: to return whether or not the submitted "holiday" in the submitted "season" contains in its array the submitted "supply" string.
    return [self.database[season][holiday] containsObject:supply];
}

- (void)addHoliday:(NSString *)holiday
          toSeason:(NSString *)season {
    
    self.database[season][holiday] = [[NSMutableArray alloc] init];
//addHoliday:toSeason: to create a new key-value pair in the submitted "season" key's sub-dictionary that uses the submitted "holiday" as the key and sets up an empty mutable array as its value.
}

- (void)addSupply:(NSString *)supply
        toHoliday:(NSString *)holiday
         inSeason:(NSString *)season {
    
//addSupply:toHoliday:inSeason: to insert the submitted "supply" argument into the mutable array of the submitted "holiday" key in the sub-dictionary of the submitted "season" key.

    
    [self.database[season][holiday] addObject:supply];
}

@end
