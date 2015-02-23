#import "EndGamePresenter.h"

#import "EndGameViewController.h"

@interface EndGamePresenter () {
  TicTacToeGameStateType gameState_;
}
@property(nonatomic, readonly) EndGameViewController *endGameViewController;
@end

@implementation EndGamePresenter

+ (EndGameViewController *)createViewControllerWithEndGameState:(TicTacToeGameStateType)gameState {
  return [[EndGameViewController alloc] initWithPresenter:[EndGamePresenter new]];
}

- (id)initWithEndGameState:(TicTacToeGameStateType)gameState {
  self = [super init];
  if (self) {
    gameState_ = gameState;
  }
  return self;
}

- (EndGameViewController *)endGameViewController {
  return (EndGameViewController *) [self viewController];
}

- (void)viewLoaded {
  NSString *text;
  switch (gameState_) {
    case TicTacToeGameStateOWin:
      text = @"O wins";
      break;
    case TicTacToeGameStateXWin:
      text = @"X wins";
      break;
    case TicTacToeGameStateBoardFull:
      text = @"Tie";
    default:
      break;
  }
  [[self endGameViewController] setGameOverStateText:text];
}

@end
