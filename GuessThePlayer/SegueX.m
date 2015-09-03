//
//  SegueX.m
//  GuessThePlayer
//
//  Created by Ruslan on 3/3/15.
//  Copyright (c) 2015 Ruslan Palapa. All rights reserved.
//

#import "SegueX.h"


@implementation SegueX

- (void)perform
{
    CATransition* transition = [CATransition animation];
    
    transition.duration = 0.3;
    transition.type = kCATransitionReveal;
    
    [[self.sourceViewController navigationController].view.layer addAnimation:transition forKey:kCATransition];
    [[self.sourceViewController navigationController] pushViewController:[self destinationViewController] animated:YES];
}

@end