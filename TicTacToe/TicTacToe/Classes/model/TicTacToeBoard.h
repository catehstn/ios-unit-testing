#import <Foundation/Foundation.h>

@interface TicTacToeBoard : NSObject

typedef NS_ENUM(NSInteger, TicTacToeStateType) {
  TicTacToeStateX,
  TicTacToeStateO,
  TicTacToeStateEmpty
};

@property(nonatomic, assign) TicTacToeStateType A;
@property(nonatomic, assign) TicTacToeStateType B;
@property(nonatomic, assign) TicTacToeStateType C;
@property(nonatomic, assign) TicTacToeStateType D;
@property(nonatomic, assign) TicTacToeStateType E;
@property(nonatomic, assign) TicTacToeStateType F;
@property(nonatomic, assign) TicTacToeStateType G;
@property(nonatomic, assign) TicTacToeStateType H;
@property(nonatomic, assign) TicTacToeStateType I;

@end
