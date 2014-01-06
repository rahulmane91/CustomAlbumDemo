//
//  PhotoDetails.m
//  CustomPhotoAlbumDemo
//
//  Created by Rahul V. Mane on 7/12/13.
//  Copyright (c) 2013 Rahul. All rights reserved.
//

#import "PhotoDetails.h"

@implementation PhotoDetails

-(id)init
{
    self = [super init];
    if(self)
    {
        self.name = @"(Untitled)";
        self.fullImage = nil;
        self.thumbnailImage = nil;
        self.URL = nil;
    }
    return self;
}

-(NSString *)description
{
    return self.name;
}

@end
