//
//  ViewController.m
//  GuessThePlayer
//
//  Created by Ruslan on 3/3/15.
//  Copyright (c) 2015 Ruslan Palapa. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
@interface ViewController ()
@property (strong) AppDelegate *appDelegate;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.appDelegate=[[UIApplication sharedApplication]delegate];
    // #Set navigation bar opacity
    [[self navigationController] setNavigationBarHidden:NO animated:NO];
    [self.navigationController.navigationBar setTranslucent:YES];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.view.backgroundColor = [UIColor clearColor];
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];
    self.navigationController.navigationBar.backgroundColor = [UIColor clearColor];
        // Do any additional setup after loading the view, typically from a nib.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[self navigationController] setNavigationBarHidden:YES animated:NO];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)playOrPauseButton:(UIButton*)sender{
    BOOL isPlaying = [self.appDelegate changeImage];
    UIImage *image = [UIImage imageNamed:@"11888"];
    UIImage *play = [UIImage imageNamed:@"5650"];

    if (isPlaying)
        [sender setBackgroundImage:play forState:UIControlStateNormal];
    else [sender setBackgroundImage:image forState:UIControlStateNormal];


}
@end
