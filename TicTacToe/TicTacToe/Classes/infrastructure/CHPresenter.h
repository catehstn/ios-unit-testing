#import <Foundation/Foundation.h>

@class CHViewController;

@interface CHPresenter : NSObject

@property(nonatomic, unsafe_unretained) CHViewController *viewController;

- (void)viewLoaded;
- (void)viewWillDisappear;
- (NSArray *)leftNavigationButtons;
- (NSArray *)rightNavigationButtons;

@end
