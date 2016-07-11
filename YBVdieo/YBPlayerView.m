//
//  YBPlayerView.m
//  YBVdieo
//
//  Created by lanou3g on 16/4/26.
//  Copyright © 2016年 蓝鸥科技. All rights reserved.
//

#import "YBPlayerView.h"
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kHeight self.bounds.size.height
#define kWidth self.bounds.size.width

@interface YBPlayerView	()

@property (strong,nonatomic)AVPlayer *playerYB;
@property (strong,nonatomic)AVPlayerViewController *playerVCYB;

@end

@implementation YBPlayerView

- (instancetype)initWithFrame:(CGRect)frame URLString:(NSString *)urlString
{
	self = [super initWithFrame:frame];
	if (self) {
//		PlayerView
		AVPlayerItem *item = [[AVPlayerItem alloc] initWithURL:[NSURL URLWithString:urlString]];
		self.playerYB = [AVPlayer playerWithPlayerItem:item];
		self.playerVCYB = [AVPlayerViewController new];
		self.playerVCYB.player = self.playerYB;
		self.playerVCYB.view.frame = self.bounds;
		self.playerVCYB.showsPlaybackControls = NO;
		
//		上模糊
		UIBlurEffect *blurEffectTop = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
		self.visualEffectTopView = [[UIVisualEffectView alloc] initWithEffect:blurEffectTop];
		self.visualEffectTopView.frame = CGRectMake(0, 0, kWidth,50);
		//visualEffectViewTop.hidden = YES;
		[self.playerVCYB.view addSubview:self.visualEffectTopView];
//		下模糊
		UIBlurEffect *blurEffectBelow = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
		self.visualEffectBelowView = [[UIVisualEffectView alloc] initWithEffect:blurEffectBelow];
		self.visualEffectBelowView.frame = CGRectMake(0, kHeight - 50, kWidth,50);
		//visualEffectViewBelow.hidden = YES;
		[self.playerVCYB.view addSubview:self.visualEffectBelowView];
//		中间大暂停
		self.bigPauseBut = [UIButton buttonWithType:UIButtonTypeCustom];
		self.bigPauseBut.frame = CGRectMake(0, 0, 50, 50);
		self.bigPauseBut.center = CGPointMake(kWidth / 2, kHeight /2);
		//self.bigPauseBut.hidden = YES;
		[self.bigPauseBut setImage:[UIImage imageNamed:@"pgc_play_btn@2x"] forState:UIControlStateNormal];
		[self.playerVCYB.view addSubview:self.bigPauseBut];
//		亮度
		self.lightBulbImgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 70, 30, 30)];
		self.lightBulbImgView.image = [UIImage imageNamed:@"play_new_brightness_day"];
		[self.playerVCYB.view addSubview:self.lightBulbImgView];
//		大音量
		self.voiceHightimgView = [[UIImageView alloc] initWithFrame:CGRectMake(kWidth - 40, kHeight / 2 - 80, 30, 30)];
		self.voiceHightimgView.image = [UIImage imageNamed:@"player_ctr_voice_btn"];
		[self.playerVCYB.view addSubview:self.voiceHightimgView];
//		小音量
		self.voiceLowImgView = [[UIImageView alloc] initWithFrame:CGRectMake(kWidth - 40, kHeight - 100, 30, 30)];
		self.voiceLowImgView.image = [UIImage imageNamed:@"player_ctrl_mute_btn"];
		[self.playerVCYB.view addSubview:self.voiceLowImgView];
//		亮度条
		self.lightLineImgView = [[UIImageView alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(self.lightBulbImgView.frame) + 20, 10, kHeight - 240)];
		self.lightLineImgView.image = [UIImage imageNamed:@"download_detailcellbg@2x"];
		[self.playerVCYB.view addSubview:self.lightLineImgView];
