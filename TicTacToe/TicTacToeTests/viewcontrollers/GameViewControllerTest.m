#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "GamePresenter.h"
#import "GameViewController.h"

@interface GameViewControllerTest : XCTestCase {
  id mockPresenter_;
  GameViewController *viewController_;
}
@end

@implementation GameViewControllerTest

- (void)setUp {
  [super setUp];

  mockPresenter_ = OCMStrictClassMock([GamePresenter class]);
  OCMExpect([mockPresenter_ setViewController:[OCMArg any]]);
  viewController_ = [[GameViewController alloc] initWithPresenter:mockPresenter_];
}

- (void)tearDown {
  OCMVerifyAll(mockPresenter_);

  [super tearDown];
}

- (void)testViewLoaded {
  [viewController_ loadView];
  XCTAssertNotNil([viewController_ gameView]);
}

@end
