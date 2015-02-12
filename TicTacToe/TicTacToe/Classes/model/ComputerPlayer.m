#import "ComputerPlayer.h"

@interface ComputerPlayer () {
  TicTacToeBoard *board_;
  TicTacToeStateType type_;
}
@end

@implementation ComputerPlayer

- (id)initWithBoard:(TicTacToeBoard *)board type:(TicTacToeStateType)type {
  self = [super init];
  if (self) {
    board_ = board;
  }
  return self;
}

- (void)makeNextMove {
  // Just make the first available.
  // TODO(cate): Do better.
  if ([board_ A] != TicTacToeStateEmpty) {
    [board_ setA:type_];
  } else if ([board_ B] != TicTacToeStateEmpty) {
    [board_ setB:type_];
  } else if ([board_ C] != TicTacToeStateEmpty) {
    [board_ setC:type_];
  } else if ([board_ D] != TicTacToeStateEmpty) {
    [board_ setD:type_];
  } else if ([board_ E] != TicTacToeStateEmpty) {
    [board_ setE:type_];
  } else if ([board_ F] != TicTacToeStateEmpty) {
    [board_ setF:type_];
  } else if ([board_ G] != TicTacToeStateEmpty) {
    [board_ setG:type_];
  } else if ([board_ H] != TicTacToeStateEmpty) {
    [board_ setH:type_];
  } else if ([board_ I] != TicTacToeStateEmpty) {
    [board_ setI:type_];
  }
}

@end
