#import "CHPresenter.h"

// TODO(cate): Move enums, remove this import.
#import "TicTacToeBoard.h"

@class EndGameViewController;

FOUNDATION_EXPORT NSString *const kOWin;
FOUNDATION_EXPORT NSString *const kXWin;
FOUNDATION_EXPORT NSString *const kTie;

@interface EndGamePresenter : CHPresenter

+ (EndGameViewController *)createViewControllerWithEndGameState:(TicTacToeGameStateType)gameState;

// Designated initializer. Exposed for testing.
- (id)initWithEndGameState:(TicTacToeGameStateType)gameState;

@end
