#import "EndGameView.h"

@interface EndGameView () {
  UILabel *gameStateLabel_;
  UIButton *playAgainButton_;
}

- (void)createView;
- (void)setUpConstraints;

@end

@implementation EndGameView

static const CGFloat kLabelPadding = 25.0;
static const CGFloat kPadding = 5.0;
static const CGFloat kMaxButtonHeight = 40;

@synthesize gameStateLabel = gameStateLabel_;
@synthesize playAgainButton = playAgainButton_;

- (id)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    [self createView];
    [self setUpConstraints];
  }
  return self;
}

- (void)createView {
  [self setBackgroundColor:[UIColor grayColor]];

  gameStateLabel_ = [UILabel new];
  [[self gameStateLabel] setTranslatesAutoresizingMaskIntoConstraints:NO];
  [[self gameStateLabel] setTextAlignment:NSTextAlignmentCenter];
  [[self gameStateLabel] setFont:[UIFont systemFontOfSize:18]];
  [[self gameStateLabel] setTextColor:[UIColor whiteColor]];
  [self addSubview:[self gameStateLabel]];

  playAgainButton_ = [UIButton new];
  [[self playAgainButton] setTitle:@"play again" forState:UIControlStateNormal];
  [[self playAgainButton] setTranslatesAutoresizingMaskIntoConstraints:NO];
  [self addSubview:[self playAgainButton]];
}

- (void)setUpConstraints {
  [[NSLayoutConstraint constraintWithItem:[self gameStateLabel]
                                attribute:NSLayoutAttributeCenterX
                                relatedBy:NSLayoutRelationEqual
                                   toItem:self
                                attribute:NSLayoutAttributeCenterX
                               multiplier:1
                                 constant:0] setActive:YES];
  [[NSLayoutConstraint constraintWithItem:[self gameStateLabel]
                                attribute:NSLayoutAttributeWidth
                                relatedBy:NSLayoutRelationEqual
                                   toItem:self
                                attribute:NSLayoutAttributeWidth
                               multiplier:1
                                 constant:-(2 * kLabelPadding)] setActive:YES];
  [[NSLayoutConstraint constraintWithItem:[self gameStateLabel]
                                attribute:NSLayoutAttributeCenterY
                                relatedBy:NSLayoutRelationEqual
                                   toItem:self
                                attribute:NSLayoutAttributeCenterY
                               multiplier:0.5
                                 constant:0] setActive:YES];
  [[NSLayoutConstraint constraintWithItem:[self gameStateLabel]
                                attribute:NSLayoutAttributeHeight
                                relatedBy:NSLayoutRelationEqual
                                   toItem:self
                                attribute:NSLayoutAttributeHeight
                               multiplier:0.3
                                 constant:0] setActive:YES];

  [[NSLayoutConstraint constraintWithItem:[self playAgainButton]
                               attribute:NSLayoutAttributeBottom
                               relatedBy:NSLayoutRelationEqual
                                  toItem:self
                               attribute:NSLayoutAttributeBottom
                              multiplier:1
                                 constant:-kPadding] setActive:YES];
  [[NSLayoutConstraint constraintWithItem:[self playAgainButton]
                                attribute:NSLayoutAttributeWidth
                                relatedBy:NSLayoutRelationEqual
                                   toItem:self
                                attribute:NSLayoutAttributeWidth
                               multiplier:1
                                 constant:(2 * -kPadding)] setActive:YES];
  [[NSLayoutConstraint constraintWithItem:[self playAgainButton]
                                attribute:NSLayoutAttributeCenterX
                                relatedBy:NSLayoutRelationEqual
                                   toItem:self
                                attribute:NSLayoutAttributeCenterX
                               multiplier:1
                                 constant:0] setActive:YES];
  [[NSLayoutConstraint constraintWithItem:[self playAgainButton]
                                attribute:NSLayoutAttributeHeight
                                relatedBy:NSLayoutRelationLessThanOrEqual
                                   toItem:nil
                                attribute:NSLayoutAttributeNotAnAttribute
                               multiplier:1
                                 constant:kMaxButtonHeight] setActive:YES];
}

@end
