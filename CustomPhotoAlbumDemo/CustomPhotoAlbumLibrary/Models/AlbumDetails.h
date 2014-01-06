//
//  AlbumDetails.h
//  CustomPhotoAlbumDemo
//
//  Created by Rahul V. Mane on 7/12/13.
//  Copyright (c) 2013 Rahul. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AlbumDetails : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) UIImage *assetPosterImage;
@property (readwrite, nonatomic) NSInteger assetCount;

@end
