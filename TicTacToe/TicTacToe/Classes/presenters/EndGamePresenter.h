#import "CHPresenter.h"

// TODO(cate): Move enums, remove this import.
#import "TicTacToeBoard.h"

@class EndGameViewController;

@interface EndGamePresenter : CHPresenter

+ (EndGameViewController *)createViewControllerWithEndGameState:(TicTacToeGameStateType)gameState;

// Designated initializer. Exposed for testing.
- (id)initWithEndGameState:(TicTacToeGameStateType)gameState;

@end
