#import "TicTacToeButton.h"

@interface TicTacToeButton () {
  NSInteger x_;
  NSInteger y_;
}
@end

@implementation TicTacToeButton

@synthesize x = x_;
@synthesize y = y_;

- (id)initWithX:(NSInteger)x y:(NSInteger)y {
  self = [super init];
  if (self) {
    x_ = x;
    y_ = y;
  }
  return self;
}

@end
