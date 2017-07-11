//
//  ViewController.m
//  MinionsOFO
//
//  Created by QFWangLP on 2017/7/10.
//  Copyright © 2017年 leefenghy. All rights reserved.
//

#import "ViewController.h"
#import "OFOMinionesView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    OFOMinionesView *minionsView = [[OFOMinionesView alloc] initWithFrame:CGRectMake(0, 0, 190, 190)];
    minionsView.center = self.view.center;
    [self.view addSubview:minionsView];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
