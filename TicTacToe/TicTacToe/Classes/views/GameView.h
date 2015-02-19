#import <UIKit/UIKit.h>

// TODO(cate): Move enums into separate file.
#import "TicTacToeBoard.h"

@interface GameView : UIView

@property(nonatomic, readonly) NSArray *buttons;

- (void)updateValue:(NSString *)value atX :(int)x y:(int)y;

@end
