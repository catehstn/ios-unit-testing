#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "GameView.h"
#import "TicTacToeButton.h"

@interface GameViewTest : XCTestCase {
  GameView *gameView_;
}

@end

@implementation GameViewTest

- (void)setUp {
  gameView_ = [GameView new];
}

- (void)testButtons {
  // There should be 9 buttons. They should all be distinct.
  NSArray *buttons = [gameView_ buttons];
  XCTAssertEqual([buttons count], 9);

  for (int i = 0; i < [buttons count]; i++) {
    for (int j = i + 1; j < [buttons count]; j++) {
      XCTAssertNotEqual(buttons[i], buttons[j]);
    }
  }
}

- (void)testButtonXYs {
  // Should be one with each x,y value.
  NSArray *buttons = [gameView_ buttons];
  for (int x = 0; x < 3; x++) {
    for (int y = 0; y < 3; y++) {
      BOOL found = NO;
      for (TicTacToeButton *button in buttons) {
        if ([button x] == x && [button y] == y) {
          found = YES;
          break;
        }
      }
      XCTAssertTrue(found);
    }
  }
}

@end
