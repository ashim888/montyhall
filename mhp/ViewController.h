//
//  ViewController.h
//  mhp
//
//  Created by ashim888 on 9/10/13.
//  Copyright (c) 2013 UIS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>

@interface ViewController : UIViewController{
    
    SystemSoundID winSoundID;
    SystemSoundID loserSoundID;
}
@property (weak, nonatomic) IBOutlet UIImageView *door1;
@property (weak, nonatomic) IBOutlet UIImageView *door2;
@property (weak, nonatomic) IBOutlet UIImageView *door3;
@property (weak, nonatomic) IBOutlet UISegmentedControl *doorSelector;

@property (weak, nonatomic) IBOutlet UILabel *selectLBL;

@property (weak, nonatomic) IBOutlet UIButton *revealLBL;

@property (weak, nonatomic) IBOutlet UISegmentedControl *keepSelector;

@property (weak, nonatomic) IBOutlet UIButton *showBTN;
@property (weak, nonatomic) IBOutlet UIButton *resetBTN;

@property (weak, nonatomic) IBOutlet UIImageView *arrow1;
@property (weak, nonatomic) IBOutlet UIImageView *arrow2;
@property (weak, nonatomic) IBOutlet UIImageView *arrow3;

@property (weak, nonatomic) IBOutlet UILabel *keepTotal;
@property (weak, nonatomic) IBOutlet UILabel *keepWin;
@property (weak, nonatomic) IBOutlet UILabel *keepLoss;

@property (weak, nonatomic) IBOutlet UILabel *switchTotal;
@property (weak, nonatomic) IBOutlet UILabel *switchWin;
@property (weak, nonatomic) IBOutlet UILabel *switchLoss;
- (IBAction)doorSelected:(id)sender;
- (IBAction)revealDoor:(id)sender;
- (IBAction)showResult:(id)sender;
- (IBAction)keepSwitch:(id)sender;
- (IBAction)resetGame:(id)sender;
- (void) showArrow;
- (void) resetDoors;
- (void) revealDoor3;
- (void) revealDoor2;
- (void) revealDoor1;
@end
