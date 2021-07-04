//
//  AppDelegate.m
//  task7
//
//  Created by tiffanywithoutco on 04.07.2021.
//

#import "AppDelegate.h"
#import "LoadingView.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = [[LoadingView alloc] initWithNibName:@"LoadingView" bundle:nil];
    [self.window makeKeyAndVisible];
    return YES;
}


@end
