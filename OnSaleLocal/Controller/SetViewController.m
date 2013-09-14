//
//  SetViewController.m
//  OnSaleLocal
//
//  Created by junyuan ji on 13-9-12.
//  Copyright (c) 2013年 junyuan ji. All rights reserved.
//

#import "SetViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface SetViewController ()
@property (nonatomic,strong) IBOutlet UISearchBar * searchBar;
@property (nonatomic,strong) IBOutlet UIImageView * topImageView;
@property (nonatomic,strong) IBOutlet UITableView * TV_tableview;
@property (nonatomic,strong) NSMutableArray * dataArr;
-(IBAction)signInClick:(id)sender;
-(IBAction)registerClick:(id)sender;

@end

@implementation SetViewController
@synthesize dataArr;

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
    
    UIView *view1 =[ [UIView alloc]init];
    view1.backgroundColor = [UIColor clearColor];
    [self.TV_tableview setTableFooterView:view1];
    
    //not login
    self.dataArr = [NSMutableArray arrayWithObjects:@"TREND",@"CATEGORIES",@"SHARE",@"CHANGE LOCATION",@"ABOUT", nil];
    
}
-(IBAction)signInClick:(id)sender
{
  
}
-(IBAction)registerClick:(id)sender
{

}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * mark = @"markCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:mark];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:mark];
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.accessoryView.backgroundColor = [UIColor whiteColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    UITextField * tf = [[UITextField alloc] initWithFrame:CGRectMake(10, 12, 20, 20)];
    tf.layer.borderColor = [UIColor whiteColor].CGColor;
    tf.layer.borderWidth = 1;
    [cell addSubview:tf];
    
    UILabel * title = [[UILabel alloc] initWithFrame:CGRectMake(40, 7, 150, 30)];
    title.font = [UIFont systemFontOfSize:15];
    title.textColor = [UIColor whiteColor];
    title.backgroundColor = [UIColor clearColor];
    title.text = [NSString stringWithFormat:@"%@",[self.dataArr objectAtIndex:indexPath.row]];
    [cell addSubview:title];
    return cell;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
