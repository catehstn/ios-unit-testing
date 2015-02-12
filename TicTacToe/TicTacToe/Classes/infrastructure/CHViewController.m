#import "CHViewController.h"

#import "CHPresenter.h"

@interface CHViewController()  {
  CHPresenter *presenter_;
}
@end

@implementation CHViewController

@synthesize presenter = presenter_;

- (id)initWithPresenter:(CHPresenter *)presenter {
  self = [super init];
  if (self) {
    presenter_ = presenter;
    [presenter setViewController:self];
  }
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];

  [[self navigationItem] setLeftBarButtonItems:[[self presenter] leftNavigationButtons]
                                      animated:YES];
  [[self navigationItem] setRightBarButtonItems:[[self presenter] rightNavigationButtons]
                                       animated:YES];
  [[self presenter] viewLoaded];
}

- (void)viewWillDisappear:(BOOL)animated {
  [[self presenter] viewWillDisappear];
  [super viewWillDisappear:animated];
}

- (void)dismissViewControllerAnimated:(BOOL)animated
                  withCompletionBlock:(void (^)(void))completionBlock {
  [[self navigationController] dismissViewControllerAnimated:animated
                                                  completion:completionBlock];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
  [[self navigationController] pushViewController:viewController animated:animated];
}

@end
