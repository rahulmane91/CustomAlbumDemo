//
//  DetailPhotoViewController.h
//  CustomPhotoAlbumDemo
//
//  Created by Rahul V. Mane on 7/12/13.
//  Copyright (c) 2013 Rahul. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailPhotoViewController : UIViewController
{
    UIImage *imageToShow;
}

@property (strong, nonatomic) IBOutlet UIImageView *imageView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andImage:(UIImage *)image;

@end
