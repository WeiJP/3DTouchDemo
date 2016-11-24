//
//  ViewController.m
//  3DTouchDemo
//
//  Created by use on 16/2/18.
//  Copyright © 2016年 wjp. All rights reserved.
//

#import "ViewController.h"
#import "SubViewController.h"

#define __kScreenWidth [UIScreen mainScreen].bounds.size.width
#define __kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UIViewControllerPreviewingDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self registerForPreviewingWithDelegate:self sourceView:self.view];
    
    // 创建标签的ICON图标。
    UIApplicationShortcutIcon *icon = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeAdd];
    // 创建一个标签，并配置相关属性。
    UIApplicationShortcutItem *item = [[UIApplicationShortcutItem alloc] initWithType:@"two" localizedTitle:@"么么哒" localizedSubtitle:@"爱你呦" icon:icon userInfo:nil];
    // 将标签添加进Application的shortcutItems中。
//    [UIApplication sharedApplication].shortcutItems = @[item];
    
    // 创建标签的ICON图标。
    UIApplicationShortcutIcon *icon2 = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeAdd];
    // 创建一个标签，并配置相关属性。
    UIApplicationShortcutItem *item2 = [[UIApplicationShortcutItem alloc] initWithType:@"one" localizedTitle:@"呵呵哒" localizedSubtitle:@"无聊哦" icon:icon2 userInfo:nil];
    // 将标签添加进Application的shortcutItems中。
    [UIApplication sharedApplication].shortcutItems = @[item, item2];
}

- (UIViewController *)previewingContext:(id<UIViewControllerPreviewing>)context viewControllerForLocation:(CGPoint) point
{
    UIViewController *childVC = [[UIViewController alloc] init];
//    childVC.preferredContentSize = CGSizeMake(0, 500);
    
    CGRect rect = CGRectMake(10, point.y - 10, self.view.frame.size.width - 20,20);
    context.sourceRect = rect;
    
    // 加个白色背景
    UIView *bgView =[[UIView alloc] initWithFrame:CGRectMake(20, 10, __kScreenWidth - 40, __kScreenHeight - 20 - 64 * 2)];
    bgView.backgroundColor = [UIColor whiteColor];
    bgView.layer.cornerRadius = 10;
    bgView.clipsToBounds = YES;
    [childVC.view addSubview:bgView];
    
    // 加个lable
    UILabel *lable = [[UILabel alloc] initWithFrame:bgView.bounds];
    lable.textAlignment = NSTextAlignmentCenter;
    lable.text = @"有种再按重一点...";
    [bgView addSubview:lable];
    
    return childVC;
}

- (void)previewContext:(id<UIViewControllerPreviewing>)context commitViewController:(UIViewController*)vc
{
    [self showViewController:vc sender:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
