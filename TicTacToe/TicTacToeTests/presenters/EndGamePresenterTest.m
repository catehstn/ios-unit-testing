#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "EndGamePresenter.h"
#import "EndGameViewController.h"

@interface EndGamePresenterTest : XCTestCase {
  id mockViewController_;
  id presenter_;
}

@end

@implementation EndGamePresenterTest

- (void)setUp {
  [super setUp];

  mockViewController_ = OCMStrictClassMock([EndGameViewController class]);
  presenter_ = [EndGamePresenter new];
  [presenter_ setViewController:mockViewController_];
}

- (void)tearDown {
  OCMVerifyAll(mockViewController_);

  [super tearDown];
}

- (void)testCreateViewController {
  EndGameViewController *viewController = [EndGamePresenter createViewController];
  XCTAssertNotNil(viewController);

  EndGamePresenter *presenter = (EndGamePresenter *) [viewController presenter];
  XCTAssertNotNil(presenter);
}

@end
