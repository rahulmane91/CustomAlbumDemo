//
//  AppDelegate.h
//  CustomPhotoAlbumDemo
//
//  Created by Rahul V. Mane on 7/12/13.
//  Copyright (c) 2013 Rahul. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    UINavigationController *navigationController;
}
@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ViewController *viewController;

@end
