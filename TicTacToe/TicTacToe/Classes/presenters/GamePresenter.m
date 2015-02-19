#import "GamePresenter.h"

#import "GameView.h"
#import "GameViewController.h"
#import "TicTacToeBoard.h"
#import "TicTacToeButton.h"

@interface GamePresenter () {
  TicTacToeBoard *board_;
  TicTacToeStateType turn_;
}

@property(nonatomic, readonly) GameViewController *gameViewController;

- (id)initWithBoard:(TicTacToeBoard *)board;
- (void)buttonPressed:(id)sender;
- (void)updateTurn;
- (NSString *)valueForState:(TicTacToeStateType)state;
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
    turn_ = TicTacToeStateO;
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
  // Play
  int x = [button x];
  int y = [button y];
  // TODO(cate): Handle play failing.
  [board_ playXPos:x yPos:y toState:turn_];
  // Change turn.
  [self updateTurn];
  NSString *value = [self valueForState:[board_ stateForXPos:x yPos:y]];
  [[[self gameViewController] gameView] updateValue:value atX:x y:y];
  // TODO(cate): Check for win conditions.
}

- (void)updateTurn {
  turn_ = (turn_ == TicTacToeStateO) ? TicTacToeStateX : TicTacToeStateO;
}

- (NSString *)valueForState:(TicTacToeStateType)state {
  switch (state) {
    case TicTacToeStateO:
      return @"O";
    case TicTacToeStateX:
      return @"X";
    default:
      return @"";
  }
}

@end
