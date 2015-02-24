#import <UIKit/UIKit.h>

#import "GameStates.h"

@class TicTacToeButton;

@interface GameView : UIView

@property(nonatomic, readonly) NSArray *buttons;

- (void)updateValue:(NSString *)value atX :(int)x y:(int)y;

// Visible for unit testing.
- (TicTacToeButton *)buttonAtX:(int)x y:(int)y;

@end
