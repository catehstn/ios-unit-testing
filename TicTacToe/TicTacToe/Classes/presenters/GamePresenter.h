#import <UIKit/UIKit.h>

#import "CHPresenter.h"

@class ComputerPlayer;
@class GameViewController;
@class TicTacToeBoard;

typedef NS_ENUM(NSInteger, TicTacToeGameType) {
  TicTacToeGameUserX,
  TicTacToeGameUserO,
  TicTacToeGameUserXO
};

@interface GamePresenter : CHPresenter

@property(nonatomic, readonly) TicTacToeGameType gameType;

+ (UIViewController *)createViewControllerWithGameType:(TicTacToeGameType)gameType;

// Designated initializer. Exposed for testing.
- (id)initWithBoard:(TicTacToeBoard *)board
     computerPlayer:(ComputerPlayer *)computerPlayer
           gameType:(TicTacToeGameType)gameType;

@end
