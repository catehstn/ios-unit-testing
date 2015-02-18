#import "GamePresenter.h"

#import "GameViewController.h"

@interface GamePresenter ()
@property(nonatomic, readonly) GameViewController *gameViewController;
@end

@implementation GamePresenter

+ (GameViewController *)createViewController {
  // TODO(cate): Add options.
  return [[GameViewController alloc] initWithPresenter:[GamePresenter new]];
}

- (GameViewController *)gameViewController {
  return (GameViewController *) [self viewController];
}

@end
