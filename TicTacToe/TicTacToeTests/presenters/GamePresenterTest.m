#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "ComputerPlayer.h"
#import "GamePresenter.h"
#import "GameView.h"
#import "GameViewController.h"
#import "TicTacToeBoard.h"

@interface GamePresenterTest : XCTestCase {
  id mockBoard_;
  id mockComputerPlayer_;
  id mockView_;
  id mockViewController_;
  GamePresenter *presenter_;
}
@end

@implementation GamePresenterTest

- (void)setUp {
  [super setUp];

  mockBoard_ = OCMStrictClassMock([TicTacToeBoard class]);
  mockComputerPlayer_ = OCMStrictClassMock([ComputerPlayer class]);
  mockView_ = OCMStrictClassMock([GameView class]);
  mockViewController_ = OCMStrictClassMock([GameViewController class]);
  OCMStub([mockViewController_ gameView]).andReturn(mockView_);

  presenter_ = [[GamePresenter alloc] initWithBoard:mockBoard_
                                     computerPlayer:mockComputerPlayer_
                                           gameType:TicTacToeGameUserO];
  [presenter_ setViewController:mockViewController_];
}

- (void)tearDown {
  OCMVerifyAll(mockBoard_);
  OCMVerifyAll(mockComputerPlayer_);
  OCMVerifyAll(mockView_);
  OCMVerifyAll(mockViewController_);

  [super tearDown];
}

- (void)testCreateViewControllerUserO {
  GameViewController *viewController =
      (GameViewController *) [GamePresenter createViewControllerWithGameType:TicTacToeGameUserO];
  XCTAssertNotNil(viewController);

  GamePresenter *presenter = (GamePresenter *) [viewController presenter];
  XCTAssertNotNil(presenter);

  XCTAssertEqual([presenter gameType], TicTacToeGameUserO);
}

- (void)testCreateViewControllerUserX {
  GameViewController *viewController =
      (GameViewController *) [GamePresenter createViewControllerWithGameType:TicTacToeGameUserX];
  XCTAssertNotNil(viewController);

  GamePresenter *presenter = (GamePresenter *) [viewController presenter];
  XCTAssertNotNil(presenter);

  XCTAssertEqual([presenter gameType], TicTacToeGameUserX);
}

- (void)testCreateViewControllerUserXO {
  GameViewController *viewController =
      (GameViewController *) [GamePresenter createViewControllerWithGameType:TicTacToeGameUserXO];
  XCTAssertNotNil(viewController);

  GamePresenter *presenter = (GamePresenter *) [viewController presenter];
  XCTAssertNotNil(presenter);

  XCTAssertEqual([presenter gameType], TicTacToeGameUserXO);
}

@end
