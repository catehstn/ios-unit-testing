#import "GamePresenter.h"

#import "ComputerPlayer.h"
#import "EndGamePresenter.h"
#import "GameView.h"
#import "GameViewController.h"
#import "TicTacToeBoard.h"
#import "TicTacToeButton.h"

@interface GamePresenter () {
  TicTacToeBoard *board_;
  BOOL computerInPlay_;
  ComputerPlayer *computerPlayer_;
  TicTacToeGameType gameType_;
  TicTacToeStateType turn_;
}

@property(nonatomic, readonly) GameViewController *gameViewController;

- (void)buttonPressed:(id)sender;
- (void)gameOverWithState:(TicTacToeGameStateType)state;
- (void)handleEndOfTurn;
- (void)handlePossibleGameEnd;
- (void)maybePlayComputerTurn;
- (void)playComputerTurn;
- (void)updateTurn;
@end

@implementation GamePresenter

@synthesize computerInPlay = computerInPlay_;
@synthesize gameType = gameType_;

static const NSTimeInterval kComputerPlayDelay = 1;

+ (UIViewController *)createViewControllerWithGameType:(TicTacToeGameType)gameType {
  TicTacToeBoard *board = [TicTacToeBoard new];
  TicTacToeStateType type = (gameType == TicTacToeGameUserO) ? TicTacToeStateX : TicTacToeStateO;
  ComputerPlayer *computerPlayer = [[ComputerPlayer alloc] initWithBoard:board type:type];
  GamePresenter *presenter = [[GamePresenter alloc] initWithBoard:board
                                                   computerPlayer:computerPlayer
                                                         gameType:gameType];
  return [[GameViewController alloc] initWithPresenter:presenter];
}

- (id)initWithBoard:(TicTacToeBoard *)board
     computerPlayer:(ComputerPlayer *)computerPlayer
           gameType:(TicTacToeGameType)gameType {
  self = [super init];
  if (self) {
    board_ = board;
    computerInPlay_ = NO;
    computerPlayer_ = computerPlayer;
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

  [self maybePlayComputerTurn];
}

- (void)buttonPressed:(id)sender {
  // Ignore if computer is in play.
  if (computerInPlay_) {
    return;
  }
  TicTacToeButton *button = (TicTacToeButton *)sender;
  // Play
  int x = [button x];
  int y = [button y];
  if ([board_ playXPos:x yPos:y toState:turn_]) {
    [self handleEndOfTurn];
    [self maybePlayComputerTurn];
  }
}

- (void)gameOverWithState:(TicTacToeGameStateType)state {
  UIViewController *viewController =
      [EndGamePresenter createViewControllerWithEndGameState:state];
  [[self viewController] pushViewController:viewController animated:YES];
}

- (void)handleEndOfTurn {
  // Change turn.
  [self updateTurn];
  [[self gameViewController] updateDisplayFromBoard:board_];
  [self handlePossibleGameEnd];
}

- (void)handlePossibleGameEnd {
  TicTacToeGameStateType gameState = [board_ gameState];
  if (gameState != TicTacToeGameStateNotEnded) {
    [self gameOverWithState:gameState];
  }
}

- (void)maybePlayComputerTurn {
  if (gameType_ == TicTacToeGameUserXO ||
      (gameType_ == TicTacToeGameUserO && turn_ == TicTacToeStateO) ||
      (gameType_ == TicTacToeGameUserX && turn_ == TicTacToeStateX) ||
      [board_ gameState] != TicTacToeGameStateNotEnded) {
    return;
  }

  computerInPlay_ = YES;
  [self performSelector:@selector(playComputerTurn) withObject:nil afterDelay:kComputerPlayDelay];
}

- (void)playComputerTurn {
  [computerPlayer_ makeNextMove];
  [self handleEndOfTurn];
  computerInPlay_ = NO;
}

- (void)updateTurn {
  turn_ = (turn_ == TicTacToeStateO) ? TicTacToeStateX : TicTacToeStateO;
}

@end
