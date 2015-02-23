#import "HomePresenter.h"

#import "GamePresenter.h"
#import "HomeView.h"
#import "HomeViewController.h"

@interface HomePresenter ()
@property(nonatomic, readonly) HomeViewController *homeViewController;

- (void)pushGameViewControllerWithGameType:(TicTacToeGameType)gameType;
- (void)oButtonPressed:(id)sender;
- (void)xButtonPressed:(id)sender;
- (void)xoButtonPressed:(id)sender;
@end

@implementation HomePresenter

+ (UIViewController *)createViewController {
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
  [self pushGameViewControllerWithGameType:TicTacToeGameUserO];
}

- (void)xButtonPressed:(id)sender {
  [self pushGameViewControllerWithGameType:TicTacToeGameUserX];
}

- (void)xoButtonPressed:(id)sender {
  [self pushGameViewControllerWithGameType:TicTacToeGameUserXO];
}

- (void)pushGameViewControllerWithGameType:(TicTacToeGameType)gameType {
  UIViewController *viewController = [GamePresenter createViewControllerWithGameType:gameType];
  [[self viewController] pushViewController:viewController animated:YES];
}

@end
