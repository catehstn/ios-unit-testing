#import "GameViewController.h"

#import "GameView.h"
#import "TicTacToeBoard.h"

@interface GameViewController ()
- (NSString *)valueForState:(TicTacToeStateType)state;
@end

@implementation GameViewController

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
      return @"O";
    case TicTacToeStateX:
      return @"X";
    default:
      return @"";
  }
}

@end
