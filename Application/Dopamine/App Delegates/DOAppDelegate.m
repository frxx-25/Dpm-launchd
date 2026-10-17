//
//  AppDelegate.m
//  Dopamine
//
//  Created by Lars Fröder on 23.09.23.
//

#import "DOAppDelegate.h"

@interface DOAppDelegate ()

@end

@implementation DOAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
        // Paste this right before the final "return YES;" line
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        printf("[Auto-JB] DOAppDelegate initialized. Forcing execution chain...\n");
        
        // This targets Dopamine's background manager class directly and commands it 
        // to run the exploit sequence without waiting for a visual screen tap.
        [[ClassFromString(@"DOJailbreakManager") sharedManager] startJailbreak];
    });
return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}

- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        return UIInterfaceOrientationMaskAll;
    return UIInterfaceOrientationMaskPortrait;
}

@end
