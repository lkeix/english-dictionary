//
//  ResisterViewController.m
//  Englishdictionary
//
//  Created by 中村圭助 on 2019/03/22.
//  Copyright © 2019年 中村圭助. All rights reserved.
//

#import "ResisterViewController.h"
#import "SqlController.h"

@interface ResisterViewController ()
@property UIScrollView* sv;
@end

@implementation ResisterViewController

- (void)viewDidLoad {
    [self setBackground];
    [self createUI];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)setBackground{
    self.view.backgroundColor = UIColor.whiteColor;
}

- (void)createUI{
    
    NSInteger width = [[UIScreen mainScreen]bounds].size.width;
    NSInteger height =  [[UIScreen mainScreen]bounds].size.height;
    
    _sv = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    UIView *uv = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, height + 150)];
    _sv.contentSize = uv.bounds.size;
    [self.view addSubview:_sv];
    
    
    UILabel* resister_lbl = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, width, 50)];
    [resister_lbl setFont:[UIFont systemFontOfSize:24.0]];
    resister_lbl.text = @"種類";
    [_sv addSubview:resister_lbl];
    
    self.items = [NSArray arrayWithObjects:@"単語", @"イディオム", @"文法", @"日常会話", nil];
    UISegmentedControl *seg = [[UISegmentedControl alloc] initWithItems:self.items];
    seg.frame = CGRectMake(50, 50, width - 100, 30);
    seg.selectedSegmentIndex = 0;
    _section = _items[0];
    [seg addTarget:self action:@selector(setSection:) forControlEvents:UIControlEventValueChanged];
    [_sv addSubview:seg];
    
    UILabel* word_lbl = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, width, 50)];
    [word_lbl setFont:[UIFont systemFontOfSize:24.0]];
    word_lbl.text = @"綴り";
    [_sv addSubview:word_lbl];
    
    _tf = [[UITextField alloc] initWithFrame:CGRectMake(width / 8, 150, width-100, 30)];
    [_tf setTextAlignment:NSTextAlignmentLeft];
    _tf.borderStyle = UITextBorderStyleBezel;
    _tf.layer.cornerRadius = 5.0;
    _tf.layer.shadowOpacity = 0.5;
    _tf.layer.masksToBounds = NO;
    [_sv addSubview:_tf];
    
    UILabel* exp_lbl = [[UILabel alloc] initWithFrame:CGRectMake(10, 200, width, 50)];
    [exp_lbl setFont:[UIFont systemFontOfSize:24.0]];
    exp_lbl.text = @"説明";
    [_sv addSubview:exp_lbl];
    
    _tv = [[UITextView alloc] initWithFrame:CGRectMake(width / 8, 250, width-100, height-200)];
    _tv.layer.borderWidth = 1.0;
    _tv.layer.cornerRadius = 5.0;
    _tv.layer.shadowOpacity = 0.5;
    _tv.layer.masksToBounds = NO;
    [_sv addSubview:_tv];
    
    
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(width / 8, 750, width-100, 50);
    [btn setTitle:@"登録" forState:UIControlStateNormal];
    [btn.titleLabel setFont:[UIFont systemFontOfSize:24]];
    [btn addTarget:self action:@selector(resister:) forControlEvents:UIControlEventTouchDown];
    [_sv addSubview:btn];
    
}

- (void)resister:(UIButton*)button{
    NSString* query = [NSString stringWithFormat:@"INSERT INTO WORD VALUES (%@ , %@ , %@);",_section,_tf.text,_tv.text];
    [SqlController handleDatabaseWithSql:query];
    RootViewController* rootViewController = [[RootViewController alloc] init];
    [self.navigationController pushViewController:rootViewController animated:NO];
}

- (void)setSection:(UISegmentedControl*)seg{
    _section = _items[seg.selectedSegmentIndex];
    NSLog(_section);
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // キーボードを閉じる
    [self.view endEditing:YES];
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
