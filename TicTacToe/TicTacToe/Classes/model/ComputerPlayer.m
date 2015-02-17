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
  for (int x = 0; x < 3; x++) {
    for (int y = 0; y < 3; y++) {
      if ([board_ stateForXPos:x yPos:y] == TicTacToeStateEmpty) {
        [board_ playXPos:x yPos:y toState:type_];
        return;
      }
    }
  }
}

@end
