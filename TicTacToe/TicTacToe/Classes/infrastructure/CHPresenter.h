#import <Foundation/Foundation.h>

@class CHViewController;

@interface CHPresenter : NSObject

@property(nonatomic, weak) CHViewController *viewController;

- (void)viewLoaded;
- (void)viewWillDisappear;
- (NSArray *)leftNavigationButtons;
- (NSArray *)rightNavigationButtons;

@end
