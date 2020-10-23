//
//  AnotherViewController.m
//  aviaEduard
//
//  Created by Эдуард Фархшатов on 16.10.2020.
//
#import <Foundation/Foundation.h>
#import "NewsTableViewController.h"
#import "CustomTableViewCell.h"
#import "NewsItem.h"


@interface NewsTableViewController ()

//@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, weak) NSMutableURLRequest *request;
@property (nonatomic, strong) NSMutableArray *dataObjects;


@end

@implementation NewsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.dataObjects = [@[ @1, @2, @3, @4, @5, @6, @7, @8, @9, @10,
                           @11, @12, @13, @14, @15, @16, @17, @18, @19, @20,
                           @21, @22, @23, @24, @25, @26, @27, @28, @29, @30,
                           @31, @32, @33, @34, @35, @36, @37, @38, @39, @40,
                           @41, @42, @43, @44, @45, @46, @47, @48, @49, @50,
                           @51, @52, @53, @54, @55, @56, @57, @58, @59, @60,
                           @61, @62, @63, @64, @65, @66, @67, @68, @69, @70,
                           @71, @72, @73, @74, @75, @76, @77, @78, @79, @80,
                           @81, @82, @83, @84, @85, @86, @87, @88, @89, @90,
                           @91, @92, @93, @94, @95, @96, @97, @98, @99, @100 ] mutableCopy];
    
    self.title = @"Details Screen";
    self.view.backgroundColor = [UIColor greenColor];
    UITableView *table = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    table.dataSource = self;
    [self.view addSubview:table];
    self.tableView = table;
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"Press for fresh news"
                                                                  style:UIBarButtonItemStylePlain
                                                                 target:self
                                                                 action:@selector(loadNews)];
    
    [rightItem setAction:@selector(loadNews)];
    [self.navigationItem setRightBarButtonItem:rightItem];
}
//- (void)loadNews:(void (^)(NSArray<NewsItem*>*))completion;


//-(void)method1:(void (^ __nullable)(void))completion {
//    NSLog(@"method1 started");
//    //Do some stuff, then completion
//    completion();
//    NSLog(@"method1 ended");
//}
//-(void)method2{
//    NSLog(@"method2 called");
//}

//- (void)loadNews: (void (^ __nullable) (void)) completion {
//- (void)loadNews:(void (^)(NSArray<NewsItem*>*))completion;

- (void)loadNews {
    //dispatch_semaphore_t sema = dispatch_semaphore_create(0);
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"https://newsapi.org/v2/top-headlines?country=us&apiKey=c5d01c823e2e453593d23a653e99e231"]];
    NSDictionary *headers = @{
        @"Cookie": @"__cfduid=d03a45d66ac605b7785e2eb6ec5af22a41603384654"
    };
    
    [request setAllHTTPHeaderFields :headers];
    [request setHTTPMethod:@"GET"];
                                    
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration: config];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            NSLog(@"%@", error);
        } else {
            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
            NSError *parseError = nil;
            NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&parseError];
            if ([responseDictionary[@"articles"] isKindOfClass:[NSArray class]]) {
                NSMutableArray<NewsItem*>* newsItems = [NSMutableArray new];
                NSArray* articles = (NSArray*)responseDictionary[@"articles"];
                for (NSDictionary* articleDictionary in articles) {
                    NewsItem* item = [[NewsItem alloc] initWithDictionary:articleDictionary];
                    [newsItems addObject:item];
                    NSLog(@"добавлена статья");
                }
                NSLog(@"method1 ended");
//                completion();
            }
            NSLog(@"News did load");
        }
    }];
    [dataTask resume];
}




// MARK: - UITableViewDataSource

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellIdentifier"];
    if (!cell) {
        cell = [[CustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellIdentifier"];
        //    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellIdentifier"];
        //    if (!cell) {
        //        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellIdentifier"];
    }
    
    if (indexPath.row % 2 == 0) {
        cell.imageView.image = [UIImage systemImageNamed:@"bolt"];
        cell.textLabel.text = [NSString stringWithFormat:@"Left %ld, объект %@", indexPath.row, _dataObjects[indexPath.row]];
        //        cell.backgroundColor = nil;
        //        cell.tintColor = nil;
    } else {
        //        cell.imageView.image = nil;
        //        cell.tintColor = nil;
        cell.textLabel.text = [NSString stringWithFormat:@"Right %ld", indexPath.row];
        cell.backgroundColor = [UIColor yellowColor];
        cell.tintColor = [UIColor redColor];
    }
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataObjects.count;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    [_dataObjects removeObjectAtIndex:indexPath.row];
    [tableView deleteRowsAtIndexPaths:@[ indexPath ] withRowAnimation:UITableViewRowAnimationFade];
}




@end
