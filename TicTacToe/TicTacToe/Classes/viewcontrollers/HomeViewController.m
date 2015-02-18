#import "HomeViewController.h"

#import "HomeView.h"

@interface HomeViewController ()
@end

@implementation HomeViewController

- (void)loadView {
  [self setView:[HomeView new]];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
