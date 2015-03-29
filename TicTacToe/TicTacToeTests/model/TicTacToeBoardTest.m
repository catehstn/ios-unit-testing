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
  XCTAssertEqual([board_ stateForXPos:3 yPos:2], TicTacToeStateInvalid);
}

- (void)testStateNegativeY {
  XCTAssertEqual([board_ stateForXPos:2 yPos:-2], TicTacToeStateInvalid);
}

- (void)testStateYTooLarge {
  XCTAssertEqual([board_ stateForXPos:0 yPos:3], TicTacToeStateInvalid);
}

- (void)testPlayNegativeX {
  XCTAssertFalse([board_ playXPos:-2 yPos:1 toState:TicTacToeStateO]);
}

- (void)testPlayXTooLarge {
  XCTAssertFalse([board_ playXPos:3 yPos:1 toState:TicTacToeStateO]);
}

- (void)testPlayNegativeY {
  XCTAssertFalse([board_ playXPos:2 yPos:-1 toState:TicTacToeStateO]);
}

- (void)testPlayYTooLarge {
  XCTAssertFalse([board_ playXPos:2 yPos:3 toState:TicTacToeStateO]);
}

- (void)testPlayEmptyState {
  XCTAssertFalse([board_ playXPos:2 yPos:2 toState:TicTacToeStateEmpty]);
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
  XCTAssertTrue([board_ playXPos:1 yPos:0 toState:TicTacToeStateO]);
  XCTAssertEqual([board_ gameState], TicTacToeGameStateNotEnded);
  XCTAssertTrue([board_ playXPos:2 yPos:0 toState:TicTacToeStateX]);
  XCTAssertEqual([board_ gameState], TicTacToeGameStateNotEnded);
  XCTAssertTrue([board_ playXPos:0 yPos:1 toState:TicTacToeStateO]);
  XCTAssertEqual([board_ gameState], TicTacToeGameStateNotEnded);
  XCTAssertTrue([board_ playXPos:2 yPos:1 toState:TicTacToeStateX]);
  XCTAssertEqual([board_ gameState], TicTacToeGameStateNotEnded);
  XCTAssertTrue([board_ playXPos:0 yPos:2 toState:TicTacToeStateX]);
  XCTAssertEqual([board_ gameState], TicTacToeGameStateNotEnded);
  XCTAssertTrue([board_ playXPos:1 yPos:2 toState:TicTacToeStateX]);
  XCTAssertEqual([board_ gameState], TicTacToeGameStateNotEnded);
  XCTAssertTrue([board_ playXPos:2 yPos:2 toState:TicTacToeStateO]);
  XCTAssertEqual([board_ gameState], TicTacToeGameStateNotEnded);
}

- (void)testGameStateFull {
  /*
   O | X | O
   X | X | O
   O | O | X
   */
  XCTAssertTrue([board_ playXPos:0 yPos:0 toState:TicTacToeStateO]);
  XCTAssertEqual([board_ gameState], TicTacToeGameStateNotEnded);
  XCTAssertTrue([board_ playXPos:0 yPos:1 toState:TicTacToeStateX]);
  XCTAssertEqual([board_ gameState], TicTacToeGameStateNotEnded);
  XCTAssertTrue([board_ playXPos:0 yPos:2 toState:TicTacToeStateO]);
  XCTAssertEqual([board_ gameState], TicTacToeGameStateNotEnded);
  XCTAssertTrue([board_ playXPos:1 yPos:0 toState:TicTacToeStateX]);
  XCTAssertEqual([board_ gameState], TicTacToeGameStateNotEnded);
  XCTAssertTrue([board_ playXPos:1 yPos:1 toState:TicTacToeStateX]);
  XCTAssertEqual([board_ gameState], TicTacToeGameStateNotEnded);
  XCTAssertTrue([board_ playXPos:1 yPos:2 toState:TicTacToeStateO]);
  XCTAssertEqual([board_ gameState], TicTacToeGameStateNotEnded);
  XCTAssertTrue([board_ playXPos:2 yPos:0 toState:TicTacToeStateO]);
  XCTAssertEqual([board_ gameState], TicTacToeGameStateNotEnded);
  XCTAssertTrue([board_ playXPos:2 yPos:1 toState:TicTacToeStateO]);
  XCTAssertEqual([board_ gameState], TicTacToeGameStateNotEnded);
  XCTAssertTrue([board_ playXPos:2 yPos:2 toState:TicTacToeStateX]);
  XCTAssertEqual([board_ gameState], TicTacToeGameStateBoardFull);
}

