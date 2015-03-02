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
  [board_ playXPos:0 yPos:0 toState:TicTacToeStateO];
  [board_ playXPos:1 yPos:0 toState:TicTacToeStateO];

  [player_ makeNextMove];

  XCTAssertEqual([board_ stateForXPos:2 yPos:0], TicTacToeStateO);
}

- (void)testCompleteRowO_O {
  [board_ playXPos:0 yPos:1 toState:TicTacToeStateO];
  [board_ playXPos:2 yPos:1 toState:TicTacToeStateO];

  [player_ makeNextMove];

  XCTAssertEqual([board_ stateForXPos:1 yPos:1], TicTacToeStateO);
}

- (void)testCompleteRow_OO {
  [board_ playXPos:1 yPos:2 toState:TicTacToeStateO];
  [board_ playXPos:2 yPos:2 toState:TicTacToeStateO];

  [player_ makeNextMove];

  XCTAssertEqual([board_ stateForXPos:0 yPos:2], TicTacToeStateO);
}

- (void)testCompleteColumnOO_ {
  [board_ playXPos:0 yPos:0 toState:TicTacToeStateO];
  [board_ playXPos:0 yPos:1 toState:TicTacToeStateO];

  [player_ makeNextMove];

  XCTAssertEqual([board_ stateForXPos:0 yPos:2], TicTacToeStateO);
}

- (void)testCompleteColumnO_O {
  [board_ playXPos:1 yPos:0 toState:TicTacToeStateO];
  [board_ playXPos:1 yPos:2 toState:TicTacToeStateO];

  [player_ makeNextMove];

  XCTAssertEqual([board_ stateForXPos:1 yPos:1], TicTacToeStateO);
}

- (void)testCompleteColumn_OO {
  [board_ playXPos:2 yPos:1 toState:TicTacToeStateO];
  [board_ playXPos:2 yPos:2 toState:TicTacToeStateO];

  [player_ makeNextMove];

  XCTAssertEqual([board_ stateForXPos:2 yPos:0], TicTacToeStateO);
}

- (void)testBlockCompleteRowXX_ {
  [board_ playXPos:0 yPos:0 toState:TicTacToeStateX];
  [board_ playXPos:1 yPos:0 toState:TicTacToeStateX];

  [player_ makeNextMove];

  XCTAssertEqual([board_ stateForXPos:2 yPos:0], TicTacToeStateO);
}

- (void)testBlockCompleteRowX_X {
  [board_ playXPos:0 yPos:1 toState:TicTacToeStateX];
  [board_ playXPos:2 yPos:1 toState:TicTacToeStateX];

  [player_ makeNextMove];

  XCTAssertEqual([board_ stateForXPos:1 yPos:1], TicTacToeStateO);
}

- (void)testBlockCompleteRow_XX {
  [board_ playXPos:1 yPos:2 toState:TicTacToeStateX];
  [board_ playXPos:2 yPos:2 toState:TicTacToeStateX];

  [player_ makeNextMove];

  XCTAssertEqual([board_ stateForXPos:0 yPos:2], TicTacToeStateO);
}

- (void)testBlockCompleteColumnXX_ {
  [board_ playXPos:0 yPos:0 toState:TicTacToeStateX];
  [board_ playXPos:0 yPos:1 toState:TicTacToeStateX];

  [player_ makeNextMove];

  XCTAssertEqual([board_ stateForXPos:0 yPos:2], TicTacToeStateO);
}

- (void)testBlockCompleteColumnX_X {
  [board_ playXPos:1 yPos:0 toState:TicTacToeStateX];
  [board_ playXPos:1 yPos:2 toState:TicTacToeStateX];

  [player_ makeNextMove];

  XCTAssertEqual([board_ stateForXPos:1 yPos:1], TicTacToeStateO);
}

- (void)testBlockCompleteColumn_XX {
  [board_ playXPos:2 yPos:1 toState:TicTacToeStateX];
  [board_ playXPos:2 yPos:2 toState:TicTacToeStateX];

  [player_ makeNextMove];

  XCTAssertEqual([board_ stateForXPos:2 yPos:0], TicTacToeStateO);
}

