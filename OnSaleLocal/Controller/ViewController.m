//
//  ViewController.m
//  OnSaleLocal
//
//  Created by junyuan ji on 13-9-12.
//  Copyright (c) 2013年 junyuan ji. All rights reserved.
//

#import "ViewController.h"
#import "EGORefreshTableHeaderView.h"
#import "StoryDisplayCell.h"
#import "AppDelegate.h"
#import "JASidePanelController.h"

@interface ViewController ()<EGORefreshTableHeaderDelegate>
{
    EGORefreshTableHeaderView *_refreshTableView;
    BOOL _reloading;
}
@property (nonatomic,strong) IBOutlet UITableView * TV_tableView;
@property (nonatomic,strong) NSMutableArray * dataArr;

//开始重新加载时调用的方法
- (void)reloadTableViewDataSource;
//完成加载时调用的方法
- (void)doneLoadingTableViewData;
-(IBAction)slideMenu:(id)sender;
@end

@implementation ViewController
@synthesize TV_tableView;
@synthesize dataArr;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.dataArr = [NSMutableArray arrayWithObjects:@"test下拉刷新1",@"test下拉刷新2",@"test下拉刷新3",@"test下拉刷新3",@"test下拉刷新3",@"test下拉刷新3",@"test下拉刷新3", nil];
    
    
    if (_refreshTableView == nil) {
        //初始化下拉刷新控件
        EGORefreshTableHeaderView *refreshView = [[EGORefreshTableHeaderView alloc] initWithFrame:CGRectMake(0.0f, 0.0f - self.TV_tableView.bounds.size.height, self.view.frame.size.width, self.TV_tableView.bounds.size.height)];
        refreshView.delegate = self;
        //将下拉刷新控件作为子控件添加到UITableView中
        [self.TV_tableView addSubview:refreshView];
        _refreshTableView = refreshView;
    }
    
    //test code
    ASIHTTPRequest * request = [WebService GetStoryListLatitude:37.0 longitude:122.7 radius:10 offset:0 size:20 category:@"" offer:@""];
    [request startAsynchronous];
    NSMutableData * reciveData = [NSMutableData dataWithCapacity:0];
    [request setDataReceivedBlock:^(NSData *data) {
        [reciveData appendData:data];
    }];
    [request setCompletionBlock:^{
        NSLog(@"resulkt = %@",[[NSString alloc] initWithData:reciveData encoding:4]);
    }];

}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 260;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    int countRow;
    if (self.dataArr.count%2 == 1)
    {
        countRow = self.dataArr.count/2+1;
    }
    else
    {
        countRow = self.dataArr.count/2;
    }
    return countRow;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  static NSString * cellMark = @"cell_mark";
    StoryDisplayCell * cell = (StoryDisplayCell *)[tableView dequeueReusableCellWithIdentifier:cellMark];
    if (cell == nil)
    {
        cell = [[StoryDisplayCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellMark];
    }
    if (self.dataArr.count%2 == 1)
    {
        if (indexPath.row<self.dataArr.count/2)
        {
            cell.leftView.imageView_story.image = [UIImage imageNamed:@"test.jpg"];
            cell.leftView.L_des.text = @"Chick warp 2 for 1 ,10 preson ";
            cell.leftView.TF_time.text = @"Expire:10/26/2013";
            cell.leftView.L_Meter.text = @"0.3 mile";
            
            cell.rightView.imageView_story.image = [UIImage imageNamed:@"test.jpg"];
            cell.rightView.L_des.text = @"Chick warp 2 for 1 ,10 preson ";
            cell.rightView.TF_time.text = @"Expire:10/26/2013";
            cell.rightView.L_Meter.text = @"0.3 mile";
            cell.rightView.alpha = 1.0;
        }
        else
        {
            cell.leftView.imageView_story.image = [UIImage imageNamed:@"test.jpg"];
            cell.leftView.L_des.text = @"Chick warp 2 for 1 ,10 preson ";
            cell.leftView.L_Meter.text = @"0.3 mile";
            cell.leftView.TF_time.text = @"Expire:10/26/2013";
            cell.rightView.alpha = 0.0;
        }
    }
    else
    {
        cell.leftView.imageView_story.image = [UIImage imageNamed:@"test.jpg"];
        cell.leftView.L_des.text = @"Chick warp 2 for 1 ,10 preson ";
        cell.leftView.L_Meter.text = @"0.3 mile";
        
        cell.rightView.imageView_story.image = [UIImage imageNamed:@"test.jpg"];
        cell.rightView.L_des.text = @"Chick warp 2 for 1 ,10 preson ";
        cell.rightView.L_Meter.text = @"0.3 mile";
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (void)reloadTableViewDataSource
{
    _reloading = YES;
    [NSThread detachNewThreadSelector:@selector(doInBackground) toTarget:self withObject:nil];
}

//完成加载时调用的方法
- (void)doneLoadingTableViewData
{
    _reloading = NO;
    [_refreshTableView egoRefreshScrollViewDataSourceDidFinishedLoading:self.TV_tableView];
    [self.TV_tableView reloadData];
}
-(void)doInBackground
{
    [NSThread sleepForTimeInterval:3];
    //
    //此处code
    [self performSelectorOnMainThread:@selector(doneLoadingTableViewData) withObject:nil waitUntilDone:YES];
}
-(void)egoRefreshTableHeaderDidTriggerRefresh:(EGORefreshTableHeaderView *)view
{
    [self reloadTableViewDataSource];
}

-(BOOL)egoRefreshTableHeaderDataSourceIsLoading:(EGORefreshTableHeaderView *)view
{
    return _reloading;
}

-(NSDate *)egoRefreshTableHeaderDataSourceLastUpdated:(EGORefreshTableHeaderView *)view
{
    return [NSDate date];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [_refreshTableView egoRefreshScrollViewDidScroll:scrollView];
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [_refreshTableView egoRefreshScrollViewDidEndDragging:scrollView];
}
-(IBAction)slideMenu:(id)sender
{
    AppDelegate * delegate = [UIApplication sharedApplication].delegate;
    JASidePanelController * controller = (JASidePanelController *)delegate.viewController1;
    [controller showLeftPanelAnimated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
