#import "TicTacToeTests.h"

@implementation TicTacToeTests

- (void)testLoadHomeScreenTapO {
  [tester waitForViewWithAccessibilityLabel:@"O"];
  [tester tapViewWithAccessibilityLabel:@"O"];
  [tester tapViewWithAccessibilityLabel:@"1,1"];
  [tester tapViewWithAccessibilityLabel:@"Back"];
}

@end
