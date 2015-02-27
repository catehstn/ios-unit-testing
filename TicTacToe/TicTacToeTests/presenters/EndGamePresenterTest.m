#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "EndGamePresenter.h"
#import "EndGameView.h"
#import "EndGameViewController.h"
#import "HomeViewController.h"

@interface EndGamePresenterTest : XCTestCase {
  id mockView_;
  id mockViewController_;
  id presenter_;
}

@end

@implementation EndGamePresenterTest

- (void)setUp {
  [super setUp];

  mockViewController_ = OCMStrictClassMock([EndGameViewController class]);
  mockView_ = OCMStrictClassMock([EndGameView class]);
  OCMStub([mockViewController_ endGameView]).andReturn(mockView_);

  presenter_ = [[EndGamePresenter alloc] initWithEndGameState:TicTacToeGameStateBoardFull];
  [presenter_ setViewController:mockViewController_];
}

- (void)tearDown {
  OCMVerifyAll(mockView_);
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

- (void)testViewLoaded {
  id mockButton = OCMStrictClassMock([UIButton class]);
  OCMStub([mockView_ playAgainButton]).andReturn(mockButton);

  OCMExpect([mockViewController_ setGameOverStateText:[OCMArg any]]);
  OCMExpect([mockButton addTarget:presenter_
                           action:[OCMArg anySelector]
                 forControlEvents:UIControlEventTouchUpInside]);

  [presenter_ viewLoaded];
}

- (void)testTapPlayAgainButton {
  // Should launch a new navigation controller.
  UIButton *playAgainButton = [UIButton new];
  OCMStub([mockView_ playAgainButton]).andReturn(playAgainButton);

  OCMExpect([mockViewController_ setGameOverStateText:[OCMArg any]]);
  [presenter_ viewLoaded];

  BOOL (^verifyNavController)(id) = ^BOOL(id obj) {
      UINavigationController *navController = (UINavigationController *)obj;
      UIViewController *rootViewController = [[navController viewControllers] firstObject];
      return [rootViewController isKindOfClass:[HomeViewController class]];
  };
  OCMExpect([mockViewController_  presentViewController:[OCMArg checkWithBlock:verifyNavController]
                                               animated:YES
                                             completion:nil]);

  [playAgainButton sendActionsForControlEvents:UIControlEventTouchUpInside];
}

@end
