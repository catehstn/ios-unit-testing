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
  OCMVerify([mockPresenter_ setViewController:viewController_]);
}

- (void)tearDown {
  OCMVerifyAll(mockPresenter_);

  [super tearDown];
}

- (void)testViewLoaded {
  OCMExpect([mockPresenter_ leftNavigationButtons]);
  OCMExpect([mockPresenter_ rightNavigationButtons]);
  OCMExpect([mockPresenter_ viewLoaded]);

  XCTAssertNotNil([viewController_ homeView]);
}

@end
