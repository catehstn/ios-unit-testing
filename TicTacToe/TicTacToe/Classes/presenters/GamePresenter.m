#import "GamePresenter.h"

#import "GameViewController.h"

@implementation GamePresenter

+ (GameViewController *)createViewController {
  // TODO(cate): Add options.
  return [[GameViewController alloc] initWithPresenter:[GamePresenter new]];
}

@end
