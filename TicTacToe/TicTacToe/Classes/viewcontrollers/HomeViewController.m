#import "HomeViewController.h"

#import "HomeView.h"

@implementation HomeViewController

- (void)loadView {
  [self setView:[HomeView new]];
}

- (HomeView *)homeView {
  return (HomeView *)[self view];
}

@end
