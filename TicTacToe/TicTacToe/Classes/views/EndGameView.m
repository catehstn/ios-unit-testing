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
  [gameStateLabel_ setTranslatesAutoresizingMaskIntoConstraints:NO];
  [self addSubview:gameStateLabel_];

  playAgainButton_ = [UIButton new];
  [playAgainButton_ setTitle:@"play again" forState:UIControlStateNormal];
  [playAgainButton_ setTranslatesAutoresizingMaskIntoConstraints:NO];
  [self addSubview:playAgainButton_];
}

- (void)setUpConstraints {
  [[NSLayoutConstraint constraintWithItem:gameStateLabel_
                                attribute:NSLayoutAttributeCenterX
                                relatedBy:NSLayoutRelationEqual
                                   toItem:self
                                attribute:NSLayoutAttributeCenterX
                               multiplier:1
                                 constant:0] setActive:YES];
  [[NSLayoutConstraint constraintWithItem:gameStateLabel_
                                attribute:NSLayoutAttributeWidth
                                relatedBy:NSLayoutRelationLessThanOrEqual
                                   toItem:self
                                attribute:NSLayoutAttributeWidth
                               multiplier:1
                                 constant:-(2 * kLabelPadding)] setActive:YES];
  [[NSLayoutConstraint constraintWithItem:gameStateLabel_
                                attribute:NSLayoutAttributeCenterY
                                relatedBy:NSLayoutRelationEqual
                                   toItem:self
                                attribute:NSLayoutAttributeCenterY
                               multiplier:0.5
                                 constant:0] setActive:YES];
  [[NSLayoutConstraint constraintWithItem:gameStateLabel_
                                attribute:NSLayoutAttributeHeight
                                relatedBy:NSLayoutRelationLessThanOrEqual
                                   toItem:self
                                attribute:NSLayoutAttributeHeight
                               multiplier:0.3
                                 constant:0] setActive:YES];

  [[NSLayoutConstraint constraintWithItem:playAgainButton_
                               attribute:NSLayoutAttributeBottom
                               relatedBy:NSLayoutRelationEqual
                                  toItem:self
                               attribute:NSLayoutAttributeBottom
                              multiplier:1
                                 constant:-kPadding] setActive:YES];
  [[NSLayoutConstraint constraintWithItem:playAgainButton_
                                attribute:NSLayoutAttributeWidth
                                relatedBy:NSLayoutRelationEqual
                                   toItem:self
                                attribute:NSLayoutAttributeWidth
                               multiplier:1
                                 constant:(2 * -kPadding)] setActive:YES];
  [[NSLayoutConstraint constraintWithItem:playAgainButton_
                                attribute:NSLayoutAttributeCenterX
                                relatedBy:NSLayoutRelationEqual
                                   toItem:self
                                attribute:NSLayoutAttributeCenterX
                               multiplier:1
                                 constant:0] setActive:YES];
  [[NSLayoutConstraint constraintWithItem:playAgainButton_
                                attribute:NSLayoutAttributeHeight
                                relatedBy:NSLayoutRelationLessThanOrEqual
                                   toItem:nil
                                attribute:NSLayoutAttributeNotAnAttribute
                               multiplier:1
                                 constant:kMaxButtonHeight] setActive:YES];
}

@end
