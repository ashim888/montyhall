//
//  ViewController.m
//  mhp
//
//  Created by ashim888 on 9/10/13.
//  Copyright (c) 2013 UIS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize door1;
@synthesize door2;
@synthesize door3;
@synthesize doorSelector;
@synthesize selectLBL;
@synthesize revealLBL;
@synthesize keepSelector;
@synthesize showBTN;
@synthesize resetBTN;
@synthesize arrow1;
@synthesize arrow2;
@synthesize arrow3;
@synthesize keepLoss;
@synthesize keepTotal;
@synthesize keepWin;
@synthesize switchLoss;
@synthesize switchTotal;
@synthesize switchWin;

UIImageView *imageView1;    //Global ImageFile
UIImageView *imageView2;

int doorWinner;
int playerChoice;
int doorRevealed;

int keepTotalCounter;
int switchTotalCounter;
int keepWinCounter;
int switchWinCounter;
int keepLossCounter;
int switchLossCounter;

bool isWinner;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSString *WinnerPath=[[NSBundle mainBundle] pathForResource:@"WINNER" ofType:@"WAV"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef) [NSURL fileURLWithPath:WinnerPath], &winSoundID);
    
    NSString *LoserPath=[[NSBundle mainBundle] pathForResource:@"LoserHorns" ofType:@"wav"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef) [NSURL fileURLWithPath:LoserPath], &loserSoundID);
    
    
    doorWinner = ((arc4random() % 3) + 1);
    keepTotalCounter=0;
    keepWinCounter=0;
    keepLossCounter=0;
    switchTotalCounter=0;
    switchLossCounter=0;
    switchWinCounter=0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}

- (IBAction)doorSelected:(id)sender {
    
    selectLBL.hidden=TRUE;
    revealLBL.hidden=FALSE;
    doorSelector.hidden=TRUE;
    if (doorSelector.selectedSegmentIndex==0) {
        playerChoice=1;
    }
    if (doorSelector.selectedSegmentIndex==1) {
        playerChoice=2;
    }
    if (doorSelector.selectedSegmentIndex==2) {
        playerChoice=3;
    }
    [self showArrow];
    
}

- (void)showArrow {
    if (playerChoice == 1) {
        arrow1.hidden=FALSE;
        arrow2.hidden=TRUE;
        arrow3.hidden=TRUE;
    }
    if (playerChoice == 2) {
        arrow1.hidden=TRUE;
        arrow2.hidden=FALSE;
        arrow3.hidden=TRUE;
    }
    if (playerChoice == 3) {
        arrow1.hidden=TRUE;
        arrow2.hidden=TRUE;
        arrow3.hidden=FALSE;
    }
}

- (IBAction)revealDoor:(id)sender {
    bool selectionRepeat= TRUE;
    
    while (selectionRepeat) {
        doorRevealed = ((arc4random() % 3) + 1);
        if (doorRevealed != doorWinner && doorRevealed !=playerChoice)
        {
            selectionRepeat=FALSE;
        }
    }
    if (doorRevealed==1) [self revealDoor1];
    if (doorRevealed==2) [self revealDoor2];
    if (doorRevealed==3) [self revealDoor3];
    
    revealLBL.hidden=TRUE;
    keepSelector.hidden=FALSE;
    
    
    
}
-(void) revealDoor1{
    if (doorWinner==1) {
        imageView2=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"winner1"]];
        
    }
    else{
        imageView2=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"looser1"]];
    }
    [imageView2 setFrame:CGRectMake(0, 45, 82, 72)];
    
    [UIView beginAnimations:nil  context:nil];
    [UIView setAnimationDuration:1.5];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(transitionDidStop: finished: context:)];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:door1 cache:YES];
    [door1 addSubview:imageView2]; //Either winner or loser Graphic
    [UIView commitAnimations];
}

-(void) revealDoor2{
    if (doorWinner==2) {
        imageView2=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"winner1"]];
        
    }
    else{
        imageView2=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"looser1"]];
    }
    [imageView2 setFrame:CGRectMake(0, 45, 82, 72)];
    
    [UIView beginAnimations:nil  context:nil];
    [UIView setAnimationDuration:1.5];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(transitionDidStop: finished: context:)];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:door2 cache:YES];
    [door2 addSubview:imageView2]; //Either winner or loser Graphic
    [UIView commitAnimations];
    
    
}
-(void) revealDoor3{
    if (doorWinner==3) {
        imageView2=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"winner1"]];
        
    }
    else{
        imageView2=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"looser1"]];
    }
    [imageView2 setFrame:CGRectMake(0, 45, 82, 72)];
    
    [UIView beginAnimations:nil  context:nil];
    [UIView setAnimationDuration:1.5];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(transitionDidStop: finished: context:)];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:door3 cache:YES];
    [door3 addSubview:imageView2]; //Either winner or loser Graphic
    [UIView commitAnimations];
    
    
}


