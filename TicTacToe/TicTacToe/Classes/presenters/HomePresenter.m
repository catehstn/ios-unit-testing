#import "HomePresenter.h"

#import "HomeViewController.h"

@interface HomePresenter ()
@property(nonatomic, readonly) HomeViewController *homeViewController;
@end

@implementation HomePresenter

+ (HomeViewController *)createViewController {
  return [[HomeViewController alloc] initWithPresenter:[HomePresenter new]];
}

- (HomeViewController *)homeViewController {
  return (HomeViewController *) [self viewController];
}

@end
