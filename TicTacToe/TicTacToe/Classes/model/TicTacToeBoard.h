#import <Foundation/Foundation.h>

@interface TicTacToeBoard : NSObject

typedef NS_ENUM(NSInteger, TicTacToeStateType) {
  TicTacToeStateX,
  TicTacToeStateO,
  TicTacToeStateEmpty
};

@property(nonatomic, readonly) TicTacToeStateType A;
@property(nonatomic, readonly) TicTacToeStateType B;
@property(nonatomic, readonly) TicTacToeStateType C;
@property(nonatomic, readonly) TicTacToeStateType D;
@property(nonatomic, readonly) TicTacToeStateType E;
@property(nonatomic, readonly) TicTacToeStateType F;
@property(nonatomic, readonly) TicTacToeStateType G;
@property(nonatomic, readonly) TicTacToeStateType H;
@property(nonatomic, readonly) TicTacToeStateType I;

@end
