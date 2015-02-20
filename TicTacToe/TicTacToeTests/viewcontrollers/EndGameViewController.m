#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "EndGamePresenter.h"
#import "EndGameViewController.h"

@interface EndGameViewControllerTest : XCTestCase {
  id mockPresenter_;
  EndGameViewController *viewController_;
}
@end

@implementation EndGameViewControllerTest

- (void)setUp {
  [super setUp];

  mockPresenter_ = OCMStrictClassMock([EndGamePresenter class]);
  OCMExpect([mockPresenter_ setViewController:[OCMArg any]]);
  viewController_ = [[EndGameViewController alloc] initWithPresenter:mockPresenter_];
}

- (void)tearDown {
  OCMVerifyAll(mockPresenter_);

  [super tearDown];
}

- (void)testViewLoaded {
  [viewController_ loadView];

  // TODO(cate): Fill this in.
}

@end

