#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "GamePresenter.h"
#import "GameViewController.h"
#import "HomePresenter.h"
#import "HomeView.h"
#import "HomeViewController.h"

@interface HomePresenterTest : XCTestCase {
  id mockView_;
  id mockViewController_;
  HomePresenter *presenter_;
}

@end

@implementation HomePresenterTest

- (void)setUp {
  [super setUp];

  mockView_ = OCMStrictClassMock([HomeView class]);
  mockViewController_ = OCMStrictClassMock([HomeViewController class]);
  OCMStub([mockViewController_ homeView]).andReturn(mockView_);

  presenter_ = [HomePresenter new];
  [presenter_ setViewController:mockViewController_];
}

- (void)tearDown {
  OCMVerifyAll(mockView_);
  OCMVerifyAll(mockViewController_);

  [super tearDown];
}

- (void)testCreateViewController {
  HomeViewController *viewController = (HomeViewController *) [HomePresenter createViewController];
  XCTAssertNotNil(viewController);

  HomePresenter *presenter = (HomePresenter *) [viewController presenter];
  XCTAssertNotNil(presenter);
}

- (void)testAddTargetsToButtons {
  id mockOButton = OCMStrictClassMock([UIButton class]);
  id mockXButton = OCMStrictClassMock([UIButton class]);
  id mockXOButton = OCMStrictClassMock([UIButton class]);

  OCMStub([mockView_ playOButton]).andReturn(mockOButton);
  OCMStub([mockView_ playXButton]).andReturn(mockXButton);
  OCMStub([mockView_ playXOButton]).andReturn(mockXOButton);

  OCMExpect([mockOButton addTarget:presenter_
                            action:[OCMArg anySelector]
                  forControlEvents:UIControlEventTouchUpInside]);
  OCMExpect([mockXButton addTarget:presenter_
                            action:[OCMArg anySelector]
                  forControlEvents:UIControlEventTouchUpInside]);
  OCMExpect([mockXOButton addTarget:presenter_
                             action:[OCMArg anySelector]
                   forControlEvents:UIControlEventTouchUpInside]);

  [presenter_ viewLoaded];

  OCMVerifyAll(mockOButton);
  OCMVerifyAll(mockXButton);
  OCMVerifyAll(mockXOButton);
}

- (void)testOButtonPressed {
  UIButton *oButton = [UIButton new];
  id mockXButton = OCMClassMock([UIButton class]);
  id mockXOButton = OCMClassMock([UIButton class]);

  OCMStub([mockView_ playOButton]).andReturn(oButton);
  OCMStub([mockView_ playXButton]).andReturn(mockXButton);
  OCMStub([mockView_ playXOButton]).andReturn(mockXOButton);

  BOOL (^verifyGameType)(id) = ^BOOL(id obj) {
      GameViewController *gameViewController = (GameViewController *) obj;
      GamePresenter *presenter = (GamePresenter *) [gameViewController presenter];
      XCTAssertEqual([presenter gameType], TicTacToeGameUserO);
  };
  OCMExpect([mockViewController_ pushViewController:[OCMArg checkWithBlock:verifyGameType]
                                           animated:YES]);

  [presenter_ viewLoaded];

  [oButton sendActionsForControlEvents:UIControlEventTouchUpInside];

  OCMVerifyAll(mockXButton);
  OCMVerifyAll(mockXOButton);
}

- (void)testXButtonPressed {
  UIButton *xButton = [UIButton new];
  id mockOButton = OCMClassMock([UIButton class]);
  id mockXOButton = OCMClassMock([UIButton class]);

  OCMStub([mockView_ playOButton]).andReturn(mockOButton);
  OCMStub([mockView_ playXButton]).andReturn(xButton);
  OCMStub([mockView_ playXOButton]).andReturn(mockXOButton);

  BOOL (^verifyGameType)(id) = ^BOOL(id obj) {
    GameViewController *gameViewController = (GameViewController *) obj;
    GamePresenter *presenter = (GamePresenter *) [gameViewController presenter];
    XCTAssertEqual([presenter gameType], TicTacToeGameUserX);
  };
  OCMExpect([mockViewController_ pushViewController:[OCMArg checkWithBlock:verifyGameType]
                                           animated:YES]);

  [presenter_ viewLoaded];

  [xButton sendActionsForControlEvents:UIControlEventTouchUpInside];

  OCMVerifyAll(mockOButton);
  OCMVerifyAll(mockXOButton);
}

- (void)testXOButtonPressed {
  UIButton *xoButton = [UIButton new];
  id mockOButton = OCMClassMock([UIButton class]);
  id mockXButton = OCMClassMock([UIButton class]);

  OCMStub([mockView_ playOButton]).andReturn(mockOButton);
  OCMStub([mockView_ playXButton]).andReturn(mockXButton);
  OCMStub([mockView_ playXOButton]).andReturn(xoButton);

  BOOL (^verifyGameType)(id) = ^BOOL(id obj) {
    GameViewController *gameViewController = (GameViewController *) obj;
    GamePresenter *presenter = (GamePresenter *) [gameViewController presenter];
    XCTAssertEqual([presenter gameType], TicTacToeGameUserXO);
  };
  OCMExpect([mockViewController_ pushViewController:[OCMArg checkWithBlock:verifyGameType]
                                           animated:YES]);

  [presenter_ viewLoaded];

  [xoButton sendActionsForControlEvents:UIControlEventTouchUpInside];

  OCMVerifyAll(mockOButton);
  OCMVerifyAll(mockXButton);
}

@end
