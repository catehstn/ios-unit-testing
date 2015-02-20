#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "CHPresenter.h"
#import "CHViewController.h"

@interface CHViewControllerTest : XCTestCase {
  id mockPresenter_;
  id mockNavigationController_;
  id mockViewController_;
  CHViewController *viewController_;
}
@end

@implementation CHViewControllerTest

- (void)setUp {
  [super setUp];

  mockNavigationController_ = OCMStrictClassMock([UINavigationController class]);
  mockPresenter_ = OCMStrictClassMock([CHPresenter class]);
  OCMExpect([mockPresenter_ setViewController:OCMOCK_ANY]);
  viewController_ = [[CHViewController alloc] initWithPresenter:mockPresenter_];
  mockViewController_ = OCMPartialMock(viewController_);
}

- (void)tearDown {
  OCMVerifyAll(mockPresenter_);
  OCMVerifyAll(mockNavigationController_);
  OCMVerifyAll(mockViewController_);
  [super tearDown];
}

- (void)testInit {
  OCMVerify([mockPresenter_ setViewController:viewController_]);
}

- (void)testViewDidLoad {
  OCMExpect([mockPresenter_ leftNavigationButtons]);
  OCMExpect([mockPresenter_ rightNavigationButtons]);
  OCMExpect([mockPresenter_ viewLoaded]);

  [viewController_ viewDidLoad];
}

- (void)testViewWillDisappear {
  OCMExpect([mockPresenter_ viewWillDisappear]);
  [viewController_ viewWillDisappear:YES];
}

- (void)testDismissViewController {
  [[[mockViewController_ expect] andReturn:mockNavigationController_] navigationController];

  OCMExpect([mockNavigationController_ dismissViewControllerAnimated:NO completion:nil]);
  [viewController_ dismissViewControllerAnimated:NO withCompletionBlock:nil];
}

- (void)testDismissViewControllerAnimated {
  [[[mockViewController_ expect] andReturn:mockNavigationController_] navigationController];

  OCMExpect([mockNavigationController_ dismissViewControllerAnimated:YES completion:nil]);
  [viewController_ dismissViewControllerAnimated:YES withCompletionBlock:nil];
}

- (void)testPushViewController {
  [[[mockViewController_ expect] andReturn:mockNavigationController_] navigationController];

  OCMExpect([mockNavigationController_ pushViewController:[OCMArg any] animated:NO]);
  [viewController_ pushViewController:[UIViewController new] animated:NO];
}

- (void)testPushViewControllerAnimated {
  [[[mockViewController_ expect] andReturn:mockNavigationController_] navigationController];

  OCMExpect([mockNavigationController_ pushViewController:[OCMArg any] animated:YES]);
  [viewController_ pushViewController:[UIViewController new] animated:YES];
}

@end