- (void)testCompleteDiagonal1OO_ {
  [board_ playXPos:0 yPos:0 toState:TicTacToeStateO];
  [board_ playXPos:1 yPos:1 toState:TicTacToeStateO];

  [player_ makeNextMove];

  XCTAssertEqual([board_ stateForXPos:2 yPos:2], TicTacToeStateO);
}

- (void)testCompleteDiagonal1O_O {
  [board_ playXPos:0 yPos:0 toState:TicTacToeStateO];
  [board_ playXPos:2 yPos:2 toState:TicTacToeStateO];

  [player_ makeNextMove];

  XCTAssertEqual([board_ stateForXPos:1 yPos:1], TicTacToeStateO);
}

- (void)testCompleteDiagonal1_OO {
  [board_ playXPos:1 yPos:1 toState:TicTacToeStateO];
  [board_ playXPos:2 yPos:2 toState:TicTacToeStateO];

  [player_ makeNextMove];

  XCTAssertEqual([board_ stateForXPos:0 yPos:0], TicTacToeStateO);
}

- (void)testCompleteDiagonal2OO_ {
  [board_ playXPos:0 yPos:2 toState:TicTacToeStateO];
  [board_ playXPos:1 yPos:1 toState:TicTacToeStateO];

  [player_ makeNextMove];

  XCTAssertEqual([board_ stateForXPos:2 yPos:0], TicTacToeStateO);
}

- (void)testCompleteDiagonal2O_O {
  [board_ playXPos:0 yPos:2 toState:TicTacToeStateO];
  [board_ playXPos:2 yPos:0 toState:TicTacToeStateO];

  [player_ makeNextMove];

  XCTAssertEqual([board_ stateForXPos:1 yPos:1], TicTacToeStateO);
}

- (void)testCompleteDiagonal2_OO {
  [board_ playXPos:1 yPos:1 toState:TicTacToeStateO];
  [board_ playXPos:0 yPos:2 toState:TicTacToeStateO];

  [player_ makeNextMove];

  XCTAssertEqual([board_ stateForXPos:2 yPos:0], TicTacToeStateO);
}

- (void)testBlockDiagonal1OO_ {
  [board_ playXPos:0 yPos:0 toState:TicTacToeStateX];
  [board_ playXPos:1 yPos:1 toState:TicTacToeStateX];

  [player_ makeNextMove];

  XCTAssertEqual([board_ stateForXPos:2 yPos:2], TicTacToeStateO);
}

- (void)testBlockDiagonal1O_O {
  [board_ playXPos:0 yPos:0 toState:TicTacToeStateX];
  [board_ playXPos:2 yPos:2 toState:TicTacToeStateX];

  [player_ makeNextMove];

  XCTAssertEqual([board_ stateForXPos:1 yPos:1], TicTacToeStateO);
}

- (void)testBlockDiagonal1_OO {
  [board_ playXPos:1 yPos:1 toState:TicTacToeStateX];
  [board_ playXPos:2 yPos:2 toState:TicTacToeStateX];

  [player_ makeNextMove];

  XCTAssertEqual([board_ stateForXPos:0 yPos:0], TicTacToeStateO);
}

- (void)testBlockDiagonal2OO_ {
  [board_ playXPos:0 yPos:2 toState:TicTacToeStateX];
  [board_ playXPos:1 yPos:1 toState:TicTacToeStateX];

  [player_ makeNextMove];

  XCTAssertEqual([board_ stateForXPos:2 yPos:0], TicTacToeStateO);
}

- (void)testBlockDiagonal2O_O {
  [board_ playXPos:0 yPos:2 toState:TicTacToeStateX];
  [board_ playXPos:2 yPos:0 toState:TicTacToeStateX];

  [player_ makeNextMove];

  XCTAssertEqual([board_ stateForXPos:1 yPos:1], TicTacToeStateO);
}

- (void)testBlockDiagonal2_OO {
  [board_ playXPos:1 yPos:1 toState:TicTacToeStateX];
  [board_ playXPos:0 yPos:2 toState:TicTacToeStateX];

  [player_ makeNextMove];

  XCTAssertEqual([board_ stateForXPos:2 yPos:0], TicTacToeStateO);
}

@end
