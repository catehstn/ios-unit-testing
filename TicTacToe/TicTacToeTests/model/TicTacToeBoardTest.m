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

@end
