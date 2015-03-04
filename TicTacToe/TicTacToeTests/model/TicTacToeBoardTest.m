#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "TicTacToeBoard.h"

@interface TicTacToeBoardTest : XCTestCase {
  TicTacToeBoard *board_;
}

@end

@implementation TicTacToeBoardTest

- (void)setUp {
  [super setUp];
  board_ = [TicTacToeBoard new];
}

- (void)testBoardInitializationAllEmpty {
  for (int x = 0; x < 3; x++) {
    for (int y = 0; y < 3; y++) {
      XCTAssertEqual([board_ stateForXPos:x yPos:y], TicTacToeStateEmpty);
    }
  }
}

- (void)testPlayValid {
  for (int x = 0; x < 3; x++) {
    for (int y = 0; y < 3; y++) {
      XCTAssertTrue([board_ playXPos:x yPos:y toState:TicTacToeStateO]);
      XCTAssertEqual([board_ stateForXPos:x yPos:y], TicTacToeStateO);
    }
  }
}

- (void)testStateNegativeX {
  XCTAssertEqual([board_ stateForXPos:-2 yPos:2], TicTacToeStateInvalid);
}

- (void)testStateXTooLarge {
  // TODO: Fill this in.
}

- (void)testStateNegativeY {
  // TODO: Fill this in.
}

- (void)testStateYTooLarge {
  // TODO: Fill this in.
}

- (void)testPlayNegativeX {
  // TODO: Fill this in.
}

- (void)testPlayXTooLarge {
  // TODO: Fill this in.
}

- (void)testPlayNegativeY {
  // TODO: Fill this in.
}

- (void)testPlayYTooLarge {
  XCTAssertFalse([board_ playXPos:2 yPos:3 toState:TicTacToeStateO]);
}

- (void)testPlayEmptyState {
  // TODO: Fill this in.
}

- (void)testPlayInvalidState {
  XCTAssertFalse([board_ playXPos:2 yPos:2 toState:TicTacToeStateInvalid]);
}

- (void)testPlayOverOtherPlay {
  XCTAssertTrue([board_ playXPos:1 yPos:1 toState:TicTacToeStateX]);
  XCTAssertFalse([board_ playXPos:1 yPos:1 toState:TicTacToeStateO]);
  XCTAssertEqual([board_ stateForXPos:1 yPos:1], TicTacToeStateX);
}

- (void)testGameStateWithSpaces {
  XCTAssertEqual([board_ gameState], TicTacToeGameStateNotEnded);
  XCTAssertTrue([board_ playXPos:0 yPos:0 toState:TicTacToeStateO]);
  XCTAssertEqual([board_ gameState], TicTacToeGameStateNotEnded);

  // TODO: Fill this in.
}

- (void)testGameStateFull {
  XCTAssertTrue([board_ playXPos:0 yPos:0 toState:TicTacToeStateO]);
  XCTAssertEqual([board_ gameState], TicTacToeGameStateNotEnded);

  // TODO: Fill this in.

  XCTAssertEqual([board_ gameState], TicTacToeGameStateBoardFull);
}

- (void)testGameStateFullOWins {
  /*
   O | X | O
   X | O | X
   O | O | X
   */
  XCTAssertTrue([board_ playXPos:0 yPos:0 toState:TicTacToeStateO]);
  XCTAssertEqual([board_ gameState], TicTacToeGameStateNotEnded);
  XCTAssertTrue([board_ playXPos:1 yPos:0 toState:TicTacToeStateX]);
  XCTAssertEqual([board_ gameState], TicTacToeGameStateNotEnded);
  XCTAssertTrue([board_ playXPos:2 yPos:0 toState:TicTacToeStateO]);
  XCTAssertEqual([board_ gameState], TicTacToeGameStateNotEnded);
  XCTAssertTrue([board_ playXPos:0 yPos:1 toState:TicTacToeStateX]);
  XCTAssertEqual([board_ gameState], TicTacToeGameStateNotEnded);
  XCTAssertTrue([board_ playXPos:2 yPos:1 toState:TicTacToeStateX]);
  XCTAssertEqual([board_ gameState], TicTacToeGameStateNotEnded);
  XCTAssertTrue([board_ playXPos:0 yPos:2 toState:TicTacToeStateO]);
  XCTAssertEqual([board_ gameState], TicTacToeGameStateNotEnded);
  XCTAssertTrue([board_ playXPos:1 yPos:2 toState:TicTacToeStateO]);
  XCTAssertEqual([board_ gameState], TicTacToeGameStateNotEnded);
  XCTAssertTrue([board_ playXPos:2 yPos:2 toState:TicTacToeStateX]);
  XCTAssertEqual([board_ gameState], TicTacToeGameStateNotEnded);

  XCTAssertTrue([board_ playXPos:1 yPos:1 toState:TicTacToeStateO]);
  XCTAssertEqual([board_ gameState], TicTacToeGameStateOWin);
}

