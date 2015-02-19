#import "GamePresenter.h"

#import "GameView.h"
#import "GameViewController.h"
#import "TicTacToeBoard.h"
#import "TicTacToeButton.h"

@interface GamePresenter () {
  TicTacToeBoard *board_;
}

@property(nonatomic, readonly) GameViewController *gameViewController;

- (id)initWithBoard:(TicTacToeBoard *)board;
- (void)buttonPressed:(id)sender;
@end

@implementation GamePresenter

+ (GameViewController *)createViewController {
  // TODO(cate): Add options.
  TicTacToeBoard *board = [TicTacToeBoard new];
  GamePresenter *presenter = [[GamePresenter alloc] initWithBoard:board];
  return [[GameViewController alloc] initWithPresenter:presenter];
}

- (id)initWithBoard:(TicTacToeBoard *)board {
  self = [super init];
  if (self) {
    board_ = board;
  }
  return self;
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
