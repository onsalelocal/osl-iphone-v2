//
//  StorycellView.m
//  OnSaleLocal
//
//  Created by tiankong360 on 13-9-13.
//  Copyright (c) 2013年 junyuan ji. All rights reserved.
//

#import "StorycellView.h"
#import <QuartzCore/QuartzCore.h>

@implementation StorycellView
@synthesize L_collNum;
@synthesize L_des;
@synthesize L_Meter;
@synthesize TF_time;
@synthesize imageView_story;
@synthesize Btn_collect;
@synthesize Btn_share;

@synthesize idStr;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1.0];
        UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 144, 100)];
        self.imageView_story = imageView;
        [self addSubview:imageView];
        
        UILabel * des = [[UILabel alloc] initWithFrame:CGRectMake(8, 105, 128, 40)];
        des.textColor = [UIColor blackColor];
        des.font = [UIFont systemFontOfSize:14];
        des.numberOfLines = 2;
        des.backgroundColor = [UIColor clearColor];
        self.L_des = des;
        [self addSubview:des];
        
        UITextField * textfield = [[UITextField alloc] initWithFrame:CGRectMake(8, 150, 120, 20)];
        textfield.textColor = [UIColor colorWithRed:127.0/255.0 green:127.0/255.0 blue:127.0/255.0 alpha:1.0];
        textfield.layer.borderWidth = 1;
        textfield.font = [UIFont systemFontOfSize:13];
        textfield.layer.borderColor =[UIColor colorWithRed:127.0/255.0 green:127.0/255.0 blue:127.0/255.0 alpha:1.0].CGColor;
        textfield.userInteractionEnabled = NO;
        self.TF_time = textfield;
        [self addSubview:textfield];
        
        UILabel * safewayLab = [[UILabel alloc] initWithFrame:CGRectMake(8, 175, 55, 30)];
        safewayLab.backgroundColor = [UIColor clearColor];
        safewayLab.textColor = [UIColor blackColor];
        safewayLab.text = @"Safeway";
        safewayLab.font = [UIFont systemFontOfSize:14];
        [self addSubview:safewayLab];
        
        UIImageView * adressImage = [[UIImageView alloc] initWithFrame:CGRectMake(65, 175, 30, 30)];
        adressImage.image = [UIImage imageNamed:@"mapT.png"];
        [self addSubview:adressImage];
        
        UILabel * distanceLab = [[UILabel alloc] initWithFrame:CGRectMake(90, 175, 65, 30)];
        distanceLab.backgroundColor = [UIColor clearColor];
        distanceLab.textColor = [UIColor blackColor];
        distanceLab.text = @"0.2 mile";
        distanceLab.font = [UIFont systemFontOfSize:14];
        [self addSubview:distanceLab];
        
        UIButton * shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.Btn_share = shareBtn;
        [shareBtn setImage:[UIImage imageNamed:@"collect.png"] forState:UIControlStateNormal];
        shareBtn.frame = CGRectMake(20, 205, 30, 25);
        [self addSubview:shareBtn];
        
        UIButton * collectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.Btn_collect = collectBtn;
        [collectBtn setImage:[UIImage imageNamed:@"hart.png"] forState:UIControlStateNormal];
        collectBtn.frame = CGRectMake(80, 205, 30, 25);
        [self addSubview:collectBtn];
        
        UILabel * number = [[UILabel alloc] initWithFrame:CGRectMake(110, 205, 34, 25)];
        number.backgroundColor = [UIColor clearColor];
        number.textColor = [UIColor blackColor];
        number.text = @"100";
        number.font = [UIFont systemFontOfSize:14];
        [self addSubview:number];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{

}
*/

@end
