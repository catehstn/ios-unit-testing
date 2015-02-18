#import "HomeView.h"

@interface HomeView () {
  UIButton *playXOButton_;
  UIButton *playXButton_;
  UIButton *playOButton_;
}

- (void)createView;
- (void)setUpConstraints;

@end

@implementation HomeView

@synthesize playOButton = playOButton_;
@synthesize playXButton = playXButton_;
@synthesize playXOButton = playXOButton_;

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
  [self setBackgroundColor:[UIColor whiteColor]];

  playXOButton_ = [UIButton new];
  [[self playXOButton] setTitle:@"XO" forState:UIControlStateNormal];
  [[self playXOButton] setTranslatesAutoresizingMaskIntoConstraints:NO];
  [[self playXOButton] setBackgroundColor:[UIColor purpleColor]];
  [self addSubview:[self playXOButton]];

  playOButton_ = [UIButton new];
  [[self playOButton] setTitle:@"O" forState:UIControlStateNormal];
  [[self playOButton] setTranslatesAutoresizingMaskIntoConstraints:NO];
  [[self playOButton] setBackgroundColor:[UIColor magentaColor]];
  [self addSubview:[self playOButton]];

  playXButton_ = [UIButton new];
  [[self playXButton] setTitle:@"X" forState:UIControlStateNormal];
  [[self playXButton] setTranslatesAutoresizingMaskIntoConstraints:NO];
  [[self playXButton] setBackgroundColor:[UIColor blueColor]];
  [self addSubview:[self playXButton]];
}

- (void)setUpConstraints {
  NSDictionary *views = @{
      @"xo": [self playXOButton],
      @"x": [self playXButton],
      @"o": [self playOButton]
  };

  NSString *format = @"|-(padding)-[xo]-(padding)-[x(==xo)]-(padding)-[o(==xo)]-(padding)-|";
  NSLayoutFormatOptions option = NSLayoutFormatAlignAllBottom | NSLayoutFormatAlignAllTop;
  NSDictionary *metrics = @{@"padding": @(kPadding)};
  NSArray *hConstraints = [NSLayoutConstraint constraintsWithVisualFormat:format
                                                                  options:option
                                                                  metrics:metrics
                                                                    views:views];
  [NSLayoutConstraint activateConstraints:hConstraints];

  NSArray *vConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[xo]-(padding)-|"
                                                                  options:0
                                                                  metrics:metrics
                                                                    views:views];
  [NSLayoutConstraint activateConstraints:vConstraints];

  [[NSLayoutConstraint constraintWithItem:[self playXOButton]
                                attribute:NSLayoutAttributeHeight
                                relatedBy:NSLayoutRelationEqual
                                   toItem:[self playXOButton]
                                attribute:NSLayoutAttributeWidth
                               multiplier:1
                                 constant:0] setActive:YES];
}

@end
