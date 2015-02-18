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
  [playXOButton_ setTitle:@"XO" forState:UIControlStateNormal];
  [playXOButton_ setTranslatesAutoresizingMaskIntoConstraints:NO];
  [playXOButton_ setBackgroundColor:[UIColor purpleColor]];
  [self addSubview:playXOButton_];

  playOButton_ = [UIButton new];
  [playOButton_ setTitle:@"O" forState:UIControlStateNormal];
  [playOButton_ setTranslatesAutoresizingMaskIntoConstraints:NO];
  [playOButton_ setBackgroundColor:[UIColor magentaColor]];
  [self addSubview:playOButton_];

  playXButton_ = [UIButton new];
  [playXButton_ setTitle:@"X" forState:UIControlStateNormal];
  [playXButton_ setTranslatesAutoresizingMaskIntoConstraints:NO];
  [playXButton_ setBackgroundColor:[UIColor blueColor]];
  [self addSubview:playXButton_];
}

- (void)setUpConstraints {
  NSDictionary *views = @{
      @"xo": playXOButton_,
      @"x": playXButton_,
      @"o": playOButton_
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

  [[NSLayoutConstraint constraintWithItem:playXOButton_
                                attribute:NSLayoutAttributeHeight
                                relatedBy:NSLayoutRelationEqual
                                   toItem:playXOButton_
                                attribute:NSLayoutAttributeWidth
                               multiplier:1
                                 constant:0] setActive:YES];
}

@end
