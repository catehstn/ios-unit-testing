#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "GamePresenter.h"
#import "GameView.h"
#import "GameViewController.h"
#import "TicTacToeBoard.h"
#import "TicTacToeButton.h"

@interface GameViewControllerTest : XCTestCase {
  id mockPresenter_;
  GameViewController *viewController_;
}
- (void)setExpectationsForLoadingView;
@end

@implementation GameViewControllerTest

- (void)setUp {
  [super setUp];

  mockPresenter_ = OCMStrictClassMock([GamePresenter class]);
  OCMExpect([mockPresenter_ setViewController:[OCMArg any]]);
  viewController_ = [[GameViewController alloc] initWithPresenter:mockPresenter_];
}

- (void)tearDown {
  OCMVerifyAll(mockPresenter_);

  [super tearDown];
}

- (void)setExpectationsForLoadingView {
  OCMExpect([mockPresenter_ leftNavigationButtons]);
  OCMExpect([mockPresenter_ rightNavigationButtons]);
  OCMExpect([mockPresenter_ viewLoaded]);
}

- (void)testView {
  [self setExpectationsForLoadingView];
  XCTAssertNotNil([viewController_ gameView]);
}

- (void)testValueForStateO {
  XCTAssertEqualObjects([viewController_ valueForState:TicTacToeStateO], kO);
}

- (void)testValueForStateX {
  XCTAssertEqualObjects([viewController_ valueForState:TicTacToeStateX], kX);
}

- (void)testValueForStateEmpty {
  XCTAssertEqualObjects([viewController_ valueForState:TicTacToeStateEmpty], kEmpty);
}

- (void)testValueForStateInvalid {
  XCTAssertEqualObjects([viewController_ valueForState:TicTacToeStateInvalid], kEmpty);
}

- (void)testUpdateBoardSymmetrical {
  [self setExpectationsForLoadingView];

  TicTacToeBoard *board = [[TicTacToeBoard alloc] init];
  [board playXPos:0 yPos:0 toState:TicTacToeStateO];
  [board playXPos:1 yPos:0 toState:TicTacToeStateX];
  [board playXPos:2 yPos:0 toState:TicTacToeStateO];
  [board playXPos:0 yPos:1 toState:TicTacToeStateX];
  [board playXPos:1 yPos:1 toState:TicTacToeStateO];
  [board playXPos:2 yPos:1 toState:TicTacToeStateX];
  [board playXPos:0 yPos:2 toState:TicTacToeStateO];
  [board playXPos:1 yPos:2 toState:TicTacToeStateX];
  [board playXPos:2 yPos:2 toState:TicTacToeStateO];

  [viewController_ updateDisplayFromBoard:board];
  GameView *gameView = [viewController_ gameView];

  XCTAssertEqualObjects([[gameView buttonAtX:0 y:0] titleForState:UIControlStateNormal], kO);
  XCTAssertEqualObjects([[gameView buttonAtX:1 y:0] titleForState:UIControlStateNormal], kX);
  XCTAssertEqualObjects([[gameView buttonAtX:2 y:0] titleForState:UIControlStateNormal], kO);
  XCTAssertEqualObjects([[gameView buttonAtX:0 y:1] titleForState:UIControlStateNormal], kX);
  XCTAssertEqualObjects([[gameView buttonAtX:1 y:1] titleForState:UIControlStateNormal], kO);
  XCTAssertEqualObjects([[gameView buttonAtX:2 y:1] titleForState:UIControlStateNormal], kX);
  XCTAssertEqualObjects([[gameView buttonAtX:0 y:2] titleForState:UIControlStateNormal], kO);
  XCTAssertEqualObjects([[gameView buttonAtX:1 y:2] titleForState:UIControlStateNormal], kX);
  XCTAssertEqualObjects([[gameView buttonAtX:2 y:2] titleForState:UIControlStateNormal], kO);
}

- (void)testUpdateBoardNotSymmetrical {
  [self setExpectationsForLoadingView];

  TicTacToeBoard *board = [[TicTacToeBoard alloc] init];
  [board playXPos:0 yPos:0 toState:TicTacToeStateO];
  [board playXPos:1 yPos:0 toState:TicTacToeStateO];
  [board playXPos:2 yPos:0 toState:TicTacToeStateO];
  [board playXPos:0 yPos:1 toState:TicTacToeStateX];
  [board playXPos:1 yPos:1 toState:TicTacToeStateO];
  [board playXPos:2 yPos:1 toState:TicTacToeStateO];
  [board playXPos:0 yPos:2 toState:TicTacToeStateX];
  [board playXPos:1 yPos:2 toState:TicTacToeStateX];
  [board playXPos:2 yPos:2 toState:TicTacToeStateX];

  [viewController_ updateDisplayFromBoard:board];
  GameView *gameView = [viewController_ gameView];

  XCTAssertEqualObjects([[gameView buttonAtX:0 y:0] titleForState:UIControlStateNormal], kO);
  XCTAssertEqualObjects([[gameView buttonAtX:1 y:0] titleForState:UIControlStateNormal], kO);
  XCTAssertEqualObjects([[gameView buttonAtX:2 y:0] titleForState:UIControlStateNormal], kO);
  XCTAssertEqualObjects([[gameView buttonAtX:0 y:1] titleForState:UIControlStateNormal], kX);
  XCTAssertEqualObjects([[gameView buttonAtX:1 y:1] titleForState:UIControlStateNormal], kO);
  XCTAssertEqualObjects([[gameView buttonAtX:2 y:1] titleForState:UIControlStateNormal], kO);
  XCTAssertEqualObjects([[gameView buttonAtX:0 y:2] titleForState:UIControlStateNormal], kX);
  XCTAssertEqualObjects([[gameView buttonAtX:1 y:2] titleForState:UIControlStateNormal], kX);
  XCTAssertEqualObjects([[gameView buttonAtX:2 y:2] titleForState:UIControlStateNormal], kX);
}

@end
