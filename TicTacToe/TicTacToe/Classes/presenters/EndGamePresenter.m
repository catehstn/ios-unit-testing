#import "EndGamePresenter.h"

#import "EndGameView.h"
#import "EndGameViewController.h"

@interface EndGamePresenter () {
  TicTacToeGameStateType gameState_;
}
@property(nonatomic, readonly) EndGameViewController *endGameViewController;

- (void)playAgainButtonPressed:(id)sender;
@end

@implementation EndGamePresenter

NSString *const kOWin = @"O wins";
NSString *const kXWin = @"X wins";
NSString *const kTie = @"Tie";

+ (EndGameViewController *)createViewControllerWithEndGameState:(TicTacToeGameStateType)gameState {
  return [[EndGameViewController alloc] initWithPresenter:
      [[EndGamePresenter alloc] initWithEndGameState:gameState]];
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
  EndGameViewController *vc = [self endGameViewController];

  NSString *text;
  switch (gameState_) {
    case TicTacToeGameStateOWin:
      text = kOWin;
      break;
    case TicTacToeGameStateXWin:
      text = kXWin;
      break;
    case TicTacToeGameStateBoardFull:
      text = kTie;
    default:
      break;
  }
  [vc setGameOverStateText:text];

  [[[vc endGameView] playAgainButton] addTarget:self
                                         action:@selector(playAgainButtonPressed:)
                               forControlEvents:UIControlEventTouchUpInside];
}

- (void)playAgainButtonPressed:(id)sender {
  // TODO(cate): Fill this in.
  NSLog(@"play again button pressed");
}

@end
