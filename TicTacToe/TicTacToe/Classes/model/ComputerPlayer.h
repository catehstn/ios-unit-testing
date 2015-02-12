#import <Foundation/Foundation.h>

#import "TicTacToeBoard.h"

@interface ComputerPlayer : NSObject

- (id)initWithBoard:(TicTacToeBoard *)board type:(TicTacToeStateType)type;

- (void)makeNextMove;

@end
