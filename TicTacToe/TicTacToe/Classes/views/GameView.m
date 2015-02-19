#import "GameView.h"

#import "TicTacToeButton.h"

@interface GameView () {
  NSArray *buttons_;
}

- (TicTacToeButton *)buttonAtX:(int)x y:(int)y;
- (TicTacToeButton *)createAndAddButtonAtX:(NSInteger)x y:(NSInteger)y;
- (void)createView;
- (void)setUpConstraints;
@end

@implementation GameView

static const CGFloat kPadding = 5.0;

- (id)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    [self createView];
    [self setUpConstraints];
  }
  return self;
}

- (void)createView {
  [self setBackgroundColor:[UIColor blackColor]];

  buttons_ = [@[[NSMutableArray arrayWithCapacity:3],
                [NSMutableArray arrayWithCapacity:3],
                [NSMutableArray arrayWithCapacity:3]] mutableCopy];

  buttons_[0][0] = [self createAndAddButtonAtX:0 y:0];
  buttons_[0][1] = [self createAndAddButtonAtX:1 y:0];
  buttons_[0][2] = [self createAndAddButtonAtX:2 y:0];
  buttons_[1][0] = [self createAndAddButtonAtX:0 y:1];
  buttons_[1][1] = [self createAndAddButtonAtX:1 y:1];
  buttons_[1][2] = [self createAndAddButtonAtX:2 y:1];
  buttons_[2][0] = [self createAndAddButtonAtX:0 y:2];
  buttons_[2][1] = [self createAndAddButtonAtX:1 y:2];
  buttons_[2][2] = [self createAndAddButtonAtX:2 y:2];
}

- (void)setUpConstraints {
  NSDictionary *views = @{
    @"a": [self buttonAtX:0 y:0],
    @"b": [self buttonAtX:1 y:0],
    @"c": [self buttonAtX:2 y:0]
  };

  NSString *format = @"|-(padding)-[a]-(padding)-[b(==a)]-(padding)-[c(==a)]-(padding)-|";
  NSLayoutFormatOptions option = NSLayoutFormatAlignAllBottom | NSLayoutFormatAlignAllTop;
  NSDictionary *metrics = @{@"padding": @(kPadding)};
  NSMutableArray *hConstraints =
      [[NSLayoutConstraint constraintsWithVisualFormat:format
                                               options:option
                                               metrics:metrics
                                                 views:views] mutableCopy];

  views = @{
      @"d": [self buttonAtX:0 y:1],
      @"e": [self buttonAtX:1 y:1],
      @"f": [self buttonAtX:2 y:1]
  };
  format = @"|-(padding)-[d]-(padding)-[e(==d)]-(padding)-[f(==d)]-(padding)-|";
  [hConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:format
                                                                            options:option
                                                                            metrics:metrics
                                                                              views:views]];
  views = @{
      @"g": [self buttonAtX:0 y:2],
      @"h": [self buttonAtX:1 y:2],
      @"i": [self buttonAtX:2 y:2]
  };
  format = @"|-(padding)-[g]-(padding)-[h(==g)]-(padding)-[i(==g)]-(padding)-|";
  [hConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:format
                                                                            options:option
                                                                            metrics:metrics
                                                                              views:views]];
  [NSLayoutConstraint activateConstraints:hConstraints];


  views = @{
      @"a": [self buttonAtX:0 y:0],
      @"d": [self buttonAtX:0 y:1],
      @"g": [self buttonAtX:0 y:2]
  };
  format = @"V:[a]-(padding)-[d(==a)]-(padding)-[g(==a)]";
  option = NSLayoutFormatAlignAllLeft | NSLayoutFormatAlignAllRight;
  NSArray *vConstraints = [NSLayoutConstraint constraintsWithVisualFormat:format
                                                                  options:option
                                                                  metrics:metrics
                                                                    views:views];
  [NSLayoutConstraint activateConstraints:vConstraints];

  [[NSLayoutConstraint constraintWithItem:[self buttonAtX:0 y:0]
                                attribute:NSLayoutAttributeHeight
                                relatedBy:NSLayoutRelationEqual
                                   toItem:[self buttonAtX:0 y:0]
                                attribute:NSLayoutAttributeWidth
                               multiplier:1
                                 constant:0] setActive:YES];

  [[NSLayoutConstraint constraintWithItem:[self buttonAtX:1 y:1]
                                attribute:NSLayoutAttributeCenterY
                                relatedBy:NSLayoutRelationEqual
                                   toItem:self
                                attribute:NSLayoutAttributeCenterY
                               multiplier:1
                                 constant:0] setActive:YES];
}

- (TicTacToeButton *)createAndAddButtonAtX:(NSInteger)x y:(NSInteger)y {
  TicTacToeButton *button = [[TicTacToeButton alloc] initWithX:x y:y];
  [button setTranslatesAutoresizingMaskIntoConstraints:NO];
  [button setBackgroundColor:[UIColor lightGrayColor]];
  [self addSubview:button];
  return button;
}

#pragma mark getters

- (TicTacToeButton *)buttonAtX:(int)x y:(int)y {
  return buttons_[y][x];
}

- (NSArray *)buttons {
  return @[[self buttonAtX:0 y:0], [self buttonAtX:1 y:0], [self buttonAtX:2 y:0],
           [self buttonAtX:0 y:1], [self buttonAtX:1 y:1], [self buttonAtX:2 y:1],
           [self buttonAtX:0 y:2], [self buttonAtX:1 y:2], [self buttonAtX:2 y:2]];
}

@end
