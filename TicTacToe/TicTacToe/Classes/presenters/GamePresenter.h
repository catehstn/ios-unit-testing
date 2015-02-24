#import <UIKit/UIKit.h>

#import "GameStates.h"
#import "CHPresenter.h"

@class ComputerPlayer;
@class GameViewController;
@class TicTacToeBoard;

@interface GamePresenter : CHPresenter

@property(nonatomic, readonly) TicTacToeGameType gameType;

+ (UIViewController *)createViewControllerWithGameType:(TicTacToeGameType)gameType;

// Designated initializer. Exposed for testing.
- (id)initWithBoard:(TicTacToeBoard *)board
     computerPlayer:(ComputerPlayer *)computerPlayer
           gameType:(TicTacToeGameType)gameType;

// Visible for testing.
@property(nonatomic, assign) BOOL computerInPlay;

@end
