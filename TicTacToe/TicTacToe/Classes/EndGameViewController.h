#import "CHViewController.h"

@class EndGameView;

@interface EndGameViewController : CHViewController

@property(nonatomic, readonly) EndGameView *endGameView;

- (void)setGameOverStateText:(NSString *)text;

@end
