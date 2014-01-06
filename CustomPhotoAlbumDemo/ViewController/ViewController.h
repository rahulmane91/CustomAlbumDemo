//
//  ViewController.h
//  CustomPhotoAlbumDemo
//
//  Created by Rahul V. Mane on 7/12/13.
//  Copyright (c) 2013 Rahul. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "CustomPhotoAlbumDelegate.h"
#import "CustomPhotoAlbumLibrary.h"
#import "PhotoListViewController.h"

@interface ViewController : UIViewController <UIImagePickerControllerDelegate,CustomPhotoAlbumDelegate,UITableViewDataSource,UITableViewDelegate>
{
    int progress;
    PhotoListViewController *photo;
    CustomPhotoAlbumLibrary *library;
}

@property (strong, nonatomic) NSMutableArray *contentArray;
- (IBAction)getPhoto:(id)sender;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end
