//
//  CustomPhotoAlbumLibrary.h
//  CustomPhotoAlbumDemo
//
//  Created by Rahul V. Mane on 7/12/13.
//  Copyright (c) 2013 Rahul. All rights reserved.
//

#import <AssetsLibrary/AssetsLibrary.h>
#import "CustomPhotoAlbumDelegate.h"

typedef void(^SaveImageCompletion)(NSError* error);

@interface CustomPhotoAlbumLibrary : ALAssetsLibrary

@property (strong, nonatomic) id<CustomPhotoAlbumDelegate> delegate;

-(void)saveImage:(UIImage*)image toAlbum:(NSString*)albumName withCompletionBlock:(SaveImageCompletion)completionBlock;
-(void)addAssetURL:(NSURL*)assetURL toAlbum:(NSString*)albumName withCompletionBlock:(SaveImageCompletion)completionBlock;
-(void)requestAlbumNameFromGalleryWithType:(ALAssetsGroupType)albumType;
-(void)requestAlbumPhotosWithAlbumName:(NSString *)albumName;

@end
