#import "TicTacToeTests.h"

@implementation TicTacToeTests

- (void)testLoadHomeScreen {
  [tester waitForViewWithAccessibilityLabel:@"O"];
}

@end
