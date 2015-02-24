#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "ComputerPlayer.h"
#import "TicTacToeBoard.h"

@interface ComputerPlayerTest : XCTestCase {
  TicTacToeBoard *board_;
  ComputerPlayer *player_;
}

@end

@implementation ComputerPlayerTest

- (NSInteger)countFilledSquares {
  int count = 0;
  for (int x = 0; x < 3; x++) {
    for (int y = 0; y < 3; y++) {
      if ([board_ stateForXPos:x yPos:y] != TicTacToeStateEmpty) {
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
  XCTAssertEqual([self countFilledSquares], 0);
  [player_ makeNextMove];
  XCTAssertEqual([self countFilledSquares], 1);
  [player_ makeNextMove];
  XCTAssertEqual([self countFilledSquares], 2);
  [player_ makeNextMove];
  XCTAssertEqual([self countFilledSquares], 3);
  [player_ makeNextMove];
  XCTAssertEqual([self countFilledSquares], 4);
  [player_ makeNextMove];
  XCTAssertEqual([self countFilledSquares], 5);
  [player_ makeNextMove];
  XCTAssertEqual([self countFilledSquares], 6);
  [player_ makeNextMove];
  XCTAssertEqual([self countFilledSquares], 7);
  [player_ makeNextMove];
  XCTAssertEqual([self countFilledSquares], 8);
  [player_ makeNextMove];
  XCTAssertEqual([self countFilledSquares], 9);
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

@end
