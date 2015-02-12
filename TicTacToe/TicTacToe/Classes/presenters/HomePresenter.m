#import "HomePresenter.h"

#import "HomeViewController.h"

@implementation HomePresenter

+ (HomeViewController *)createViewController {
  return [[HomeViewController alloc] initWithPresenter:[HomePresenter new]];
}

@end
