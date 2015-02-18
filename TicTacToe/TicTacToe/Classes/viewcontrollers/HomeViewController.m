#import "HomeViewController.h"

#import "HomeView.h"

@interface HomeViewController ()
@end

@implementation HomeViewController

- (void)loadView {
  [self setView:[HomeView new]];
}

@end
