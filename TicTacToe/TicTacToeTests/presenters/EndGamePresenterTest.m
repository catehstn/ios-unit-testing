#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "EndGamePresenter.h"
#import "EndGameView.h"
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

- (void)testCreateViewControllerTie {
  EndGameViewController *viewController = (EndGameViewController *)
      [EndGamePresenter createViewControllerWithEndGameState:TicTacToeGameStateBoardFull];
  XCTAssertNotNil(viewController);

  EndGamePresenter *presenter = (EndGamePresenter *) [viewController presenter];
  XCTAssertNotNil(presenter);

  [presenter viewLoaded];

  XCTAssertEqualObjects([[[viewController endGameView] gameStateLabel] text], kTie);
}

- (void)testCreateViewControllerOWins {
  EndGameViewController *viewController = (EndGameViewController *)
      [EndGamePresenter createViewControllerWithEndGameState:TicTacToeGameStateOWin];
  XCTAssertNotNil(viewController);

  EndGamePresenter *presenter = (EndGamePresenter *) [viewController presenter];
  XCTAssertNotNil(presenter);

  [presenter viewLoaded];

  XCTAssertEqualObjects([[[viewController endGameView] gameStateLabel] text], kOWin);
}

- (void)testCreateViewControllerXWins {
  EndGameViewController *viewController = (EndGameViewController *)
      [EndGamePresenter createViewControllerWithEndGameState:TicTacToeGameStateXWin];
  XCTAssertNotNil(viewController);

  EndGamePresenter *presenter = (EndGamePresenter *) [viewController presenter];
  XCTAssertNotNil(presenter);

  [presenter viewLoaded];

  XCTAssertEqualObjects([[[viewController endGameView] gameStateLabel] text], kXWin);
}

@end
