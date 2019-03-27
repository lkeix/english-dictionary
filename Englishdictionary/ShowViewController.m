//
//  ShowViewController.m
//  Englishdictionary
//
//  Created by 中村圭助 on 2019/03/22.
//  Copyright © 2019年 中村圭助. All rights reserved.
//

#import "ShowViewController.h"
#import "Trasision.h"

@interface ShowViewController  ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation ShowViewController

- (void)viewDidLoad {
    [self createView];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)createView{
    [self setBackground];
    [self setDelegate];
}

- (void)setBackground{
    self.view.backgroundColor = UIColor.whiteColor;
}

- (void)settableView{
    [self setDelegate];
}

- (void)setDelegate{
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 0){
        return @"単語";
    }else if(section == 1){
        return @"イディオム";
    }else if(section == 2){
        return @"文法";
    }else if(section == 3){
        return @"日常会話";
    }
    return [NSString stringWithFormat:@"section%ld", (long)section];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUserDefaults* ud = [NSUserDefaults standardUserDefaults];
    NSDictionary* dict = [ud dictionaryForKey:@"単語"];
    
    for (id key in [dict keyEnumerator]) {
        NSLog(@"Key:%@ Value:%@", key, [dict valueForKey:key]);
        NSDictionary* tmp = [dict valueForKey:key];
        for (id k in [tmp keyEnumerator]){
            NSLog(@"key:%@ val:%@",k,[tmp keyEnumerator]);
        }
    }

    // "cell"というkeyでcellデータを取得
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    // cellデータが無い場合、UITableViewCellを生成して、"cell"というkeyでキャッシュする
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = @"hoge";
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString* val = [NSString stringWithFormat:@"%@" , [tableView cellForRowAtIndexPath:indexPath].textLabel.text];
    NSString* sec = [NSString stringWithFormat:@"%@" , [tableView headerViewForSection:indexPath.section].textLabel.text];
    Trasision* trasision = [Trasision alloc];
    trasision.word = val;
    trasision.section = sec;
    DetailViewController* detailViewController = [[DetailViewController alloc] init];
    detailViewController.trasision = trasision;
    [self.navigationController pushViewController:detailViewController animated:NO];
}

@end
