//
//  AlbumDetails.m
//  CustomPhotoAlbumDemo
//
//  Created by Rahul V. Mane on 7/12/13.
//  Copyright (c) 2013 Rahul. All rights reserved.
//

#import "AlbumDetails.h"

@implementation AlbumDetails

-(id)init
{
    self = [super init];
    if(self)
    {
        self.name = @"(Untitled)";
        self.assetCount = 0;
        self.assetPosterImage = nil;
    }
    return self;
}

-(NSString *)description
{
    return self.name;
}

@end
