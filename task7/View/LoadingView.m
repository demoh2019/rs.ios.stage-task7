//
//  LoadingView.m
//  task7
//
//  Created by tiffanywithoutco on 04.07.2021.
//

#import "LoadingView.h"

@interface LoadingView ()
@property (weak, nonatomic) IBOutlet UITextField *login;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UIButton *second;
@property (weak, nonatomic) IBOutlet UIButton *two;
@property (weak, nonatomic) IBOutlet UIButton *three;
@property (weak, nonatomic) IBOutlet UIView *radius;

@end

@implementation LoadingView

- (void)viewDidLoad {
    [super viewDidLoad];
    [self tappedView];
    _radius.layer.borderColor = [self getColor: @"ok"];
    _radius.layer.borderWidth = 1.0;
    _radius.layer.cornerRadius = 10;
    
    [self buttonView:_second];
    [self buttonView:_two];
    [self buttonView:_three];

    
    [self fieldsView:_login second:@"default"];
    [self fieldsView:_password second:@"default"];
    
    [_button.layer setBorderColor:[[UIColor alloc] initWithRed:128/255.f green:164/255.f blue:237/255.f alpha:1].CGColor];
    _button.layer.borderWidth=2.0;
    _button.layer.cornerRadius = 10;
    [_button setImage:[UIImage imageNamed:@"person"] forState:UIControlStateNormal];
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
