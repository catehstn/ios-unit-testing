#import "GameViewController.h"

#import "GameView.h"

@implementation GameViewController

- (void)loadView {
  [self setView:[GameView new]];
}

- (GameView *)gameView {
  return (GameView *) [self view];
}

@end