- (void)testGameStateFullXWins {
  /*
   X | O | X
   O | X | O
   X | X | O
   */
  XCTAssertTrue([board_ playXPos:0 yPos:0 toState:TicTacToeStateX]);
  XCTAssertEqual([board_ gameState], TicTacToeGameStateNotEnded);
  XCTAssertTrue([board_ playXPos:0 yPos:1 toState:TicTacToeStateO]);
  XCTAssertEqual([board_ gameState], TicTacToeGameStateNotEnded);
  XCTAssertTrue([board_ playXPos:0 yPos:2 toState:TicTacToeStateX]);
  XCTAssertEqual([board_ gameState], TicTacToeGameStateNotEnded);
  XCTAssertTrue([board_ playXPos:1 yPos:0 toState:TicTacToeStateO]);
  XCTAssertEqual([board_ gameState], TicTacToeGameStateNotEnded);
  XCTAssertTrue([board_ playXPos:1 yPos:2 toState:TicTacToeStateX]);
  XCTAssertEqual([board_ gameState], TicTacToeGameStateNotEnded);
  XCTAssertTrue([board_ playXPos:2 yPos:0 toState:TicTacToeStateX]);
  XCTAssertEqual([board_ gameState], TicTacToeGameStateNotEnded);
  XCTAssertTrue([board_ playXPos:2 yPos:1 toState:TicTacToeStateO]);
  XCTAssertEqual([board_ gameState], TicTacToeGameStateNotEnded);
  XCTAssertTrue([board_ playXPos:2 yPos:2 toState:TicTacToeStateO]);
  XCTAssertEqual([board_ gameState], TicTacToeGameStateNotEnded);

  XCTAssertTrue([board_ playXPos:1 yPos:1 toState:TicTacToeStateX]);
  XCTAssertEqual([board_ gameState], TicTacToeGameStateXWin);
}

- (void)testHorizontalOWin1 {
  // TODO: Fill this in.
}

- (void)testHorizontalXWin1 {
  // TODO: Fill this in.
}


- (void)testHorizontalOWin2 {
  // TODO: Fill this in.
}

- (void)testHorizontalXWin2 {
  // TODO: Fill this in.
}

- (void)testHorizontalOWin3 {
  // TODO: Fill this in.
}

- (void)testHorizontalXWin3 {
  // TODO: Fill this in.
}

- (void)testVerticalOWin1 {
  // TODO: Fill this in.
}

- (void)testVerticalXWin1 {
 // TODO: Fill this in.
}

- (void)testVerticalOWin2 {
  // TODO: Fill this in.
}

- (void)testVerticalXWin2 {
  // TODO: Fill this in.
}

- (void)testVerticalOWin3 {
  // TODO: Fill this in.
}

- (void)testVerticalXWin3 {
  // TODO: Fill this in.
}

- (void)testDiagonalOWin1 {
  // TODO: Fill this in.
}

- (void)testDiagonalXWin1 {
  // TODO: Fill this in.
}

- (void)testDiagonalOWin2 {
  // TODO: Fill this in.
}

- (void)testDiagonalXWin2 {
  // TODO: Fill this in.
}

@end
