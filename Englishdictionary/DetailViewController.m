//
//  DetailViewController.m
//  Englishdictionary
//
//  Created by 中村圭助 on 2019/03/22.
//  Copyright © 2019年 中村圭助. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

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
    [self setScrollView];
    [self setWord];
}

- (void)setBackground{
    self.view.backgroundColor = UIColor.whiteColor;
}

- (void)setScrollView{
    NSInteger width = [[UIScreen mainScreen]bounds].size.width;
    NSInteger height =  [[UIScreen mainScreen]bounds].size.height;
    _sv = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    UIView *uv = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, height + 300)];
    _sv.contentSize = uv.bounds.size;
    [self.view addSubview:_sv];
}

- (void)setWord{
    NSInteger width = [[UIScreen mainScreen]bounds].size.width;
    UILabel* section_label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, width, 30)];
    UILabel* word_label = [[UILabel alloc] initWithFrame:CGRectMake(10, 50, width, 30)];
    
    [section_label setFont:[UIFont systemFontOfSize:16.0]];
    [word_label setFont:[UIFont systemFontOfSize:24.0]];
    
    section_label.text = self.trasision.section;
    word_label.text = self.trasision.word;
    
    
    [_sv addSubview:section_label];
    [_sv addSubview:word_label];
}

- (void)setExplain{
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
