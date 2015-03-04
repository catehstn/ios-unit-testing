#import "TicTacToeTests.h"

@implementation TicTacToeTests

- (void)testLoadHomeScreenTapO {
  [tester waitForViewWithAccessibilityLabel:@"O"];
  [tester tapViewWithAccessibilityLabel:@"O"];
  [tester tapViewWithAccessibilityLabel:@"Back"];
}

@end
