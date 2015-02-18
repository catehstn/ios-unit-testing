#import "HomePresenter.h"

#import "GamePresenter.h"
#import "GameViewController.h"
#import "HomeView.h"
#import "HomeViewController.h"

@interface HomePresenter ()
@property(nonatomic, readonly) HomeViewController *homeViewController;

- (void)pushGameViewController;
- (void)oButtonPressed:(id)sender;
- (void)xButtonPressed:(id)sender;
- (void)xoButtonPressed:(id)sender;
@end

@implementation HomePresenter

+ (HomeViewController *)createViewController {
  return [[HomeViewController alloc] initWithPresenter:[HomePresenter new]];
}

- (HomeViewController *)homeViewController {
  return (HomeViewController *) [self viewController];
}

- (void)viewLoaded {
  HomeView *view = [[self homeViewController] homeView];

  [[view playOButton] addTarget:self
                         action:@selector(oButtonPressed:)
               forControlEvents:UIControlEventTouchUpInside];
  [[view playXButton] addTarget:self
                        action:@selector(xButtonPressed:)
              forControlEvents:UIControlEventTouchUpInside];
  [[view playXOButton] addTarget:self
                          action:@selector(xoButtonPressed:)
                forControlEvents:UIControlEventTouchUpInside];

}

- (void)oButtonPressed:(id)sender {
  // TODO(cate): Fill this in.
  NSLog(@"o button pressed");
  [self pushGameViewController];
}

- (void)xButtonPressed:(id)sender {
  // TODO(cate): Fill this in.
  NSLog(@"x button pressed");
  [self pushGameViewController];
}

- (void)xoButtonPressed:(id)sender {
  // TODO(cate): Fill this in.
  NSLog(@"xo button pressed");
  [self pushGameViewController];
}

- (void)pushGameViewController {
  // TODO(cate): Add options.
  GameViewController *viewController = [GamePresenter createViewController];
  [[self viewController] pushViewController:viewController animated:YES];
}

@end
