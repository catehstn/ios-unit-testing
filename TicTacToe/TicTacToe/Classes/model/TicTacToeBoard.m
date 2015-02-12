#import "TicTacToeBoard.h"

/*
  The board is:
  A | B | C
  D | E | F
  G | H | I
*/
@interface TicTacToeBoard () {
  TicTacToeStateType sqA_;
  TicTacToeStateType sqB_;
  TicTacToeStateType sqC_;
  TicTacToeStateType sqD_;
  TicTacToeStateType sqE_;
  TicTacToeStateType sqF_;
  TicTacToeStateType sqG_;
  TicTacToeStateType sqH_;
  TicTacToeStateType sqI_;
}
@end

@implementation TicTacToeBoard

@synthesize A = sqA_;
@synthesize B = sqB_;
@synthesize C = sqC_;
@synthesize D = sqD_;
@synthesize E = sqE_;
@synthesize F = sqF_;
@synthesize G = sqG_;
@synthesize H = sqH_;
@synthesize I = sqI_;

- (id)init {
  self = [super init];
  if (self) {
    sqA_ = TicTacToeStateEmpty;
    sqB_ = TicTacToeStateEmpty;
    sqC_ = TicTacToeStateEmpty;
    sqD_ = TicTacToeStateEmpty;
    sqE_ = TicTacToeStateEmpty;
    sqF_ = TicTacToeStateEmpty;
    sqG_ = TicTacToeStateEmpty;
    sqH_ = TicTacToeStateEmpty;
    sqI_ = TicTacToeStateEmpty;
  }
  return self;
}

@end
