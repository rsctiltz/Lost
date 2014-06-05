//
//  DetailViewController.h
//  LostCharacters
//
//  Created by Ryan Tiltz on 6/3/14.
//  Copyright (c) 2014 Ryan Tiltz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