- (IBAction)showResult:(id)sender {
    [self revealDoor1];
    [self revealDoor2];
    [self revealDoor3];
    showBTN.hidden=TRUE;
    resetBTN.hidden=FALSE;
    
    keepTotal.text=[[NSString alloc] initWithFormat:@"%d",keepTotalCounter];
    switchTotal.text=[[NSString alloc] initWithFormat:@"%d",switchTotalCounter];
    
    keepWin.text=[[NSString alloc] initWithFormat:@"%d",keepWinCounter];
    switchWin.text=[[NSString alloc] initWithFormat:@"%d",switchWinCounter];

    keepLoss.text=[[NSString alloc] initWithFormat:@"%d",keepLossCounter];
    switchLoss.text=[[NSString alloc] initWithFormat:@"%d",switchLossCounter];
    
    //Play Loser or Winner sound
    if(isWinner){
        AudioServicesPlaySystemSound(winSoundID);
        
    }else{
        AudioServicesPlaySystemSound(loserSoundID);
    }
}

- (IBAction)keepSwitch:(id)sender {
    if (keepSelector.selectedSegmentIndex==1) {
        if (doorRevealed==1) {
            if (playerChoice ==2 ) {
                playerChoice=3;
            }
            else {
                playerChoice = 2;
            }
            
        }
        if (doorRevealed==2) {
            if (playerChoice ==1 ) {
                playerChoice=3;
            }
            else {
                playerChoice = 1;
            }
            
        }
        if (doorRevealed==3) {
            if (playerChoice ==1 ) {
                playerChoice=2;
            }
            else {
                playerChoice = 1;
            }
        }
        [self showArrow];
        switchTotalCounter= switchTotalCounter + 1;
        if (playerChoice==doorWinner){
            switchWinCounter =switchWinCounter+1;
            isWinner=TRUE;
        }else{
            switchLossCounter=switchLossCounter+1;
            isWinner=FALSE;
        }
    }else {
        keepTotalCounter= keepTotalCounter + 1;
        if (playerChoice==doorWinner){
            keepWinCounter =keepWinCounter+1;
            isWinner=TRUE;
        }else{
            keepLossCounter=keepLossCounter+1;
            isWinner=FALSE;
        }
        
    }
    keepSelector.hidden=TRUE;
    showBTN.hidden=FALSE;
}

- (IBAction)resetGame:(id)sender {
    doorWinner = ((arc4random() % 3) + 1);
    resetBTN.hidden=TRUE;
    [self resetDoors];
    arrow1.hidden=TRUE;
    arrow2.hidden=TRUE;
    arrow3.hidden=TRUE;
    
    doorSelector.hidden=FALSE;
    selectLBL.hidden=FALSE;
    
    //resetting the doors
    [doorSelector setSelectedSegmentIndex:UISegmentedControlNoSegment];
    [keepSelector setSelectedSegmentIndex:UISegmentedControlNoSegment];
    
}
-(void) resetDoors {
    imageView1=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"door"]];
    [imageView1 setFrame:CGRectMake(0, 0, 82, 128)];
    [UIView beginAnimations:nil  context:nil];
    [UIView setAnimationDuration:1.5];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(transitionDidStop: finished: context:)];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:door1 cache:YES];
    [imageView2 removeFromSuperview];
    [door1 addSubview:imageView1];
    [UIView commitAnimations];
    
    //for door 2
    
    imageView1=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"door"]];
    [imageView1 setFrame:CGRectMake(0, 0, 82, 128)];
    [UIView beginAnimations:nil  context:nil];
    [UIView setAnimationDuration:1.5];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(transitionDidStop: finished: context:)];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:door2 cache:YES];
    [imageView2 removeFromSuperview];
    [door2 addSubview:imageView1];
    [UIView commitAnimations];
    
    //for door 3
    imageView1=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"door"]];
    [imageView1 setFrame:CGRectMake(0, 0, 82, 128)];
    [UIView beginAnimations:nil  context:nil];
    [UIView setAnimationDuration:1.5];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(transitionDidStop: finished: context:)];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:door3 cache:YES];
    [imageView2 removeFromSuperview];
    [door3 addSubview:imageView1];
    [UIView commitAnimations];
    
    
}
@end
