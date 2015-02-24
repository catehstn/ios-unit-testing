#import "CHViewController.h"

#import "GameStates.h"

@class GameView;
@class TicTacToeBoard;

FOUNDATION_EXPORT NSString *const kO;
FOUNDATION_EXPORT NSString *const kX;
FOUNDATION_EXPORT NSString *const kEmpty;

@interface GameViewController : CHViewController

@property(nonatomic, readonly) GameView *gameView;

- (void)updateDisplayFromBoard:(TicTacToeBoard *)board;
- (NSString *)valueForState:(TicTacToeStateType)state;

@end
