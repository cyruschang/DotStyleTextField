//
//  ViewController.m
//  DotStyleTextField
//
//  Created by ChangLuyang on 2018/5/2.
//  Copyright © 2018年 ChangLuyang. All rights reserved.
//

#import "ViewController.h"
#import "DotStyleTextField.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initUI];
}

- (void)initUI {
    self.view.backgroundColor = [UIColor whiteColor];
    
    DotStyleTextField *dstf = [[DotStyleTextField alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - 265 / 2, 100, 265, 70)];
    dstf.inputFinishHandler = ^(DotStyleTextField *textField, NSString *inputText) {
        NSLog(@"输入的是%@", inputText);
    };
    [self.view addSubview:dstf];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
