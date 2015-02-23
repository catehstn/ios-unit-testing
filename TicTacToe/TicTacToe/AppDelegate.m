#import "AppDelegate.h"

#import "HomePresenter.h"

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

  [self setWindow:[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]]];
  [[self window] makeKeyAndVisible];

  UIViewController *viewController = [HomePresenter createViewController];
  UINavigationController *navController =
      [[UINavigationController alloc] initWithRootViewController:viewController];
  [[self window] setRootViewController:navController];

  return YES;
}

@end
