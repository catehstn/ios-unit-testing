#import "GameView.h"

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

- (UIButton *)createAndAddButton;
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
  buttonA_ = [self createAndAddButton];
  buttonB_ = [self createAndAddButton];
  buttonC_ = [self createAndAddButton];
  buttonD_ = [self createAndAddButton];
  buttonE_ = [self createAndAddButton];
  buttonF_ = [self createAndAddButton];
  buttonG_ = [self createAndAddButton];
  buttonH_ = [self createAndAddButton];
  buttonI_ = [self createAndAddButton];
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
  format = @"V:|-(padding)-[a]-(padding)-[d(==a)]-(padding)-[g(==a)]-(padding)-|";
  option = NSLayoutFormatAlignAllLeft | NSLayoutFormatAlignAllRight;
  NSArray *vConstraints = [NSLayoutConstraint constraintsWithVisualFormat:format
                                                                  options:option
                                                                  metrics:metrics
                                                                    views:views];
  [NSLayoutConstraint activateConstraints:vConstraints];
}

- (UIButton *)createAndAddButton {
  UIButton *button = [UIButton new];
  [button setBackgroundColor:[UIColor lightGrayColor]];
  [self addSubview:button];
  return button;
}

@end
