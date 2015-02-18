#import "GamePresenter.h"

#import "GameView.h"
#import "GameViewController.h"
#import "TicTacToeButton.h"

@interface GamePresenter ()
@property(nonatomic, readonly) GameViewController *gameViewController;
- (void)buttonPressed:(id)sender;
@end

@implementation GamePresenter

+ (GameViewController *)createViewController {
  // TODO(cate): Add options.
  return [[GameViewController alloc] initWithPresenter:[GamePresenter new]];
}

- (GameViewController *)gameViewController {
  return (GameViewController *) [self viewController];
}

- (void)viewLoaded {
  for (TicTacToeButton *button in [[[self gameViewController] gameView] buttons]) {
    [button addTarget:self
               action:@selector(buttonPressed:)
     forControlEvents:UIControlEventTouchUpInside];
  }
}

- (void)buttonPressed:(id)sender {
  TicTacToeButton *button = (TicTacToeButton *)sender;
  NSLog(@"Button pressed at %d,%d", [button x], [button y]);
}

@end
