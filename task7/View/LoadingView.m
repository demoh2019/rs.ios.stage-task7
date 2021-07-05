//
//  LoadingView.m
//  task7
//
//  Created by tiffanywithoutco on 04.07.2021.
//

#import "LoadingView.h"
#import "ButtonExtension.h"

@interface LoadingView ()
@property (weak, nonatomic) IBOutlet UITextField *login;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet ButtonExtension *button;
@property (weak, nonatomic) IBOutlet UIButton *second;
@property (weak, nonatomic) IBOutlet UIButton *two;
@property (weak, nonatomic) IBOutlet UIButton *three;
@property (weak, nonatomic) IBOutlet UIView *radius;
@property (weak, nonatomic) IBOutlet UILabel *number;

@end

@implementation LoadingView

- (void)viewDidLoad {
    [super viewDidLoad];
    [self tappedView];
    _radius.layer.borderWidth = 0;
    _radius.layer.cornerRadius = 10;
    
    [self buttonView:_second];
    [self buttonView:_two];
    [self buttonView:_three];

    
    [self fieldsView:_login second:@"default"];
    [self fieldsView:_password second:@"default"];
}

-(void)buttonView:(UIButton *)fields{
    fields.layer.borderWidth = 1.0;
    [fields.layer setBorderColor:[[UIColor alloc] initWithRed:128/255.f green:164/255.f blue:237/255.f alpha:1].CGColor];
    fields.layer.cornerRadius = 24;
    
}

- (IBAction)editingChanged:(UITextField *)sender {
    [self fieldsView:sender second:@"default"];
}

-(void)fieldsView:(UITextField *)fields second:(NSString*)status{
    [fields.layer setBorderColor:[self getColor:status]];
    fields.layer.cornerRadius = 5;
    fields.delegate = self;
    fields.layer.borderWidth=1.0;
}

-(void)hideKeybord{
    [self.view endEditing:YES];
}

-(CGColorRef)getColor:(NSString*)status{
    if ([status  isEqual: @"default"]){
        return [[UIColor alloc] initWithRed:76/255.f green:92/255.f blue:104/255.f alpha:1].CGColor;
    }else if ([status  isEqual: @"ok"]){
        return [[UIColor alloc] initWithRed:145/255.f green:199/255.f blue:129/255.f alpha:1].CGColor;
    }else{
        return [[UIColor alloc] initWithRed:194/255.f green:1/255.f blue:20/255.f alpha:1].CGColor;
    }
}

-(void)tappedView{
    UITapGestureRecognizer *tapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeybord)];
    [self.view addGestureRecognizer:tapped];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self hideKeybord];
    return YES;
}

- (IBAction)AuthorizeTapped:(id)sender {
    BOOL login = [_login.text  isEqual: @"username"];
    BOOL password = [_password.text  isEqual: @"password"];
    if (login) {
        [self fieldsView:_login second:@"ok"];
    }else{
        [self fieldsView:_login second:@"error"];
    }
    
    if (password) {
        [self fieldsView:_password second:@"ok"];
    }else{
        [self fieldsView:_password second:@"error"];
    }
    
    if (password && login) {
        [_login setEnabled:NO];
        [_password setEnabled:NO];
        [_button setEnabled:NO];
        [_radius setHidden:NO];
        [_login setAlpha:0.5];
        [_password setAlpha:0.5];
        [_button setAlpha:0.5];
    }
}
- (IBAction)tappedNumber:(UIButton*)sender {
    if ([[_number text]  isEqual: @"_"]){
        _number.text = @"";
    }
    [_number setText:[_number.text stringByAppendingString:sender.currentTitle]];
    
    if ([_number.text length] == 3){
        [self chekedPin];
    }
}

-(void)chekedPin{
    if([[_number text]  isEqual: @"132"]){
        _radius.layer.borderWidth = 2;
        _radius.layer.borderColor = [self getColor:@"ok"];
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Welcome"
                                       message:@"You are successfuly authorized."
                                       preferredStyle:UIAlertControllerStyleAlert];

        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"Refresh" style:UIAlertActionStyleDestructive
            handler:^(UIAlertAction * action) {[self restart];}];

        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    }else{
        [self error];
    }
}

-(void)restart{
    _radius.layer.borderWidth = 0;
    _radius.hidden=YES;
    [_login setEnabled:YES];
    [_password setEnabled:YES];
    [_button setEnabled:YES];
    [_radius setHidden:YES];
    [_login setAlpha:1];
    [_password setAlpha:1];
    [_button setAlpha:1];
    _login.text = @"";
    _password.text = @"";
    _number.text = @"_";
    [self fieldsView:_login second:@"default"];
    [self fieldsView:_password second:@"default"];
}

-(void)error{
    _radius.layer.borderWidth = 2;
    _radius.layer.borderColor = [self getColor:@"error"];
    _number.text = @"_";
}
- (IBAction)numerTapped:(id)sender {
    _radius.layer.borderWidth = 0;
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
