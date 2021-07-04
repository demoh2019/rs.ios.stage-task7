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

@end

@implementation LoadingView
- (IBAction)passwordReturn:(id)sender {
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self tappedView];
    _login.layer.cornerRadius = 5;
    _login.delegate = self;
    [_login.layer setBorderColor:[[UIColor alloc] initWithRed:76/255.f green:92/255.f blue:104/255.f alpha:1].CGColor];
    _login.layer.borderWidth=1.0;
    
    [_button.layer setBorderColor:[[UIColor alloc] initWithRed:128/255.f green:164/255.f blue:237/255.f alpha:1].CGColor];
    _button.layer.borderWidth=2.0;
    _button.layer.cornerRadius = 10;
    [_button setImage:[UIImage imageNamed:@"person"] forState:UIControlStateNormal];
}

-(void)hideKeybord{
    [self.view endEditing:YES];
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
