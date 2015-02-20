#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "CHPresenter.h"
#import "CHViewController.h"

@interface CHPresenterTest : XCTestCase {
  id mockViewController_;
  CHPresenter *presenter_;
}

@end

@implementation CHPresenterTest

- (void)setUp {
  [super setUp];

  mockViewController_ = OCMStrictClassMock([CHViewController class]);
  presenter_ = [[CHPresenter alloc] init];
  [presenter_ setViewController:mockViewController_];
}

- (void)tearDown {
  OCMVerifyAll(mockViewController_);
  [super tearDown];
}

- (void)testViewLoaded {
  // By default, do nothing.
  [presenter_ viewLoaded];
}

- (void)testViewWillDisappear {
  // By default, do nothing.
  [presenter_ viewWillDisappear];
}

- (void)testLeftNavigationButtons {
  // By default, empty.
  XCTAssertEqual(0, [[presenter_ leftNavigationButtons] count]);
}

- (void)testRightNavigationButtons {
  // By default, empty.
  XCTAssertEqual(0, [[presenter_ rightNavigationButtons] count]);
}

@end
