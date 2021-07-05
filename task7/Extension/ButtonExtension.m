//
//  ButtonExtension.m
//  task7
//
//  Created by tiffanywithoutco on 05.07.2021.
//

#import "ButtonExtension.h"

@implementation ButtonExtension

- (void)awakeFromNib{
    [super awakeFromNib];
    [self.layer setBorderColor:[[UIColor alloc] initWithRed:128/255.f green:164/255.f blue:237/255.f alpha:1].CGColor];
    self.layer.borderWidth=2.0;
    self.layer.cornerRadius = 10;
    [self setImage:[UIImage imageNamed:@"person"] forState:UIControlStateNormal];
    [self setImage:[UIImage imageNamed:@"person.fill"] forState:UIControlStateHighlighted];
    [self setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 20)];
    [self setTitleColor:[[UIColor alloc] initWithRed:128/255.f green:164/255.f blue:237/255.f alpha:1] forState:UIControlStateDisabled];
}

- (void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];

    if (highlighted) {
        self.backgroundColor = [[[UIColor alloc] initWithRed:128/255.f green:164/255.f blue:237/255.f alpha:1] colorWithAlphaComponent:0.2];
    }
    else{
        self.backgroundColor = [UIColor whiteColor];
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
