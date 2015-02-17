#import "TicTacToeBoard.h"

/*
  The board is:
  0,0 | 0,1 | 0,2
  1,0 | 1,1 | 1,2
  2,0 | 2,1 | 2,2
*/
@interface TicTacToeBoard () {
  NSArray *board_;
}
@end

@implementation TicTacToeBoard

- (id)init {
  self = [super init];
  if (self) {
    NSNumber *v = [NSNumber numberWithInteger:TicTacToeStateEmpty];
    board_ = @[@[v, v, v], @[v, v, v], @[v, v, v]];
  }
  return self;
}

- (BOOL)playXPos:(int)x yPos:(int)y toState:(TicTacToeStateType)state {
  if (x > 2 || y > 2 || state == TicTacToeStateEmpty ||
      [board_[x][y] intValue] != TicTacToeStateEmpty) {
    return NO;
  }
  board_[x][y] = [NSNumber numberWithInteger:state];
  return YES;
}

@end
