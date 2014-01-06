//
//  CustomPhotoAlbumDelegate.h
//  CustomPhotoAlbumDemo
//
//  Created by Rahul V. Mane on 7/12/13.
//  Copyright (c) 2013 Rahul. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CustomPhotoAlbumDelegate <NSObject>

-(void)listOfAllAlbumFromGallery:(NSMutableArray *)listOfAlbum;
-(void)listOfAllPhotosOfAlbum:(NSMutableArray *)listOfPhotos;

@end
