#import "CHViewController.h"

// TODO(cate): Move enums out and delete this import.
#import "TicTacToeBoard.h"

@class GameView;

FOUNDATION_EXPORT NSString *const kO;
FOUNDATION_EXPORT NSString *const kX;
FOUNDATION_EXPORT NSString *const kEmpty;

@interface GameViewController : CHViewController

@property(nonatomic, readonly) GameView *gameView;

- (void)updateDisplayFromBoard:(TicTacToeBoard *)board;
- (NSString *)valueForState:(TicTacToeStateType)state;

@end
