//
//  StorycellView.h
//  OnSaleLocal
//
//  Created by tiankong360 on 13-9-13.
//  Copyright (c) 2013年 junyuan ji. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StorycellView : UIView
@property (nonatomic,strong) UIImageView * imageView_story;
@property (nonatomic,strong) UILabel * L_des;
@property (nonatomic,strong) UITextField * TF_time;
@property (nonatomic,strong) UILabel * L_Meter;
@property (nonatomic,strong) UILabel * L_collNum;
@property (nonatomic,strong) UIButton * Btn_share;
@property (nonatomic,strong) UIButton * Btn_collect;

@property (nonatomic,strong) NSString * idStr;
@end
