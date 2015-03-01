#import "ComputerPlayer.h"

#import "TicTacToeBoard.h"

@interface ComputerPlayer () {
  TicTacToeBoard *board_;
  TicTacToeStateType type_;
}
- (BOOL)complete3IfPossibleForType:(TicTacToeStateType)type;
- (BOOL)completeColumnIfPossible:(int)row type:(TicTacToeStateType)type;
- (BOOL)completeRowIfPossible:(int)row type:(TicTacToeStateType)type;
- (BOOL)checkState:(TicTacToeStateType)state
        forSquareA:(TicTacToeStateType)sqA
           squareB:(TicTacToeStateType)sqB
           squareC:(TicTacToeStateType)sqC;
- (void)playXPos:(int)x yPos:(int)y;
@end

@implementation ComputerPlayer

- (id)initWithBoard:(TicTacToeBoard *)board type:(TicTacToeStateType)type {
  self = [super init];
  if (self) {
    board_ = board;
    type_ = type;
  }
  return self;
}

- (void)playXPos:(int)x yPos:(int)y {
  [board_ playXPos:x yPos:y toState:type_];
}

- (void)makeNextMove {
  // Fill in to make 3 if possible.
  if ([self complete3IfPossibleForType:type_]) {
    return;
  }

  // Block 3 if possible.
  TicTacToeStateType userType = (type_ == TicTacToeStateO) ? TicTacToeStateX : TicTacToeStateO;
  if ([self complete3IfPossibleForType:userType]) {
    return;
  }

  // Just make the first available.
  for (int x = 0; x < 3; x++) {
    for (int y = 0; y < 3; y++) {
      if ([board_ stateForXPos:x yPos:y] == TicTacToeStateEmpty) {
        [self playXPos:x yPos:y];
        return;
      }
    }
  }
}

- (BOOL)complete3IfPossibleForType:(TicTacToeStateType)type {
  for (int i = 0; i < 3; i++) {
    if ([self completeRowIfPossible:i type:type]) {
      return YES;
    }
    if ([self completeColumnIfPossible:i type:type]) {
      return YES;
    }
  }

  // Diagonal TL-BR.
  TicTacToeStateType sqA = [board_ stateForXPos:0 yPos:0];
  TicTacToeStateType sqB = [board_ stateForXPos:1 yPos:1];
  TicTacToeStateType sqC = [board_ stateForXPos:2 yPos:2];

  if ([self checkState:type forSquareA:sqA squareB:sqB squareC:sqC]) {
    if (sqA == TicTacToeStateEmpty) {
      [self playXPos:0 yPos:0];
      return YES;
    }
    if (sqB == TicTacToeStateEmpty) {
      [self playXPos:1 yPos:1];
      return YES;
    }
    if (sqC == TicTacToeStateEmpty) {
      [self playXPos:2 yPos:2];
      return YES;
    }
  }

  // Diagonal TR-BL.
  sqA = [board_ stateForXPos:0 yPos:2];
  sqB = [board_ stateForXPos:1 yPos:1];
  sqC = [board_ stateForXPos:2 yPos:0];

  if ([self checkState:type forSquareA:sqA squareB:sqB squareC:sqC]) {
    if (sqA == TicTacToeStateEmpty) {
      [self playXPos:0 yPos:2];
      return YES;
    }
    if (sqB == TicTacToeStateEmpty) {
      [self playXPos:1 yPos:1];
      return YES;
    }
    if (sqC == TicTacToeStateEmpty) {
      [self playXPos:2 yPos:0];
      return YES;
    }
  }

  return NO;
}

- (BOOL)completeColumnIfPossible:(int)column type:(TicTacToeStateType)type {
  TicTacToeStateType sqA = [board_ stateForXPos:0 yPos:column];
  TicTacToeStateType sqB = [board_ stateForXPos:1 yPos:column];
  TicTacToeStateType sqC = [board_ stateForXPos:2 yPos:column];

  if ([self checkState:type forSquareA:sqA squareB:sqB squareC:sqC]) {
    if (sqA == TicTacToeStateEmpty) {
      [self playXPos:0 yPos:column];
      return YES;
    }
    if (sqB == TicTacToeStateEmpty) {
      [self playXPos:1 yPos:column];
      return YES;
    }
    if (sqC == TicTacToeStateEmpty) {
      [self playXPos:2 yPos:column];
      return YES;
    }
  }
  return NO;
}

- (BOOL)completeRowIfPossible:(int)row type:(TicTacToeStateType)type {
  TicTacToeStateType sqA = [board_ stateForXPos:row yPos:0];
  TicTacToeStateType sqB = [board_ stateForXPos:row yPos:1];
  TicTacToeStateType sqC = [board_ stateForXPos:row yPos:2];

  if ([self checkState:type forSquareA:sqA squareB:sqB squareC:sqC]) {
    if (sqA == TicTacToeStateEmpty) {
      [self playXPos:row yPos:0];
      return YES;
    }
    if (sqB == TicTacToeStateEmpty) {
      [self playXPos:row yPos:1];
      return YES;
    }
    if (sqC == TicTacToeStateEmpty) {
      [self playXPos:row yPos:2];
      return YES;
    }
  }
  return NO;
}

- (BOOL)checkState:(TicTacToeStateType)state
        forSquareA:(TicTacToeStateType)sqA
           squareB:(TicTacToeStateType)sqB
           squareC:(TicTacToeStateType)sqC {
  int empty = 0;
  empty += (sqA == TicTacToeStateEmpty) ? 1 : 0;
  empty += (sqB == TicTacToeStateEmpty) ? 1 : 0;
  empty += (sqC == TicTacToeStateEmpty) ? 1 : 0;

  // One should be empty.
  if (empty != 1) {
    return NO;
  }

  int ofState = 0;
  ofState += (sqA == state) ? 1 : 0;
  ofState += (sqB == state) ? 1 : 0;
  ofState += (sqC == state) ? 1 : 0;

  // The other two should be the right type.
  return ofState == 2;
}

@end
