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

@end
