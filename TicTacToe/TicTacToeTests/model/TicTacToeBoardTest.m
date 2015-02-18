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

- (void)testPlayValid {
  for (int x = 0; x < 3; x++) {
    for (int y = 0; y < 3; y++) {
      XCTAssertTrue([board_ playXPos:x yPos:y toState:TicTacToeStateO]);
    }
  }
}

- (void)testPlayOverOtherPlay {
  XCTAssertTrue([board_ playXPos:1 yPos:1 toState:TicTacToeStateX]);
  XCTAssertFalse([board_ playXPos:1 yPos:1 toState:TicTacToeStateO]);
}

@end
