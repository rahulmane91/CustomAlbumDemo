//
//  PhotoListViewController.m
//  CustomPhotoAlbumDemo
//
//  Created by Rahul V. Mane on 7/12/13.
//  Copyright (c) 2013 Rahul. All rights reserved.
//

#import "PhotoListViewController.h"
#import "DetailPhotoViewController.h"
#import "PhotoDetails.h"

@interface PhotoListViewController ()

@end

@implementation PhotoListViewController

-(void)reloadTableDataWithNewImages:(NSMutableArray *)imageArray
{
    [self.contentArray removeAllObjects];
    if(imageArray)
        [self.contentArray addObjectsFromArray:imageArray];
    [self.tableView reloadData];
}

-(void)viewDidLoad
{
    self.contentArray = [[NSMutableArray alloc]init];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.contentArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    PhotoDetails *photo = [self.contentArray objectAtIndex:indexPath.row];

    [cell.imageView setImage:photo.thumbnailImage];
    cell.textLabel.text = photo.name;
    cell.detailTextLabel.text = [photo.URL absoluteString];
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIImage *image = [[self.contentArray objectAtIndex:indexPath.row] fullImage];
    DetailPhotoViewController *detail = [[DetailPhotoViewController alloc]initWithNibName:@"DetailPhotoViewController" bundle:nil andImage:image];
    [self.navigationController pushViewController:detail animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

}

@end
