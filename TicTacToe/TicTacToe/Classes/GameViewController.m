#import "GameViewController.h"

#import "GameView.h"

@implementation GameViewController

- (void)loadView {
  [self setView:[GameView new]];
}

@end
