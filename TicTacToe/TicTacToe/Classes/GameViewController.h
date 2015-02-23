#import "CHViewController.h"

@class GameView;
@class TicTacToeBoard;

@interface GameViewController : CHViewController

@property(nonatomic, readonly) GameView *gameView;

- (void)updateDisplayFromBoard:(TicTacToeBoard *)board;

@end
