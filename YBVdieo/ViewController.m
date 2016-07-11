//
//  ViewController.m
//  YBVdieo
//
//  Created by lanou3g on 16/4/26.
//  Copyright © 2016年 蓝鸥科技. All rights reserved.
//

#import "ViewController.h"
#import "YBPlayerView.h"
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kMP4_URL @"http://dd.yinyuetai.com/uploads/videos/common/9CB00154421D3966D6A52374737DEEDF.mp4?sc=ba429cd48fedf72c&br=405&rd=Android"

@interface ViewController ()



@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	YBPlayerView *ybPlayerView = [[YBPlayerView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 300) URLString:kMP4_URL];
	ybPlayerView.center = CGPointMake(kScreenWidth / 2, 200);
	[self.view addSubview:ybPlayerView];
	
	
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
	
	
	
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
