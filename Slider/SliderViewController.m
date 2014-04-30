//
//  SliderViewController.m
//  Slider
//
//  Created by MariAnne Skolnik on 4/29/14.
//  Copyright (c) 2014 MariAnne Skolnik. All rights reserved.
//

#import "SliderViewController.h"

@interface SliderViewController ()

@end

@implementation SliderViewController
@synthesize tiles;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)shuffleTiles:(id)sender {
    //setup so when pushed the tiles move to new positions
}

- (IBAction)slide:(id)sender {
    
    BOOL left = TRUE;
    BOOL right = TRUE;
    BOOL up = TRUE;
    BOOL down = TRUE;
    UIButton *pressedButton = sender;
    
    for (UIButton *b in tiles){
        // make sure buttons don't leave the boards
        if (pressedButton.frame.origin.x  <= 65){
            left = FALSE;
        }
        else if (pressedButton.frame.origin.x  >= 215){
            right = FALSE;
        }
        else if (pressedButton.frame.origin.y  <= 155){
            up = FALSE;
            
        }
        else if (pressedButton.frame.origin.y   >= 310){
            down = FALSE;
        }
        // check for other free spaces
        else if (pressedButton.frame.origin.x + 51 == b.frame.origin.x &&
                 pressedButton.frame.origin.y == b.frame.origin.y){
            NSLog(@ "can't move right");
            right = FALSE;
        }
        else if (pressedButton.frame.origin.x - 51 == b.frame.origin.x &&
                 pressedButton.frame.origin.y == b.frame.origin.y){
            NSLog(@ "can't move left");
            left = FALSE;
        }
        else if (pressedButton.frame.origin.y + 53 == b.frame.origin.y &&
                 pressedButton.frame.origin.x == b.frame.origin.x){
            NSLog(@ "can't move down");
            up = FALSE;
        }
        else if (pressedButton.frame.origin.y - 53 == b.frame.origin.y &&
                 pressedButton.frame.origin.x == b.frame.origin.x){
            NSLog(@ "can't move up");
            down = FALSE;
        }
    }
    
    
    if (right){        
        CGRect newFrame = CGRectMake(pressedButton.frame.origin.x + 51,
                                     pressedButton.frame.origin.y, 51, 53);
        [UIView animateWithDuration:1.0 animations:^{ pressedButton.frame = newFrame;}];
    }
    else if (left){
        CGRect newFrame = CGRectMake(pressedButton.frame.origin.x - 51,
                                     pressedButton.frame.origin.y, 51, 53);
        [UIView animateWithDuration:1.0 animations:^{ pressedButton.frame = newFrame;}];
    }
    else if (up){
        CGRect newFrame = CGRectMake(pressedButton.frame.origin.x,
                                     pressedButton.frame.origin.y + 53, 51, 53);
        [UIView animateWithDuration:1.0 animations:^{ pressedButton.frame = newFrame;}];
    }
    else if (down){
        CGRect newFrame = CGRectMake(pressedButton.frame.origin.x,
                                     pressedButton.frame.origin.y - 53, 51, 53);
        [UIView animateWithDuration:1.0 animations:^{ pressedButton.frame = newFrame;}];
    }
    
}

@end