//
//  BaseViewController.m
//  TestPassValue
//
//  Created by DiankunWu on 16/4/25.
//  Copyright © 2016年 DiankunWu. All rights reserved.
//

#import "BaseViewController.h"
#import "DataSource.h"
#import "BlockObject.h"

@interface BaseViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation BaseViewController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{

    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //
    }
    return  self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //注册通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(SwitchNameNotification:) name:@"SwitchNameNotification" object:nil];
}

-(void)SwitchNameNotification:(NSNotification *)notifi{

    NSDictionary *nameDic = [notifi userInfo];
    self.nameLabel.text = [nameDic objectForKey:@"name"];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)showName:(NSString *)nameStr{

    self.nameLabel.text = nameStr;

}
- (IBAction)clicktosecond:(id)sender {
    
    SecondViewController *second = [[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:nil];
    
    second.delegate = self;
    [self presentViewController:second animated:YES completion:nil];
    
}

- (IBAction)blocktosecond:(id)sender {
    
    SecondViewController * sec = [[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:nil];
    [self presentViewController:sec animated:YES completion:nil];
    sec.block = ^(NSString *str){
    
        self.nameLabel.text = str;
    };
}

- (IBAction)switchButtonColor:(id)sender {
    
    [BlockObject switchButtonColor:^(UIColor *newColor) {
        UIButton *btn = sender;
        btn.backgroundColor = newColor;
    }];
}

-(void)viewDidAppear:(BOOL)animated{
    
    if ([[[NSUserDefaults standardUserDefaults ] objectForKey:@"nametext"] length]!=0) {
        self.nameLabel.text =[[NSUserDefaults standardUserDefaults] objectForKey:@"nametext"];
        [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"nametext"];
    }
    

    DataSource *dataSource = [DataSource shareDataSource];
    if ([dataSource.myname length] != 0) {
        self.nameLabel.text = dataSource.myname;
        dataSource.myname = @"";
    }

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
