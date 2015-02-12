#import <UIKit/UIKit.h>

@class CHPresenter;

@interface CHViewController : UIViewController

@property(nonatomic, readonly) CHPresenter *presenter;

// Designated initializer.
- (id)initWithPresenter:(CHPresenter *)presenter;

- (void)dismissViewControllerAnimated:(BOOL)animated
                  withCompletionBlock:(void (^)(void))completionBlock;

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated;

@end
