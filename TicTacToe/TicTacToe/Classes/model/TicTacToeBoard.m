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

- (void)setA:(TicTacToeStateType)state {
  if (sqA_ == TicTacToeStateEmpty) {
    sqA_ = state;
  }
}

- (void)setB:(TicTacToeStateType)state {
  if (sqB_ == TicTacToeStateEmpty) {
    sqB_ = state;
  }
}

- (void)setC:(TicTacToeStateType)state {
  if (sqC_ == TicTacToeStateEmpty) {
    sqC_ = state;
  }
}

- (void)setD:(TicTacToeStateType)state {
  if (sqD_ == TicTacToeStateEmpty) {
    sqD_ = state;
  }
}

- (void)setE:(TicTacToeStateType)state {
  if (sqE_ == TicTacToeStateEmpty) {
    sqE_ = state;
  }
}

- (void)setF:(TicTacToeStateType)state {
  if (sqF_ == TicTacToeStateEmpty) {
    sqF_ = state;
  }
}

- (void)setG:(TicTacToeStateType)state {
  if (sqG_ == TicTacToeStateEmpty) {
    sqG_ = state;
  }
}

- (void)setH:(TicTacToeStateType)state {
  if (sqH_ == TicTacToeStateEmpty) {
    sqH_ = state;
  }
}

- (void)setI:(TicTacToeStateType)state {
  if (sqI_ == TicTacToeStateEmpty) {
    sqI_ = state;
  }
}

@end
