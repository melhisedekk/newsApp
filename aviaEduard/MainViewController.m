//
//  MainViewController.m
//  aviaEduard
//
//  Created by Эдуард Фархшатов on 12.10.2020.
//

#import "MainViewController.h"
#import "NewsTableViewController.h"


@interface MainViewController ()

@property (nonatomic, weak) UILabel *textLabel;
@property (nonatomic, weak) UIButton *button;
@property (nonatomic, weak) UIButton *button2;
@property (nonatomic, weak) UIButton *button3;
@property (nonatomic, weak) UIButton *buttonCustom;
@property (nonatomic, weak) UIView *greenView;
//@property (nonatomic, weak) CGRect *button3Frame; // = CGRectMake(80.0, 100.0, 20.0, 20.0);

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Main Screen";
    
    self.navigationController.navigationBar.prefersLargeTitles = YES;
    
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.navigationController.navigationBar.backgroundColor = [UIColor whiteColor];
//    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
  
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"News screen"
                                                             style:UIBarButtonItemStylePlain
                                                            target:self
                                                            action:@selector(showDetails)];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithTitle:@"News"
                                                             style:UIBarButtonItemStylePlain
                                                            target:self
                                                            action:@selector(showDetails)];

    [rightItem setAction:@selector(showDetails)];
    [leftItem setAction:@selector(showDetailsForLeftItem)];
    
    [self.navigationItem setRightBarButtonItem:rightItem];
    [self.navigationItem setLeftBarButtonItem:leftItem];
    
    
    [self createControls];
}
- (void)showDetails{
    NewsTableViewController *vc = [[NewsTableViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
//    [self presentViewController:vc animated:YES completion:nil];
}

- (void)showDetailsForLeftItem{
    NewsTableViewController *vc = [[NewsTableViewController alloc] init];
//    [self.navigationController pushViewController:vc animated:YES];
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    self.textLabel.frame = CGRectMake(20.0, 20.0, self.textLabel.superview.bounds.size.width - 40.0, 30.0);
    self.button.center = self.greenView.center;
 //   [self.button2 setFrame:CGRectMake(self.greenView.bounds.origin.y + 70.0, self.greenView.bounds.origin.x + 70.0, 20.0, 20.0)];
    self.button2.frame = CGRectMake(self.greenView.bounds.origin.y + 70.0, self.button2.superview.bounds.origin.x + 70.0, 20.0, 20.0);
    [self.button3 setFrame:CGRectMake(80.0, 100.0, 20.0, 20.0)];
    self.buttonCustom.selected = NO;
    
}

- (void)createControls{
    CGRect viewFrame = CGRectMake(40.0, 88.0 + 40.0, self.view.bounds.size.width - 80.0, self.view.bounds.size.height - (88.0 + 80.0));
    UIView *greenView = [[UIView alloc] initWithFrame:viewFrame];
    greenView.backgroundColor = [UIColor greenColor];
    greenView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:greenView];
    
    CGRect textFrame = CGRectMake(20.0, 20.0, greenView.bounds.size.width - 40.0, 30.0);
    UILabel *textLabel = [[UILabel alloc] initWithFrame:textFrame];
    textLabel.textColor = [UIColor darkTextColor];
    textLabel.textAlignment = NSTextAlignmentCenter;
    textLabel.text = @"Hello, World";
    textLabel.backgroundColor = [UIColor yellowColor];
    textLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [greenView addSubview:textLabel];
    self.textLabel = textLabel;
    
    
//    CGRect frame = CGRectMake(greenView.bounds.size.width / 2 - 100.0, greenView.bounds.size.height/2 - 25.0, 200.0, 30.0);
//    UITextField *textField = [[UITextField alloc] initWithFrame:frame];
//    textField.borderStyle = UITextBorderStyleRoundedRect;
//    textField.placeholder = @"Введите значение...";
//    textField.font = [UIFont systemFontOfSize:12.0 weight:UIFontWeightLight];
//    [self.view addSubview: textField];
//    [greenView addSubview: textField];
    
    
//    CGRect frame2 = CGRectMake([UIScreen mainScreen].bounds.size.width/2 - 100.0, [UIScreen mainScreen].bounds.size.height/2 + 290.0, 200.0, 50.0);
//    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"Тимур", @"Карим"]];
//    segmentedControl.frame = frame2;
//    segmentedControl.tintColor = [UIColor blackColor];
//    segmentedControl.selectedSegmentIndex = 0;
//    [self.view addSubview:segmentedControl];
    
//    CGRect frame3 = CGRectMake([UIScreen mainScreen].bounds.size.width/2 - 100.0, [UIScreen mainScreen].bounds.size.height/2 - 25.0, 200.0, 50.0);
//    UISlider *slider = [[UISlider alloc] init];
//    slider.frame = frame3;
//    slider.tintColor = [UIColor blackColor];
//    slider.value = 0.3;
//    [self.view addSubview:slider];
    
    
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeInfoLight];
//    [button addTarget:self action:@selector(buttonTap:) forControlEvents:UIControlEventTouchUpInside];
//    button.center = greenView.center;
//    button.tag = 11;
//    [greenView addSubview:button];
//
//    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeInfoLight];
//    [button2 addTarget:self action:@selector(buttonTap:) forControlEvents:UIControlEventTouchUpInside];
//    [button2 setFrame:CGRectMake(greenView.bounds.origin.y + 70.0, greenView.bounds.origin.x + 70.0, 20.0, 20.0)];
//    button2.tag = 12;
//    button2.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
//    [greenView addSubview:button2];
//    self.button2 = button2;
//
//    CGRect button3Frame = CGRectMake(80.0, 100.0, 20.0, 20.0);
//    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeClose];
//    [button3 setFrame:button3Frame];
//    button3.tag = 13;
//    [button3 addTarget:self action:@selector(buttonTap:) forControlEvents:UIControlEventTouchUpOutside];
//    [greenView addSubview:button3];
//    self.button3 = button3;
    
//    UIButton *buttonCustom = [UIButton buttonWithType:UIButtonTypeCustom];
//    [buttonCustom setTitle:@"Tap me!" forState:UIControlStateNormal];
//    [buttonCustom setTitle:@"Tapping..." forState:UIControlStateHighlighted];
//    [buttonCustom setTitle:@"Tapped" forState:UIControlStateSelected];
//    [buttonCustom setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
//    [buttonCustom addTarget:self action:@selector(buttonTap:) forControlEvents:UIControlEventTouchUpInside];
//    buttonCustom.frame = CGRectMake(0.0, 0.0, 100.0, 44.0);
//    buttonCustom.center = CGPointMake(greenView.bounds.size.width / 2, greenView.bounds.size.height / 2);
//    buttonCustom.backgroundColor = [UIColor blueColor];
//    buttonCustom.tag = 14;
//    [greenView addSubview:buttonCustom];
//    self.buttonCustom = buttonCustom;
//}
//
//- (void)buttonTap:(UIButton *) sender{
//    switch (sender.tag) {
//        case 11:
//            sender.superview.backgroundColor = [UIColor magentaColor];
//            break;
//        case 12:
//            sender.superview.backgroundColor = [UIColor blueColor];
//            break;
//        case 13:
//            sender.superview.backgroundColor = [UIColor grayColor];
//            break;
//        case 14:
////            if (sender.selected) {
//                sender.superview.backgroundColor = [UIColor lightGrayColor];
//                sender.selected = YES;
////            }
//            
//            break;
//        default:
//            break;
//    }
    
}

@end
