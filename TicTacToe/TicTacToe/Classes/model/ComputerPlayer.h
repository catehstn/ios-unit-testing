#import <Foundation/Foundation.h>

#import "GameStates.h"

@class TicTacToeBoard;

@interface ComputerPlayer : NSObject

// Designated initializer.
- (id)initWithBoard:(TicTacToeBoard *)board type:(TicTacToeStateType)type;

// Make the next move.
- (void)makeNextMove;

@end
