#import <Foundation/Foundation.h>

@interface TicTacToeBoard : NSObject

typedef NS_ENUM(NSInteger, TicTacToeStateType) {
  TicTacToeStateX,
  TicTacToeStateO,
  TicTacToeStateEmpty,
  TicTacToeStateInvalid
};

- (TicTacToeStateType)stateForXPos:(int)x yPos:(int)y;

- (BOOL)playXPos:(int)x
            yPos:(int)y
         toState:(TicTacToeStateType)state;

@end