//		音量条
		self.voidLineImgView = [[UIImageView alloc] initWithFrame:CGRectMake(kWidth - 30, CGRectGetMaxY(self.lightBulbImgView.frame) + 20, 10, kHeight - 240)];
		self.voidLineImgView.image = [UIImage imageNamed:@"navbar_split"];
		[self.playerVCYB.view addSubview:self.voidLineImgView];
		
		[self drawTopButtons];	// 画上部分Buttons
		[self drawBelowButtons];// 画下部分Buttons
		[self addSubview:self.playerVCYB.view];
		
	}
	return self;
}
- (void)drawTopButtons{
//	锁
	self.lockBut = [UIButton buttonWithType:UIButtonTypeCustom];
	self.lockBut.frame = CGRectMake(kWidth - 150 ,0 , 50, 50);
	[self.lockBut setImage:[UIImage imageNamed:@"play_lock@2x"] forState:UIControlStateNormal];
	[self.visualEffectTopView addSubview:self.lockBut];
//	返回
	self.backBut = [UIButton buttonWithType:UIButtonTypeCustom];
	self.backBut.frame = CGRectMake(0, 0, 50, 50);
	[self.backBut setImage:[UIImage imageNamed:@"user_back@2x"] forState:UIControlStateNormal];
	[self.visualEffectTopView addSubview:self.backBut];
//	下载
	self.dowloadBut = [UIButton buttonWithType:UIButtonTypeCustom];
	self.dowloadBut.frame = CGRectMake(kWidth - 100, 0, 50, 50);
	[self.dowloadBut setImage:[UIImage imageNamed:@"player_vod_download"] forState:UIControlStateNormal];
	[self.visualEffectTopView addSubview:self.dowloadBut];
//  标题
	self.titleLB = [[UILabel alloc] initWithFrame:CGRectMake(50, 0, kWidth - 200, 50)];
	self.titleLB.text = @"视频标题";
	self.titleLB.textAlignment = NSTextAlignmentLeft;
	[self.visualEffectTopView addSubview:self.titleLB];
//	更多
	self.moreBut = [UIButton buttonWithType:UIButtonTypeCustom];
	self.moreBut.frame = CGRectMake(kWidth - 50, 0, 50, 50);
	[self.moreBut setImage:[UIImage imageNamed:@"upload_ic_menu@3x"] forState:UIControlStateNormal];
	[self.visualEffectTopView addSubview:self.moreBut];
	
	
	
}

- (void)makeProgress:(UISlider *)slider{
	
}

- (void)drawBelowButtons{
//	暂停
	self.pauseBut = [UIButton buttonWithType:UIButtonTypeCustom];
	self.pauseBut.frame = CGRectMake(10, 20, 30, 30);
	[self.pauseBut setImage:[UIImage imageNamed:@"pgc_play_btn@2x"] forState:UIControlStateNormal];
	[self.visualEffectBelowView addSubview:self.pauseBut];
//  下一集
	self.nextBut = [UIButton buttonWithType:UIButtonTypeCustom];
	self.nextBut.frame = CGRectMake(50, 20, 30, 30);
	[self.nextBut setImage:[UIImage imageNamed:@"player_next@2x"] forState:UIControlStateNormal];
	[self.visualEffectBelowView addSubview:self.nextBut];
	
//	进度条
	self.progressSlider = [[UISlider alloc] initWithFrame:CGRectMake(0, 0, kWidth, 20)];
	self.progressSlider.center = CGPointMake(kWidth / 2, 10);
	[self.progressSlider setThumbImage:[UIImage imageNamed:@"upload_ic_drag@2x"] forState:UIControlStateNormal];
	self.progressSlider.minimumTrackTintColor = [UIColor magentaColor];
	[self.progressSlider addTarget:self action:@selector(makeProgress:) forControlEvents:UIControlEventValueChanged];
	[self.visualEffectBelowView addSubview:self.progressSlider];
//	左边进度时间
	self.leftTimeLB = [[UILabel alloc] initWithFrame:CGRectMake(90, 20, 60, 30)];
	self.leftTimeLB.text = @"00:00:00";
	self.leftTimeLB.textAlignment = NSTextAlignmentRight;
	self.leftTimeLB.font = [UIFont systemFontOfSize:13];
	[self.visualEffectBelowView addSubview:self.leftTimeLB];
//	时间中间的间隔线
	self.midTimeLineLB = [[UILabel alloc] initWithFrame:CGRectMake(150, 20, 10, 30)];
	self.midTimeLineLB.text = @"/";
	self.midTimeLineLB.textAlignment = NSTextAlignmentCenter;
	self.midTimeLineLB.font = [UIFont systemFontOfSize:13];
	[self.visualEffectBelowView addSubview:self.midTimeLineLB];
//	右边总时长
	self.rightTimeLB = [[UILabel alloc] initWithFrame:CGRectMake(160,20, 60, 30)];
	self.rightTimeLB.text = @"99:99:99";
	self.rightTimeLB.textAlignment = NSTextAlignmentLeft;
	self.rightTimeLB.font = [UIFont systemFontOfSize:13];
	[self.visualEffectBelowView addSubview:self.rightTimeLB];
//	全屏
	self.toFullBut = [UIButton buttonWithType:UIButtonTypeCustom];
	self.toFullBut.frame = CGRectMake(kWidth - 30, 20, 30, 30);
	[self.toFullBut setImage:[UIImage imageNamed:@"player_full@2x"] forState:UIControlStateNormal];
	[self.visualEffectBelowView addSubview:self.toFullBut];
	
}



@end
