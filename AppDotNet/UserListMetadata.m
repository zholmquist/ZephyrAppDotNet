//
//  UserListMetadata.m
//  AppDotNet
//
//  Copyright 2012-2013 Ender Labs. All rights reserved.
//  Created by Donald Hays.
//

#import "UserListMetadata.h"

@implementation UserListMetadata
+ (UserListMetadata *)userListMetadataFromJSONRepresentation:(NSDictionary *)representation
{
    UserListMetadata *meta = [[UserListMetadata alloc] init];
    
    meta.maxID = [representation objectForKey:@"max_id"];
    meta.minID = [representation objectForKey:@"min_id"];
    meta.hasMore = [[representation objectForKey:@"more"] boolValue];
    
    return meta;
}

- (id)initWithCoder:(NSCoder *)coder
{
    self = [super init];
    if(self) {
        self.maxID = [coder decodeObjectForKey:@"max_id"];
        self.minID = [coder decodeObjectForKey:@"min_id"];
        self.hasMore = [[coder decodeObjectForKey:@"more"] boolValue];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeObject:self.maxID forKey:@"max_id"];
    [coder encodeObject:self.minID forKey:@"min_id"];
    [coder encodeObject:[NSNumber numberWithBool:self.hasMore] forKey:@"more"];
}
@end
