#import "EndGameViewController.h"

#import "EndGameView.h"

@interface EndGameViewController ()

@end

@implementation EndGameViewController

- (void)loadView {
  [self setView:[EndGameView new]];
}

- (EndGameView *)endGameView {
  return (EndGameView *)[self view];
}

- (void)setGameOverStateText:(NSString *)text {
  [[[self endGameView] gameStateLabel] setText:text];
}

@end
