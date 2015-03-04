#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "ComputerPlayer.h"
#import "GamePresenter.h"
#import "GameView.h"
#import "GameViewController.h"
#import "TicTacToeBoard.h"
#import "TicTacToeButton.h"

@interface GamePresenterTest : XCTestCase {
  id mockBoard_;
  id mockComputerPlayer_;
  id mockView_;
  id mockViewController_;
  GamePresenter *presenter_;
}
// Sets expectations that the view will return these buttons, and a target will be added to each.
- (void)setUpExpectationsForButtons:(NSArray *)buttons;
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

- (void)setUpExpectationsForButtons:(NSArray *)buttons {
  OCMStub([mockView_ buttons]).andReturn(buttons);

  for (id mockButton in buttons) {
    OCMExpect([mockButton addTarget:presenter_
                             action:[OCMArg anySelector]
                   forControlEvents:UIControlEventTouchUpInside]);
  }
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

- (void)testViewLoadedComputerNotPlaying {
  presenter_ = [[GamePresenter alloc] initWithBoard:mockBoard_
                                     computerPlayer:mockComputerPlayer_
                                           gameType:TicTacToeGameUserXO];
  [presenter_ setViewController:mockViewController_];

  id mockButton1 = OCMStrictClassMock([UIButton class]);
  id mockButton2 = OCMStrictClassMock([UIButton class]);
  id mockButton3 = OCMStrictClassMock([UIButton class]);
  NSArray *buttons = @[mockButton1, mockButton2, mockButton3];
  [self setUpExpectationsForButtons:buttons];

  [presenter_ viewLoaded];

  OCMVerifyAll(mockButton1);
  OCMVerifyAll(mockButton2);
  OCMVerifyAll(mockButton3);
}

- (void)testViewLoadedComputerNotFirst {
  // TODO: Fill this in.
}

- (void)testViewLoadedComputerGoesFirst {
  // Create the expectation.
  XCTestExpectation *expectation =
      [self expectationWithDescription:@"testViewLoadedComputerGoesFirst"];

  // Create the presenter to test.
  presenter_ = [[GamePresenter alloc] initWithBoard:mockBoard_
                                     computerPlayer:mockComputerPlayer_
                                           gameType:TicTacToeGameUserX];
  [presenter_ setViewController:mockViewController_];

  // Mock and stub some buttons.
  id mockButton1 = OCMStrictClassMock([UIButton class]);
  id mockButton2 = OCMStrictClassMock([UIButton class]);
  id mockButton3 = OCMStrictClassMock([UIButton class]);
  NSArray *buttons = @[mockButton1, mockButton2, mockButton3];
  [self setUpExpectationsForButtons:buttons];

  // Computer should play.
  OCMStub([mockBoard_ gameState]).andReturn(TicTacToeGameStateNotEnded);
  OCMExpect([mockComputerPlayer_ makeNextMove]);
  // Last thing that should happen after the computer plays, so fulfill expectation.
  OCMExpect([mockViewController_ updateDisplayFromBoard:mockBoard_])
      .andDo(^(NSInvocation *invocation){
          [expectation fulfill];
      });

  [presenter_ viewLoaded];

  // Wait for expecations.
  [self waitForExpectationsWithTimeout:2 handler:nil];

  // Verify the buttons.
  OCMVerifyAll(mockButton1);
  OCMVerifyAll(mockButton2);
  OCMVerifyAll(mockButton3);
}

- (void)testButtonPressedComputerPlaying {
  TicTacToeButton *button = [[TicTacToeButton alloc] initWithX:1 y:2];
  NSArray *buttons = @[button];

  OCMExpect([mockView_ buttons]).andReturn(buttons);

  [presenter_ viewLoaded];

  [presenter_ setComputerInPlay:YES];
  [button sendActionsForControlEvents:UIControlEventTouchUpInside];
}

- (void)testButtonPressedSquareSetAlready {
  // TODO: Fill this in.
}

- (void)testButtonPressedThenGameOver {
  // TODO: Fill this in.
}

- (void)testButtonPressedUserThenUser {
  presenter_ = [[GamePresenter alloc] initWithBoard:mockBoard_
                                     computerPlayer:mockComputerPlayer_
                                           gameType:TicTacToeGameUserXO];
  [presenter_ setViewController:mockViewController_];

  TicTacToeButton *button1 = [[TicTacToeButton alloc] initWithX:1 y:2];
  TicTacToeButton *button2 = [[TicTacToeButton alloc] initWithX:2 y:0];
  NSArray *buttons = @[button1, button2];

  OCMExpect([mockView_ buttons]).andReturn(buttons);

  [presenter_ viewLoaded];

  OCMExpect([mockBoard_ playXPos:1 yPos:2 toState:TicTacToeStateO]).andReturn(YES);
  OCMExpect([mockViewController_ updateDisplayFromBoard:mockBoard_]);
  OCMExpect([mockBoard_ gameState]).andReturn(TicTacToeGameStateNotEnded);

  [button1 sendActionsForControlEvents:UIControlEventTouchUpInside];

  OCMExpect([mockBoard_ playXPos:2 yPos:0 toState:TicTacToeStateX]).andReturn(YES);
  OCMExpect([mockViewController_ updateDisplayFromBoard:mockBoard_]);
  OCMExpect([mockBoard_ gameState]).andReturn(TicTacToeGameStateNotEnded);

  [button2 sendActionsForControlEvents:UIControlEventTouchUpInside];
}

- (void)testButtonPressedUserThenComputer {
  // TODO: Fill this in.
}

@end
