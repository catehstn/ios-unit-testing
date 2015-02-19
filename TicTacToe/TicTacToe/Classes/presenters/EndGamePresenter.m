#import "EndGamePresenter.h"

#import "EndGameViewController.h"

@implementation EndGamePresenter

+ (EndGameViewController *)createViewController {
  return [[EndGameViewController alloc] initWithPresenter:[EndGamePresenter new]];
}

@end
