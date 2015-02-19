#import "CHPresenter.h"

@class GameViewController;

typedef NS_ENUM(NSInteger, TicTacToeGameType) {
  TicTacToeGameUserX,
  TicTacToeGameUserO,
  TicTacToeGameUserXO
};

@interface GamePresenter : CHPresenter

+ (GameViewController *)createViewControllerWithGameType:(TicTacToeGameType)gameType;

@end
