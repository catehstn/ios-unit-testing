#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "EndGamePresenter.h"
#import "EndGameView.h"
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

- (void)testSetGameStateText {
  OCMExpect([mockPresenter_ leftNavigationButtons]).andReturn([NSArray array]);
  OCMExpect([mockPresenter_ rightNavigationButtons]).andReturn([NSArray array]);
  OCMExpect([mockPresenter_ viewLoaded]);

  NSString *gameState = @"anything goes";
  [viewController_ setGameOverStateText:gameState];
  XCTAssertEqualObjects([[[viewController_ endGameView] gameStateLabel] text], gameState);
}

@end

