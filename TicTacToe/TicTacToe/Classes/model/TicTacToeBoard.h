#import <Foundation/Foundation.h>

@interface TicTacToeBoard : NSObject

typedef NS_ENUM(NSInteger, TicTacToeStateType) {
  TicTacToeStateX,
  TicTacToeStateO,
  TicTacToeStateEmpty
};

- (BOOL)playXPos:(int)x
            yPos:(int)y
         toState:(TicTacToeStateType)state;

@end
