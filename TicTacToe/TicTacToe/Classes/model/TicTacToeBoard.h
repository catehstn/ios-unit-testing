#import <Foundation/Foundation.h>

@interface TicTacToeBoard : NSObject

typedef NS_ENUM(NSInteger, TicTacToeStateType) {
  TicTacToeStateX,
  TicTacToeStateO,
  TicTacToeStateEmpty,
  TicTacToeStateInvalid
};

typedef NS_ENUM(NSInteger, TicTacToeGameStateType) {
  TicTacTieGameStateNotEnded,
  TicTacToeGameStateBoardFull,
  TicTacToeGameStateXWin,
  TicTacToeGameStateOWin,
};

@property(nonatomic, readonly) TicTacToeGameStateType gameState;

- (TicTacToeStateType)stateForXPos:(int)x yPos:(int)y;

- (BOOL)playXPos:(int)x
            yPos:(int)y
         toState:(TicTacToeStateType)state;

@end
