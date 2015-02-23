#import "EndGameViewController.h"

#import "EndGameView.h"

@interface EndGameViewController ()

@end

@implementation EndGameViewController

- (void)loadView {
  [self setView:[EndGameView new]];
}

@end
