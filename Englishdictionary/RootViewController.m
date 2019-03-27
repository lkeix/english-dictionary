//
//  TestViewController.m
//  UI
//
//  Created by 中村圭助 on 2019/03/11.
//  Copyright © 2019年 中村圭助. All rights reserved.
//

#import "RootViewController.h"
#import "SqlController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (id)init
{
    if (self) {
        self.title = @"ホーム";
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self defineRoot];
    [SqlController handleDatabaseWithSql:@"select * from WORD"];
    // [SqlController handleDatabaseWithSql:@""];
}

- (void)defineRoot{
    [self.navigationController setToolbarHidden:NO animated:NO];
    [self setBackground];
}

- (void) setBackground{
    [self setUI];
    self.view.backgroundColor = UIColor.whiteColor;
}

- (void) setUI{
    [self createLabel];
    
    [self createToolItem];
}

- (void) createToolItem{
    
    // スペーサを生成する
    UIBarButtonItem *spacer = [[UIBarButtonItem alloc]
                               initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                               target:nil action:nil];
    
    // 削除ボタンを生成する
    UIBarButtonItem *del = [[UIBarButtonItem alloc]
                               initWithTitle:@"削除" style:UIBarButtonItemStyleBordered
                               target:self action:@selector(todel)];
    
    
    // 編集ボタンを生成する
    UIBarButtonItem *edit = [[UIBarButtonItem alloc]
                            initWithTitle:@"編集" style:UIBarButtonItemStyleBordered
                            target:self action:@selector(toedit)];
    
    
    // 登録ボタンを生成する
    UIBarButtonItem *resister = [[UIBarButtonItem alloc]
                             initWithTitle:@"登録" style:UIBarButtonItemStyleBordered
                             target:self action:@selector(toresister)];
    
    // 単語帳を見るボタンを生成する
    UIBarButtonItem *show = [[UIBarButtonItem alloc]
                                 initWithTitle:@"見る" style:UIBarButtonItemStyleBordered
                                 target:self action:@selector(toshow)];
    
    // toolbarにボタンとラベルをセットする
    NSArray *items =
    [NSArray arrayWithObjects:del, spacer, edit, spacer, resister, spacer , show, nil];
    self.toolbarItems = items;

}

- (void)todel{
    DeleteViewController* deleteViewController = [[DeleteViewController alloc] init];
    [self.navigationController pushViewController:deleteViewController animated:NO];
}

- (void)toedit{
    EditViewController* editViewController = [[EditViewController alloc] init];
    [self.navigationController pushViewController:editViewController animated:NO];
}

- (void)toresister{
    ResisterViewController* resisterViewController = [[ResisterViewController alloc] init];
    [self.navigationController pushViewController:resisterViewController animated:NO];
}

- (void)toshow{
    ShowViewController* showViewController = [[ShowViewController alloc] init];
    [self.navigationController pushViewController:showViewController animated:NO];
}

- (void) createLabel{
    NSInteger width = [[UIScreen mainScreen]bounds].size.width;
    NSInteger height =  [[UIScreen mainScreen]bounds].size.height;
    UILabel* App_label = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, width, 20)];
    UILabel* How_touse = [[UILabel alloc] initWithFrame:CGRectMake(0, 80, width, 150)];
    UITextView* overview = [[UITextView alloc] initWithFrame:CGRectMake(0, 60, width, height - 40)];
    UITextView* use = [[UITextView alloc] initWithFrame:CGRectMake(0, 180, width, height - 40)];
    
    overview.editable = NO;
    use.editable = NO;
    
    [App_label setFont:[UIFont systemFontOfSize:24.0]];
    [App_label setTextAlignment:NSTextAlignmentCenter];
    [How_touse setFont:[UIFont systemFontOfSize:24.0]];
    [How_touse setTextAlignment:NSTextAlignmentCenter];
    [overview setFont:[UIFont systemFontOfSize:16.0]];
    [use setFont:[UIFont systemFontOfSize:16.0]];
    
    App_label.text = @"アプリの概要";
    overview.text = @"自分の分からなかった単語や熟語を画像と一緒に登録して英語の勉強の効率化を測ろう!";
    How_touse.text = @"アプリの使い方";
    use.text = @" 1. 下の左のボタンで単語の削除 \n\n 2. その右のボタンで登録した単語の内容を編集 \n\n 3. その右のボタンで新しい単語の登録 \n\n 4. その右登録した単語を見る";
    
    [self.view addSubview:App_label];
    [self.view addSubview:overview];
    [self.view addSubview:How_touse];
    [self.view addSubview:use];
}

@end
