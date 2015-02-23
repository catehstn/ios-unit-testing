#import "GameViewController.h"

#import "GameView.h"

@interface GameViewController ()
@end

@implementation GameViewController

NSString *const kO = @"O";
NSString *const kX = @"X";
NSString *const kEmpty = @"";

- (void)loadView {
  [self setView:[GameView new]];
}

- (GameView *)gameView {
  return (GameView *) [self view];
}

- (void)updateDisplayFromBoard:(TicTacToeBoard *)board {
  for (int x = 0; x < 3; x++) {
    for (int y = 0; y < 3; y++) {
      NSString *value = [self valueForState:[board stateForXPos:x yPos:y]];
      [[self gameView] updateValue:value atX:x y:y];
    }
  }
}

- (NSString *)valueForState:(TicTacToeStateType)state {
  switch (state) {
    case TicTacToeStateO:
      return kO;
    case TicTacToeStateX:
      return kX;
    default:
      return kEmpty;
  }
}

@end
