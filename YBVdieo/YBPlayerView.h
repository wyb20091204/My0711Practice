//
//  YBPlayerView.h
//  YBVdieo
//
//  Created by lanou3g on 16/4/26.
//  Copyright © 2016年 蓝鸥科技. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>


@interface YBPlayerView : UIView

/**
 *  暂停
 */
@property (strong,nonatomic)UIButton *pauseBut;
@property (strong,nonatomic)UIButton *nextBut;

/**
 *  进度条
 */
@property (strong,nonatomic)UISlider *progressSlider;
/**
 *  左边实时时间
 */
@property (strong,nonatomic)UILabel  *leftTimeLB;
@property (strong,nonatomic)UILabel *midTimeLineLB;
/**
 *  右边总时间
 */
@property (strong,nonatomic)UILabel  *rightTimeLB;
/**
 *  音量线
 */
@property (strong,nonatomic)UIImageView  *voidLineImgView;
/**
 *  亮度线
 */
@property (strong,nonatomic)UIImageView  *lightLineImgView;
/**
 *  视频标题
 */
@property (strong,nonatomic)UILabel *titleLB;
/**
 *  亮度灯
 */
@property (strong,nonatomic)UIImageView *lightBulbImgView;
/**
 *  高音量灯
 */
@property (strong,nonatomic)UIImageView *voiceHightimgView;
/**
 *  低音量
 */
@property (strong,nonatomic)UIImageView *voiceLowImgView;
/**
 *  锁定屏幕
 */
@property (strong,nonatomic)UIButton *lockBut;
/**
 *  暂停播放
 */
@property (strong,nonatomic)UIButton *fullOrReduceBut;
/**
 *  全屏
 */
@property (strong,nonatomic)UIButton *toFullBut;

/**
 *  返回
 */
@property (strong,nonatomic)UIButton *backBut;
/**
 *  下载
 */
@property (strong,nonatomic)UIButton *dowloadBut;
/**
 *  更多
 */
@property (strong,nonatomic)UIButton *moreBut;
/**
 *  暂停的大图
 */
@property (strong,nonatomic)UIButton *bigPauseBut;

@property (strong,nonatomic)UIVisualEffectView *visualEffectBelowView;
@property (strong,nonatomic)UIVisualEffectView *visualEffectTopView;
/**
 *  顶部的ButtonsView
 */
@property (strong,nonatomic)UIView *topView;
/**
 *  底部的ButtonsView
 */
@property (strong,nonatomic)UIView *belowView;
/**
 *  是否为play状态
 */
@property (assign,nonatomic)BOOL	 *isPlaying;


- (instancetype)initWithFrame:(CGRect)frame URLString:(NSString *)urlString;

@end
