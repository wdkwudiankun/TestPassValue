//
//  SecondViewController.m
//  TestPassValue
//
//  Created by DiankunWu on 16/4/25.
//  Copyright © 2016年 DiankunWu. All rights reserved.
//

#import "SecondViewController.h"
#import "DataSource.h"

@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UIButton *blockStyle;
@property (weak, nonatomic) IBOutlet UIButton *notificationStyle;
@property (weak, nonatomic) IBOutlet UIButton *singletonStyle;
@property (weak, nonatomic) IBOutlet UIButton *delegateStyle;
@property (weak, nonatomic) IBOutlet UIButton *userDefaultStyle;

@end

@implementation SecondViewController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{

    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if ( self) {
        //
        
    }
    return  self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.nameTextField resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Cancel:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)BlockStyle:(id)sender {
    
    if ([self notEmpty]) {
        if (self.block) {
            self.block(self.nameTextField.text);
            [self dismissViewControllerAnimated:YES completion:nil];
        }else{
        
            [self showAlert];
        
        }
    }
}

- (IBAction)NotificationStyle:(id)sender {
    
    if ([self notEmpty]) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"SwitchNameNotification" object:self userInfo:@{@"name":self.nameTextField.text}];
        [self dismissViewControllerAnimated:YES completion:nil];
    }else{
    
        [self showAlert];
    
    }
    
}

- (IBAction)SingletonStyle:(id)sender {
    
    if ([self notEmpty]) {
        
        DataSource *dataSource = [DataSource shareDataSource];
        dataSource.myname = self.nameTextField.text;
        [self dismissViewControllerAnimated:YES completion:nil];
    }else{
    
        [self showAlert];
    }
    
}

- (IBAction)DelegateStyle:(id)sender {
    
    if ([self notEmpty]) {
        if ([self.delegate respondsToSelector:@selector(showName:)]) {
            [self.delegate showName:self.nameTextField.text];
        }
        [self dismissViewControllerAnimated:YES completion:nil];
    }else{
    
        [self showAlert];
    }
    
}
-(void)showAlert{

    NSString *title = NSLocalizedString(@"Notice", nil);
    NSString *message = NSLocalizedString(@"Input your name", nil);
    NSString *cancelButtonTitle = NSLocalizedString(@"Cancel", nil);
    NSString *otherButtonTitle = NSLocalizedString(@"OK", nil);
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
    }];
    
    UIAlertAction *otherAction = [UIAlertAction actionWithTitle:otherButtonTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
    }];
    
    [alertController addAction:cancelAction];
    [alertController addAction:otherAction];
    
    [self presentViewController:alertController animated:YES completion:nil];

}

-(BOOL)notEmpty{

    if ([self.nameTextField.text length]==0) {
        return NO;
    }
    return YES;
}

- (IBAction)UserDefaultStyle:(id)sender {
    
    if ([self notEmpty]) {
        [[NSUserDefaults standardUserDefaults] setObject:self.nameTextField.text forKey:@"nametext"];
        [self dismissViewControllerAnimated:YES completion:nil];
    }else{
    
        [self showAlert];
    
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
