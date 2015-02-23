#import "EndGamePresenter.h"

#import "EndGameViewController.h"

@interface EndGamePresenter () {
  TicTacToeGameStateType gameState_;
}

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

@end
