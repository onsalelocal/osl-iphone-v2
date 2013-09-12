//
//  SetViewController.m
//  OnSaleLocal
//
//  Created by junyuan ji on 13-9-12.
//  Copyright (c) 2013年 junyuan ji. All rights reserved.
//

#import "SetViewController.h"

@interface SetViewController ()
@property (nonatomic,strong) IBOutlet UISearchBar * searchBar;
@property (nonatomic,strong) IBOutlet UIImageView * topImageView;
@property (nonatomic,strong) IBOutlet UITableView * TV_tableview;
-(IBAction)signInClick:(id)sender;
-(IBAction)registerClick:(id)sender;

@end

@implementation SetViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
       
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //去searchBar背景
    for (UIView *subview in self.searchBar.subviews)    
    {
        if ([subview isKindOfClass:NSClassFromString(@"UISearchBarBackground")])  
        { 
            [subview removeFromSuperview];  
            break;   
        }  
    }
    
    
}
-(IBAction)signInClick:(id)sender
{
  
}
-(IBAction)registerClick:(id)sender
{

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
