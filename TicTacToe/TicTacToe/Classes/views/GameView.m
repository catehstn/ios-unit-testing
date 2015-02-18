#import "GameView.h"

#import "TicTacToeButton.h"

@interface GameView () {
  UIButton *buttonA_;
  UIButton *buttonB_;
  UIButton *buttonC_;
  UIButton *buttonD_;
  UIButton *buttonE_;
  UIButton *buttonF_;
  UIButton *buttonG_;
  UIButton *buttonH_;
  UIButton *buttonI_;
}

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

  buttonA_ = [self createAndAddButtonAtX:0 y:0];
  buttonB_ = [self createAndAddButtonAtX:1 y:0];
  buttonC_ = [self createAndAddButtonAtX:2 y:0];
  buttonD_ = [self createAndAddButtonAtX:0 y:1];
  buttonE_ = [self createAndAddButtonAtX:1 y:1];
  buttonF_ = [self createAndAddButtonAtX:2 y:1];
  buttonG_ = [self createAndAddButtonAtX:0 y:2];
  buttonH_ = [self createAndAddButtonAtX:1 y:2];
  buttonI_ = [self createAndAddButtonAtX:2 y:2];
}

- (void)setUpConstraints {
  NSDictionary *views = @{
    @"a": buttonA_,
    @"b": buttonB_,
    @"c": buttonC_
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
      @"d": buttonD_,
      @"e": buttonE_,
      @"f": buttonF_
  };
  format = @"|-(padding)-[d]-(padding)-[e(==d)]-(padding)-[f(==d)]-(padding)-|";
  [hConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:format
                                                                            options:option
                                                                            metrics:metrics
                                                                              views:views]];
  views = @{
      @"g": buttonG_,
      @"h": buttonH_,
      @"i": buttonI_
  };
  format = @"|-(padding)-[g]-(padding)-[h(==g)]-(padding)-[i(==g)]-(padding)-|";
  [hConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:format
                                                                            options:option
                                                                            metrics:metrics
                                                                              views:views]];
  [NSLayoutConstraint activateConstraints:hConstraints];


  views = @{
      @"a": buttonA_,
      @"d": buttonD_,
      @"g": buttonG_
  };
  format = @"V:[a]-(padding)-[d(==a)]-(padding)-[g(==a)]";
  option = NSLayoutFormatAlignAllLeft | NSLayoutFormatAlignAllRight;
  NSArray *vConstraints = [NSLayoutConstraint constraintsWithVisualFormat:format
                                                                  options:option
                                                                  metrics:metrics
                                                                    views:views];
  [NSLayoutConstraint activateConstraints:vConstraints];

  [[NSLayoutConstraint constraintWithItem:buttonA_
                                attribute:NSLayoutAttributeHeight
                                relatedBy:NSLayoutRelationEqual
                                   toItem:buttonA_
                                attribute:NSLayoutAttributeWidth
                               multiplier:1
                                 constant:0] setActive:YES];

  [[NSLayoutConstraint constraintWithItem:buttonE_
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

@end
