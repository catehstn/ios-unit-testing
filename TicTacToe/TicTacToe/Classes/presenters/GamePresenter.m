#import "GamePresenter.h"

#import "GameView.h"
#import "GameViewController.h"
#import "TicTacToeBoard.h"
#import "TicTacToeButton.h"

@interface GamePresenter () {
  TicTacToeBoard *board_;
  TicTacToeGameType gameType_;
  TicTacToeStateType turn_;
}

@property(nonatomic, readonly) GameViewController *gameViewController;

- (id)initWithBoard:(TicTacToeBoard *)board gameType:(TicTacToeGameType)gameType;
- (void)buttonPressed:(id)sender;
- (void)handlePossibleGameEnd;
- (void)updateTurn;
- (NSString *)valueForState:(TicTacToeStateType)state;
@end

@implementation GamePresenter

+ (GameViewController *)createViewControllerWithGameType:(TicTacToeGameType)gameType {
  // TODO(cate): Add options.
  TicTacToeBoard *board = [TicTacToeBoard new];
  GamePresenter *presenter = [[GamePresenter alloc] initWithBoard:board gameType:gameType];
  return [[GameViewController alloc] initWithPresenter:presenter];
}

- (id)initWithBoard:(TicTacToeBoard *)board gameType:(TicTacToeGameType)gameType {
  self = [super init];
  if (self) {
    board_ = board;
    gameType_ = gameType;
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
  if ([board_ playXPos:x yPos:y toState:turn_]) {
    // Change turn.
    [self updateTurn];
    NSString *value = [self valueForState:[board_ stateForXPos:x yPos:y]];
    [[[self gameViewController] gameView] updateValue:value atX:x y:y];
    [self handlePossibleGameEnd];
  }
}

- (void)handlePossibleGameEnd {
  TicTacToeGameStateType gameState = [board_ gameState];
  switch (gameState) {
    case TicTacToeGameStateNotEnded:
      return;
    case TicTacToeGameStateBoardFull:
      // TODO(cate): Fill this in.
      NSLog(@"nobody wins");
      return;
    case TicTacToeGameStateOWin:
      // TODO(cate): Fill this in.
      NSLog(@"O wins");
      return;
    case TicTacToeGameStateXWin:
      // TODO(cate): Fill this in.
      NSLog(@"X wins");
      return;
  }
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
