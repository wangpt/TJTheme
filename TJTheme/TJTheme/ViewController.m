//
//  ViewController.m
//  TJTheme
//
//  Created by tao on 2018/9/17.
//  Copyright © 2018年 tao. All rights reserved.
//

#import "ViewController.h"
#import <DKNightVersion/DKNightVersion.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //DKColorTable.txt 修改
    NSArray *themes = @[@"white",@"night",@"red",@"yellow"];
    NSMutableArray *buttons = @[].mutableCopy;
    for (int i = 0; i < themes.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0, 0, 200, 50);
        button.center = CGPointMake(self.view.frame.size.width / 2, i * 60 + 160);
        button.tag = i;
        [button setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        [button setTitle:themes[i] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttconClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
        [buttons addObject:button];
    }
    self.view.dk_backgroundColorPicker = DKColorPickerWithKey(TJBG);
    UIButton *button = buttons.lastObject;
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 50)];
    [self.view addSubview:titleLabel];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.center = CGPointMake(self.view.frame.size.width / 2, CGRectGetMaxY(button.frame) + 160);
    titleLabel.text = @"演示文字";
    titleLabel.dk_textColorPicker = DKColorPickerWithRGB(0x343434, 0xffffff, 0xffffff,0x343434);
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    imageView.center = CGPointMake(self.view.frame.size.width / 2, CGRectGetMaxY(titleLabel.frame) + 50);
    imageView.dk_imagePicker = DKImagePickerWithNames(@"night", @"normal", @"night1",@"normal1");
    imageView.dk_alphaPicker = DKAlphaPickerWithAlphas(1.f, 0.8f, 0.1f,1.f);
    [self.view addSubview:imageView];
}

- (void)buttconClick:(UIButton *)button{
    switch (button.tag) {
        case 0:
            [self.dk_manager dawnComing];
            break;
        case 1:
            [self.dk_manager nightFalling];
            break;
        case 2:
            self.dk_manager.themeVersion = @"RED";
            break;
        default:
            self.dk_manager.themeVersion = @"YELLOW";
            break;
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
