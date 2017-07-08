//
//  FFTabbarController.m
//  tabbarex
//
//  Created by nonoking on 2017/6/25.
//  Copyright © 2017年 nonoking. All rights reserved.
//

#import "FFTabbarController.h"
#import "TabbarItems.h"
#import "FFNavigationController.h"

@interface FFTabbarController ()

@end

@implementation FFTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    [self vcRegistNotific];
    [self vcLoadDatasourse];
}

#pragma mark - 设置ui
- (void)setupUI
{
    
}

#pragma mark - 设置数据
- (void)vcLoadDatasourse
{
    
}

#pragma mark - 注册通知和实现
- (void)vcRegistNotific
{
    
}

#pragma mark - 懒加载

#pragma mark - 点击事件

#pragma mark - 业务逻辑
- (void)addChildVcWithPath:(NSString *)itemPath
{
    NSArray *items = [TabbarItems getItems:itemPath];
    for (TabbarItems *item in items) {
        [self addChildVc:item.vcName title:item.vcTitle image:item.normalIcon selectedImage:item.selectedIcon];
    }
}
#pragma mark 添加一个子控制器 子控制器,标题,图片,选中的图片
- (void)addChildVc:(NSString *)classNmae title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    
    Class vcClass = NSClassFromString(classNmae);
    
    UIViewController *childVc = (UIViewController *)[[vcClass alloc]init];
    
    // 设置子控制器的文字
    childVc.title = title; // 同时设置tabbar和navigationBar的文字
    
    // 设置子控制器的图片
    childVc.tabBarItem.image = [UIImage imageNamed:image];
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 设置文字的样式
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    NSMutableDictionary *selectTextAttrs = [NSMutableDictionary dictionary];
    selectTextAttrs[NSForegroundColorAttributeName] = [UIColor redColor];
    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [childVc.tabBarItem setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];
    
    // 先给外面传进来的小控制器 包装 一个导航控制器
    FFNavigationController *nav = [[FFNavigationController alloc] initWithRootViewController:childVc];
    // 添加为子控制器
    [self addChildViewController:nav];
    
}

#pragma mark - 自定义代理
@end
