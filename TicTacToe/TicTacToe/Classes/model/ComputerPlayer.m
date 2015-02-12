#import "ComputerPlayer.h"

#import "TicTacToeBoard.h"

@interface ComputerPlayer () {
  TicTacToeBoard *board_;
}
@end

@implementation ComputerPlayer

- (id)initWithBoard:(TicTacToeBoard *)board {
  self = [super init];
  if (self) {
    board_ = board;
  }
  return self;
}

@end
