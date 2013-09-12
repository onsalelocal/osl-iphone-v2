//
//  Globle.h
//  OnSaleLocal
//
//  Created by junyuan ji on 13-9-11.
//  Copyright (c) 2013年 junyuan ji. All rights reserved.
//

#ifndef OnSaleLocal_Globle_h
#define OnSaleLocal_Globle_h

#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO) //判断是否是iPhone5
#define iPad ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad?YES:NO)//判断是手机还是PAD
#import "MyActivceView.h"

#endif
