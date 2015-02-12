#import "CHPresenter.h"

@interface CHPresenter () {
  __unsafe_unretained CHViewController *viewController_;
}

@end

@implementation CHPresenter

@synthesize viewController = viewController_;

- (void)viewLoaded {
  // By default, do nothing.
}

- (void)viewWillDisappear {
  // By default, do nothing.
}

- (NSArray *)leftNavigationButtons {
  return @[];
}

- (NSArray *)rightNavigationButtons {
  return @[];
}

@end
