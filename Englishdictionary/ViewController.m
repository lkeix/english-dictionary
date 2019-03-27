//
//  ViewController.m
//  Englishdictionary
//
//  Created by 中村圭助 on 2019/03/22.
//  Copyright © 2019年 中村圭助. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [self definenav];
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) definenav{
    RootViewController *rootViewController = [[RootViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:rootViewController];
}
@end
