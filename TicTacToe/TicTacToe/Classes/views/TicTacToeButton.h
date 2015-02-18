#import <UIKit/UIKit.h>

@interface TicTacToeButton : UIButton

@property(nonatomic, readonly) NSInteger x;
@property(nonatomic, readonly) NSInteger y;

- (id)initWithX:(NSInteger)x y:(NSInteger)y;

@end
