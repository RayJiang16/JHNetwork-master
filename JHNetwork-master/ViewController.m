//
//  ViewController.m
//  JHNetwork-master
//
//  Created by Ray on 2018/3/20.
//  Copyright © 2018年 ray. All rights reserved.
//

#import "ViewController.h"
#import "JHLoginEngine.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [JHLoginEngine loginWithUserName:@"aaa" pwd:@"bbb" handler:^(JHResponseModel *response) {
        NSLog(@"%@", response);
    }];
}

@end
