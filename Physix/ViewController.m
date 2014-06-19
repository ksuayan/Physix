//
//  ViewController.m
//  Physix
//
//  Created by Kyo Suayan on 6/15/14.
//  Copyright (c) 2014 Kyo Suayan. All rights reserved.
//

#import "ViewController.h"
#import "MyScene.h"

@implementation ViewController

CADisplayLink* displayLink;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Configure the view.
    SKView * skView = (SKView *)self.view;
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
    
    // Create and configure the scene.
    SKScene * scene = [MyScene sceneWithSize:skView.bounds.size];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    
    // Present the scene.
    [skView presentScene:scene];
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}


-(void) viewWillDisappear:(BOOL)animated
{
    [displayLink invalidate];
    displayLink = nil;
    
    [super viewWillDisappear: animated];
}

- (void) update:(CADisplayLink*)displayLink {
    // The screen's just updated; update the game
    NSLog(@"Updated from display link!");
}

@end
