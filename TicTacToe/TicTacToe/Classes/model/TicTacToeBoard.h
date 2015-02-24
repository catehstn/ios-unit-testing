#import <Foundation/Foundation.h>

#import "GameStates.h"

@interface TicTacToeBoard : NSObject

@property(nonatomic, readonly) TicTacToeGameStateType gameState;

- (TicTacToeStateType)stateForXPos:(int)x yPos:(int)y;

- (BOOL)playXPos:(int)x
            yPos:(int)y
         toState:(TicTacToeStateType)state;

@end
