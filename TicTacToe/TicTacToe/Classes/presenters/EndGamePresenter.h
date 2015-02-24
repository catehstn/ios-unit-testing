#import <UIKit/UIKit.h>

#import "GameStates.h"
#import "CHPresenter.h"

FOUNDATION_EXPORT NSString *const kOWin;
FOUNDATION_EXPORT NSString *const kXWin;
FOUNDATION_EXPORT NSString *const kTie;

@interface EndGamePresenter : CHPresenter

+ (UIViewController *)createViewControllerWithEndGameState:(TicTacToeGameStateType)gameState;

// Designated initializer. Exposed for testing.
- (id)initWithEndGameState:(TicTacToeGameStateType)gameState;

@end
