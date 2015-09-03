//
//  SelectViewController.m
//  GuessThePlayer
//
//  Created by Ruslan on 3/4/15.
//  Copyright (c) 2015 Ruslan Palapa. All rights reserved.
//

#import "SelectViewController.h"
#import "RootViewController.h"
@interface SelectViewController ()
@property (strong, nonatomic) UIView *navigationBorder;
@end

@implementation SelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // #Set navigation bar opacity
    [[self navigationController] setNavigationBarHidden:NO animated:NO];
    [self.navigationController.navigationBar setTranslucent:YES];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.view.backgroundColor = [UIColor clearColor];
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];
    self.navigationController.navigationBar.backgroundColor = [UIColor clearColor];
    // #end
    
}

- (IBAction)buttonSetLevel:(UIButton*)sender {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    switch (sender.tag) {
        case 0:
            [userDefaults setObject:@"Easy" forKey:@"Level"];
            break;
        case 1:
            [userDefaults setObject:@"Normal" forKey:@"Level"];
            break;
        case 2:
            [userDefaults setObject:@"Hard" forKey:@"Level"];
            break;
    }
    [self.navigationController popViewControllerAnimated:YES];
}



-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation{
    [self.navigationBorder removeFromSuperview];
    UINavigationBar *navigationBar = self.navigationController.navigationBar;
    self.navigationBorder = [[UIView alloc] initWithFrame:CGRectMake(0,navigationBar.frame.size.height-1,navigationBar.frame.size.width, 1)];
    // Change the frame size
    [self.navigationBorder setBackgroundColor:[UIColor greenColor]];
    [self.navigationBorder setOpaque:YES];
    [self.navigationController.navigationBar addSubview:self.navigationBorder];
    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    // # Add bottom border to navigation bar
    UINavigationBar *navigationBar = self.navigationController.navigationBar;
    self.navigationBorder = [[UIView alloc] initWithFrame:CGRectMake(0,navigationBar.frame.size.height-1,navigationBar.frame.size.width, 1)];
    // Change the frame size
    [self.navigationBorder setBackgroundColor:[UIColor greenColor]];
    [self.navigationBorder setOpaque:YES];
    [self.navigationController.navigationBar addSubview:self.navigationBorder];
    [self.navigationController.navigationBar setTintColor:[UIColor greenColor]];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor greenColor]};
    [self.navigationItem setTitle:@"Select category"];

}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationBorder removeFromSuperview];
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
        RootViewController *controller = [segue destinationViewController];
        [controller setCategory:[segue identifier]];
}

@end