- (void)testGameStateOWins {
  /*
   O | X | O
   X | O | _
   O | _ | X
   */
  XCTAssertTrue([board_ playXPos:0 yPos:0 toState:TicTacToeStateO]);
  XCTAssertEqual([board_ gameState], TicTacToeGameStateNotEnded);
  XCTAssertTrue([board_ playXPos:0 yPos:1 toState:TicTacToeStateX]);
  XCTAssertEqual([board_ gameState], TicTacToeGameStateNotEnded);
  XCTAssertTrue([board_ playXPos:0 yPos:2 toState:TicTacToeStateO]);
  XCTAssertEqual([board_ gameState], TicTacToeGameStateNotEnded);
  XCTAssertTrue([board_ playXPos:1 yPos:0 toState:TicTacToeStateX]);
  XCTAssertEqual([board_ gameState], TicTacToeGameStateNotEnded);
  XCTAssertTrue([board_ playXPos:2 yPos:0 toState:TicTacToeStateO]);
  XCTAssertEqual([board_ gameState], TicTacToeGameStateNotEnded);
  XCTAssertTrue([board_ playXPos:2 yPos:2 toState:TicTacToeStateX]);
  XCTAssertEqual([board_ gameState], TicTacToeGameStateNotEnded);
  XCTAssertTrue([board_ playXPos:1 yPos:1 toState:TicTacToeStateO]);
  XCTAssertEqual([board_ gameState], TicTacToeGameStateOWin);
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

- (void)testGameStateXWins {
  /*
   X | O | X
   O | X | _
   X | _ | O
   */
  XCTAssertTrue([board_ playXPos:0 yPos:0 toState:TicTacToeStateX]);
  XCTAssertEqual([board_ gameState], TicTacToeGameStateNotEnded);
  XCTAssertTrue([board_ playXPos:0 yPos:1 toState:TicTacToeStateO]);
  XCTAssertEqual([board_ gameState], TicTacToeGameStateNotEnded);
  XCTAssertTrue([board_ playXPos:0 yPos:2 toState:TicTacToeStateX]);
  XCTAssertEqual([board_ gameState], TicTacToeGameStateNotEnded);
  XCTAssertTrue([board_ playXPos:1 yPos:0 toState:TicTacToeStateO]);
  XCTAssertEqual([board_ gameState], TicTacToeGameStateNotEnded);
  XCTAssertTrue([board_ playXPos:2 yPos:0 toState:TicTacToeStateX]);
  XCTAssertEqual([board_ gameState], TicTacToeGameStateNotEnded);
  XCTAssertTrue([board_ playXPos:2 yPos:2 toState:TicTacToeStateO]);
  XCTAssertEqual([board_ gameState], TicTacToeGameStateNotEnded);
  XCTAssertTrue([board_ playXPos:1 yPos:1 toState:TicTacToeStateX]);
  XCTAssertEqual([board_ gameState], TicTacToeGameStateXWin);
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
  XCTAssertTrue([board_ playXPos:0 yPos:0 toState:TicTacToeStateO]);
  XCTAssertTrue([board_ playXPos:0 yPos:1 toState:TicTacToeStateO]);
  XCTAssertTrue([board_ playXPos:0 yPos:2 toState:TicTacToeStateO]);
  XCTAssertEqual([board_ gameState], TicTacToeGameStateOWin);
}

- (void)testHorizontalXWin1 {
  XCTAssertTrue([board_ playXPos:0 yPos:0 toState:TicTacToeStateX]);
  XCTAssertTrue([board_ playXPos:0 yPos:1 toState:TicTacToeStateX]);
  XCTAssertTrue([board_ playXPos:0 yPos:2 toState:TicTacToeStateX]);
  XCTAssertEqual([board_ gameState], TicTacToeGameStateXWin);
}


- (void)testHorizontalOWin2 {
  XCTAssertTrue([board_ playXPos:1 yPos:0 toState:TicTacToeStateO]);
  XCTAssertTrue([board_ playXPos:1 yPos:1 toState:TicTacToeStateO]);
  XCTAssertTrue([board_ playXPos:1 yPos:2 toState:TicTacToeStateO]);
  XCTAssertEqual([board_ gameState], TicTacToeGameStateOWin);
}

- (void)testHorizontalXWin2 {
  XCTAssertTrue([board_ playXPos:1 yPos:0 toState:TicTacToeStateX]);
  XCTAssertTrue([board_ playXPos:1 yPos:1 toState:TicTacToeStateX]);
  XCTAssertTrue([board_ playXPos:1 yPos:2 toState:TicTacToeStateX]);
  XCTAssertEqual([board_ gameState], TicTacToeGameStateXWin);
}

- (void)testHorizontalOWin3 {
  XCTAssertTrue([board_ playXPos:2 yPos:0 toState:TicTacToeStateO]);
  XCTAssertTrue([board_ playXPos:2 yPos:1 toState:TicTacToeStateO]);
  XCTAssertTrue([board_ playXPos:2 yPos:2 toState:TicTacToeStateO]);
  XCTAssertEqual([board_ gameState], TicTacToeGameStateOWin);
}

- (void)testHorizontalXWin3 {
  XCTAssertTrue([board_ playXPos:2 yPos:0 toState:TicTacToeStateX]);
  XCTAssertTrue([board_ playXPos:2 yPos:1 toState:TicTacToeStateX]);
  XCTAssertTrue([board_ playXPos:2 yPos:2 toState:TicTacToeStateX]);
  XCTAssertEqual([board_ gameState], TicTacToeGameStateXWin);
}

- (void)testVerticalOWin1 {
  XCTAssertTrue([board_ playXPos:0 yPos:0 toState:TicTacToeStateO]);
  XCTAssertTrue([board_ playXPos:1 yPos:0 toState:TicTacToeStateO]);
  XCTAssertTrue([board_ playXPos:2 yPos:0 toState:TicTacToeStateO]);
  XCTAssertEqual([board_ gameState], TicTacToeGameStateOWin);
}

- (void)testVerticalXWin1 {
  XCTAssertTrue([board_ playXPos:0 yPos:0 toState:TicTacToeStateX]);
  XCTAssertTrue([board_ playXPos:1 yPos:0 toState:TicTacToeStateX]);
  XCTAssertTrue([board_ playXPos:2 yPos:0 toState:TicTacToeStateX]);
  XCTAssertEqual([board_ gameState], TicTacToeGameStateXWin);
}

- (void)testVerticalOWin2 {
  XCTAssertTrue([board_ playXPos:0 yPos:1 toState:TicTacToeStateO]);
  XCTAssertTrue([board_ playXPos:1 yPos:1 toState:TicTacToeStateO]);
  XCTAssertTrue([board_ playXPos:2 yPos:1 toState:TicTacToeStateO]);
  XCTAssertEqual([board_ gameState], TicTacToeGameStateOWin);
}

- (void)testVerticalXWin2 {
  XCTAssertTrue([board_ playXPos:0 yPos:1 toState:TicTacToeStateX]);
  XCTAssertTrue([board_ playXPos:1 yPos:1 toState:TicTacToeStateX]);
  XCTAssertTrue([board_ playXPos:2 yPos:1 toState:TicTacToeStateX]);
  XCTAssertEqual([board_ gameState], TicTacToeGameStateXWin);
}

- (void)testVerticalOWin3 {
  XCTAssertTrue([board_ playXPos:0 yPos:2 toState:TicTacToeStateO]);
  XCTAssertTrue([board_ playXPos:1 yPos:2 toState:TicTacToeStateO]);
  XCTAssertTrue([board_ playXPos:2 yPos:2 toState:TicTacToeStateO]);
  XCTAssertEqual([board_ gameState], TicTacToeGameStateOWin);
}

- (void)testVerticalXWin3 {
  XCTAssertTrue([board_ playXPos:0 yPos:2 toState:TicTacToeStateX]);
  XCTAssertTrue([board_ playXPos:1 yPos:2 toState:TicTacToeStateX]);
  XCTAssertTrue([board_ playXPos:2 yPos:2 toState:TicTacToeStateX]);
  XCTAssertEqual([board_ gameState], TicTacToeGameStateXWin);
}

- (void)testDiagonalOWin1 {
  XCTAssertTrue([board_ playXPos:0 yPos:0 toState:TicTacToeStateO]);
  XCTAssertTrue([board_ playXPos:1 yPos:1 toState:TicTacToeStateO]);
  XCTAssertTrue([board_ playXPos:2 yPos:2 toState:TicTacToeStateO]);
  XCTAssertEqual([board_ gameState], TicTacToeGameStateOWin);
}

- (void)testDiagonalXWin1 {
  XCTAssertTrue([board_ playXPos:0 yPos:0 toState:TicTacToeStateX]);
  XCTAssertTrue([board_ playXPos:1 yPos:1 toState:TicTacToeStateX]);
  XCTAssertTrue([board_ playXPos:2 yPos:2 toState:TicTacToeStateX]);
  XCTAssertEqual([board_ gameState], TicTacToeGameStateXWin);
}

- (void)testDiagonalOWin2 {
  XCTAssertTrue([board_ playXPos:0 yPos:2 toState:TicTacToeStateO]);
  XCTAssertTrue([board_ playXPos:1 yPos:1 toState:TicTacToeStateO]);
  XCTAssertTrue([board_ playXPos:2 yPos:0 toState:TicTacToeStateO]);
  XCTAssertEqual([board_ gameState], TicTacToeGameStateOWin);
}

- (void)testDiagonalXWin2 {
  XCTAssertTrue([board_ playXPos:0 yPos:2 toState:TicTacToeStateX]);
  XCTAssertTrue([board_ playXPos:1 yPos:1 toState:TicTacToeStateX]);
  XCTAssertTrue([board_ playXPos:2 yPos:0 toState:TicTacToeStateX]);
  XCTAssertEqual([board_ gameState], TicTacToeGameStateXWin);
}

@end
