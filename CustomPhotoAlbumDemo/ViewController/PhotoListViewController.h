//
//  PhotoListViewController.h
//  CustomPhotoAlbumDemo
//
//  Created by Rahul V. Mane on 7/12/13.
//  Copyright (c) 2013 Rahul. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoListViewController : UITableViewController

@property (strong, nonatomic) NSMutableArray *contentArray;

-(void)reloadTableDataWithNewImages:(NSMutableArray *)imageArray;

@end
