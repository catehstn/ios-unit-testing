#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "ComputerPlayer.h"
#import "TicTacToeBoard.h"

@interface ComputerPlayerTest : XCTestCase {
  TicTacToeBoard *board_;
  ComputerPlayer *player_;
}

// Counts how many squares are filled with that type.
- (NSInteger)countFilledSquares:(TicTacToeStateType)type;
@end

@implementation ComputerPlayerTest

- (NSInteger)countFilledSquares:(TicTacToeStateType)type {
  int count = 0;
  for (int x = 0; x < 3; x++) {
    for (int y = 0; y < 3; y++) {
      if ([board_ stateForXPos:x yPos:y] == type) {
        count++;
      }
    }
  }
  return count;
}

- (void)setUp {
  [super setUp];

  board_ = [TicTacToeBoard new];
  player_ = [[ComputerPlayer alloc] initWithBoard:board_ type:TicTacToeStateO];
}

- (void)testNextMove {
  XCTAssertEqual([self countFilledSquares:TicTacToeStateO], 0);
  [player_ makeNextMove];
  XCTAssertEqual([self countFilledSquares:TicTacToeStateO], 1);
  [player_ makeNextMove];
  XCTAssertEqual([self countFilledSquares:TicTacToeStateO], 2);
  [player_ makeNextMove];
  XCTAssertEqual([self countFilledSquares:TicTacToeStateO], 3);
  [player_ makeNextMove];
  XCTAssertEqual([self countFilledSquares:TicTacToeStateO], 4);
  [player_ makeNextMove];
  XCTAssertEqual([self countFilledSquares:TicTacToeStateO], 5);
  [player_ makeNextMove];
  XCTAssertEqual([self countFilledSquares:TicTacToeStateO], 6);
  [player_ makeNextMove];
  XCTAssertEqual([self countFilledSquares:TicTacToeStateO], 7);
  [player_ makeNextMove];
  XCTAssertEqual([self countFilledSquares:TicTacToeStateO], 8);
  [player_ makeNextMove];
  XCTAssertEqual([self countFilledSquares:TicTacToeStateO], 9);
}

- (void)testCompleteRowOO_ {
  // TODO: Fill this in.
}

- (void)testCompleteRowO_O {
  // TODO: Fill this in.
}

- (void)testCompleteRow_OO {
  // TODO: Fill this in.
}

- (void)testCompleteColumnOO_ {
  // TODO: Fill this in.
}

- (void)testCompleteColumnO_O {
  [board_ playXPos:1 yPos:0 toState:TicTacToeStateO];
  [board_ playXPos:1 yPos:2 toState:TicTacToeStateO];

  [player_ makeNextMove];

  XCTAssertEqual([board_ stateForXPos:1 yPos:1], TicTacToeStateO);
}

- (void)testCompleteColumn_OO {
  // TODO: Fill this in.
}

- (void)testBlockCompleteRowXX_ {
  // TODO: Fill this in.
}

- (void)testBlockCompleteRowX_X {
  // TODO: Fill this in.
}

- (void)testBlockCompleteRow_XX {
  // TODO: Fill this in.
}

- (void)testBlockCompleteColumnXX_ {
  // TODO: Fill this in.
}

- (void)testBlockCompleteColumnX_X {
  // TODO: Fill this in.
}

- (void)testBlockCompleteColumn_XX {
  // TODO: Fill this in.
}

- (void)testCompleteDiagonal1OO_ {
  // TODO: Fill this in.
}

- (void)testCompleteDiagonal1O_O {
  // TODO: Fill this in.
}

- (void)testCompleteDiagonal1_OO {
  // TODO: Fill this in.
}

- (void)testCompleteDiagonal2OO_ {
  // TODO: Fill this in.
}

- (void)testCompleteDiagonal2O_O {
  // TODO: Fill this in.
}

- (void)testCompleteDiagonal2_OO {
  // TODO: Fill this in.
}

- (void)testBlockDiagonal1OO_ {
  // TODO: Fill this in.
}

- (void)testBlockDiagonal1O_O {
  // TODO: Fill this in.
}

- (void)testBlockDiagonal1_OO {
  // TODO: Fill this in.
}

- (void)testBlockDiagonal2OO_ {
  // TODO: Fill this in.
}

- (void)testBlockDiagonal2O_O {
  // TODO: Fill this in.
}

- (void)testBlockDiagonal2_OO {
  // TODO: Fill this in.
}

- (void)testMultipleOptions {
  /** 
     O | X | O
     _ | _ | _
     X | X | O
   */
  [board_ playXPos:0 yPos:0 toState:TicTacToeStateO];
  [board_ playXPos:1 yPos:0 toState:TicTacToeStateX];
  [board_ playXPos:2 yPos:0 toState:TicTacToeStateO];
  [board_ playXPos:0 yPos:2 toState:TicTacToeStateX];
  [board_ playXPos:1 yPos:2 toState:TicTacToeStateX];
  [board_ playXPos:2 yPos:2 toState:TicTacToeStateO];

  [player_ makeNextMove];

  // TODO: Fill this in. How can you tell if the test has passed?
}

- (void)testWinOrLose {
  /**
   X | X | O
   O | _ | _
   X | X | O
   */
  [board_ playXPos:0 yPos:0 toState:TicTacToeStateX];
  [board_ playXPos:1 yPos:0 toState:TicTacToeStateX];
  [board_ playXPos:2 yPos:0 toState:TicTacToeStateO];
  [board_ playXPos:0 yPos:1 toState:TicTacToeStateO];
  [board_ playXPos:0 yPos:2 toState:TicTacToeStateX];
  [board_ playXPos:1 yPos:2 toState:TicTacToeStateX];
  [board_ playXPos:2 yPos:2 toState:TicTacToeStateO];

  [player_ makeNextMove];

  // TODO: Fill this in. How can you tell if the test has passed?
}

@end
