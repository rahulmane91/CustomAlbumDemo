//
//  CustomPhotoAlbumLibrary.m
//  CustomPhotoAlbumDemo
//
//  Created by Rahul V. Mane on 7/12/13.
//  Copyright (c) 2013 Rahul. All rights reserved.
//

#import "CustomPhotoAlbumLibrary.h"
#import "AlbumDetails.h"
#import "PhotoDetails.h"

@implementation CustomPhotoAlbumLibrary

-(void)saveImage:(UIImage*)image toAlbum:(NSString*)albumName withCompletionBlock:(SaveImageCompletion)completionBlock
{
    [self writeImageToSavedPhotosAlbum:image.CGImage orientation:(ALAssetOrientation)image.imageOrientation completionBlock:^(NSURL* assetURL, NSError* error)
     {
         if (error!=nil)
         {
             completionBlock(error);
             return;
         }
         [self addAssetURL:assetURL toAlbum:albumName withCompletionBlock:completionBlock];
     }];
}

-(void)addAssetURL:(NSURL*)assetURL toAlbum:(NSString*)albumName withCompletionBlock:(SaveImageCompletion)completionBlock
{
    __block BOOL albumWasFound = NO;
    
    [self enumerateGroupsWithTypes:ALAssetsGroupAlbum usingBlock:^(ALAssetsGroup *group, BOOL *stop)
     {
         if ([albumName compare: [group valueForProperty:ALAssetsGroupPropertyName]]==NSOrderedSame)
         {
             albumWasFound = YES;
             [self assetForURL: assetURL resultBlock:^(ALAsset *asset)
              {
                  [group addAsset: asset];
                  completionBlock(nil);
              }
                  failureBlock: completionBlock];
             
             return;
         }
         if (group==nil && albumWasFound==NO)
         {
             __weak ALAssetsLibrary* weakSelf = self;
             [self addAssetsGroupAlbumWithName:albumName resultBlock:^(ALAssetsGroup *group)
              {
                  [weakSelf assetForURL: assetURL resultBlock:^(ALAsset *asset)
                   {
                       [group addAsset: asset];
                       completionBlock(nil);
                   }
                           failureBlock: completionBlock];
                  
              }
                                  failureBlock: completionBlock];
             return;
         }
     }
                      failureBlock: completionBlock];
}

-(void)requestAlbumNameFromGalleryWithType:(ALAssetsGroupType)albumType
{
    NSMutableArray *listOfAlbum = [[NSMutableArray alloc]init];
    ALAssetsLibrary *library = [[ALAssetsLibrary alloc]init];
    [library enumerateGroupsWithTypes:albumType usingBlock:^(ALAssetsGroup *group, BOOL *stop)
     {
         NSString *albumName = [group valueForProperty:ALAssetsGroupPropertyName];
         if(albumName)
         {
             AlbumDetails *album = [[AlbumDetails alloc]init];
             album.name = albumName;
             album.assetPosterImage = [[UIImage alloc] initWithCGImage:[group posterImage]];
             album.assetCount = [group numberOfAssets];
             [listOfAlbum addObject:album];
         }
         else
             [self.delegate listOfAllAlbumFromGallery:listOfAlbum];
         
     }
                         failureBlock:^(NSError *error)
     {
         NSLog(@"No album found");
     }];
}

-(void)requestAlbumPhotosWithAlbumName:(NSString *)albumName
{
    NSMutableArray *listOfPhotos = [[NSMutableArray alloc]init];
    ALAssetsLibrary *library1 = [[ALAssetsLibrary alloc] init];
     
    [library1 enumerateGroupsWithTypes:ALAssetsGroupAll usingBlock:^(ALAssetsGroup *group, BOOL *stop)
     {
         if ([albumName compare: [group valueForProperty:ALAssetsGroupPropertyName]]==NSOrderedSame)
         {
             [group setAssetsFilter:[ALAssetsFilter allPhotos]];
             
             [group enumerateAssetsAtIndexes:0 options:0 usingBlock:^(ALAsset *alAsset, NSUInteger index, BOOL *innerStop)
              {
                  if (alAsset)
                  {
                      ALAssetRepresentation *representation = [alAsset defaultRepresentation];
                      UIImage *latestPhoto = [UIImage imageWithCGImage:[representation fullScreenImage]];
                      UIImage *thumbnail = [UIImage imageWithCGImage:[alAsset thumbnail]];
                      
                      PhotoDetails *photo = [[PhotoDetails alloc]init];
                      photo.fullImage = latestPhoto;
                      photo.thumbnailImage = thumbnail;
                      photo.URL = [representation url];
                      photo.name = [representation filename];
                      
                      [listOfPhotos addObject:photo];
                  }
                  else
                      [self.delegate listOfAllPhotosOfAlbum:listOfPhotos];
              }];

         }
     }
                          failureBlock: ^(NSError *error)
     {
         NSLog(@"No groups");
     }];
}


@end
