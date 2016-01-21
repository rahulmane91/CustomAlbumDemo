//
//  ViewController.m
//  CustomPhotoAlbumDemo
//
//  Created by Rahul V. Mane on 7/12/13.
//  Copyright (c) 2013 Rahul. All rights reserved.
//

#import "ViewController.h"
#import "AlbumDetails.h"
#import "SVProgressHUD.h"

@implementation ViewController

-(void)viewDidLoad
{
    self.contentArray = [[NSMutableArray alloc]init];
    photo = [[PhotoListViewController alloc]initWithNibName:@"PhotoListViewController" bundle:nil];
    library = [[CustomPhotoAlbumLibrary alloc] init];
    library.delegate = self;
}

- (IBAction)takePhoto
{
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
	imagePickerController.editing = YES;
    imagePickerController.delegate = (id)self;
    
    [self presentModalViewController:imagePickerController animated:YES];
}

#pragma mark Image picker delegate methods

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo
{
        CustomPhotoAlbumLibrary *library1 = [[CustomPhotoAlbumLibrary alloc] init];
    [library1 saveImage:image toAlbum:@"Rahul Mane" withCompletionBlock:^(NSError *error) {
        if (error!=nil) {
            NSLog(@"Big error: %@", [error description]);
        }
    }];
    
    [picker dismissModalViewControllerAnimated:NO];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissModalViewControllerAnimated:NO];
}


- (IBAction)getPhoto:(id)sender
{
    [SVProgressHUD showWithStatus:@"Please wait while collecting data..."];
    [library requestAlbumNameFromGalleryWithType:ALAssetsGroupAll];
}

-(void)listOfAllAlbumFromGallery:(NSMutableArray *)listOfAlbum
{
    [SVProgressHUD dismiss];
    [self.contentArray removeAllObjects];
    [self.contentArray addObjectsFromArray:listOfAlbum];
    [self.tableView reloadData];
}

-(void)listOfAllPhotosOfAlbum:(NSMutableArray *)listOfPhotos
{
    [SVProgressHUD dismiss];
    [self.navigationController pushViewController:photo animated:YES];
    [photo reloadTableDataWithNewImages:listOfPhotos];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.contentArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(!cell)
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    AlbumDetails *album = [self.contentArray objectAtIndex:indexPath.row];
    NSString *nameOfAlbum = [NSString stringWithFormat:@"%@  (%d)",album.name,album.assetCount];
    [cell.imageView setImage:album.assetPosterImage];
    cell.textLabel.text = nameOfAlbum;
    cell.textLabel.highlightedTextColor = [UIColor blackColor];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [SVProgressHUD showWithStatus:@"Please wait while collecting data..."];
    
    NSString *selected = [[self.contentArray objectAtIndex:indexPath.row] name];
    NSLog(@"%@",selected);
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [library requestAlbumPhotosWithAlbumName:selected];
}

@end
