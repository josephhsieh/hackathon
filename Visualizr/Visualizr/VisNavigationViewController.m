//
//  VisNavigationViewController.m
//  Visualizr
//
//  Created by Jeff DeButte on 2014-02-26.
//  Copyright (c) 2014 Jeff DeButte. All rights reserved.
//

#import "VisNavigationViewController.h"

@interface VisNavigationViewController ()

@end

@implementation VisNavigationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"Loaded nav controller");
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
