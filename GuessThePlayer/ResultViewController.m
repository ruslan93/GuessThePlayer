//
//  ResultViewController.m
//  GuessThePlayer
//
//  Created by Ruslan on 3/4/15.
//  Copyright (c) 2015 Ruslan Palapa. All rights reserved.
//

#import "ResultViewController.h"

@interface ResultViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentControl;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *buttons;
@property (strong, nonatomic) UIView *navigationBorder;
@property (strong, nonatomic) NSUserDefaults *userDefaults;

@end

@implementation ResultViewController

-(void) viewDidLoad{
    [super viewDidLoad];
    self.userDefaults = [NSUserDefaults standardUserDefaults];
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
    [self.navigationItem setTitle:@"Best results"];
    [self fillContent];
}
- (IBAction)segmentControlPressed:(id)sender {
    [self fillContent];
}

-(void)fillContent{
    NSString *level =[self.segmentControl titleForSegmentAtIndex:self.segmentControl.selectedSegmentIndex];
    NSArray *categories = @[@"Cars", @"Country", @"Soccer"];
    for (int i=0; i<3; i++)
        if ([self.userDefaults objectForKey:[NSString
                                             stringWithFormat:@"%@%@", categories[i],level]]!=nil)
        {
            NSNumber* value =[self.userDefaults objectForKey:
                              [NSString stringWithFormat:@"%@%@",
                               categories[i],level]];
            
            [self.buttons[i] setTitle:value.stringValue forState:UIControlStateNormal];
        }
        else [self.buttons[i] setTitle:@"none" forState:UIControlStateNormal];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
