//
//  SliderViewController.h
//  Slider
//
//  Created by MariAnne Skolnik on 4/29/14.
//  Copyright (c) 2014 MariAnne Skolnik. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SliderViewController : UIViewController

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *tiles;
@property (weak, nonatomic) IBOutlet UILabel *label;

- (IBAction)slide:(id)sender;

@end
