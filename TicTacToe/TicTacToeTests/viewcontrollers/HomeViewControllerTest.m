#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "HomePresenter.h"
#import "HomeViewController.h"

@interface HomeViewControllerTest : XCTestCase {
  id mockPresenter_;
  HomeViewController *viewController_;
}
@end

@implementation HomeViewControllerTest

- (void)setUp {
  [super setUp];

  mockPresenter_ = OCMStrictClassMock([HomePresenter class]);
  OCMExpect([mockPresenter_ setViewController:[OCMArg any]]);
  viewController_ = [[HomeViewController alloc] initWithPresenter:mockPresenter_];
}

- (void)tearDown {
  OCMVerifyAll(mockPresenter_);

  [super tearDown];
}

- (void)testViewLoaded {
  [viewController_ loadView];
  XCTAssertNotNil([viewController_ homeView]);
}

@end
