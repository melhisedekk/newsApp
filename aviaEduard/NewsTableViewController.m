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
@property (nonatomic, weak) NSArray<NewsItem*>* newsItemsArray;


@end

@implementation NewsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    
    self.title = @"NewsTableVC";
    self.view.backgroundColor = [UIColor greenColor];
    UITableView *table = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    table.dataSource = self;
    [self.view addSubview:table];
    self.tableView = table;
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"Press for fresh news"
                                                                  style:UIBarButtonItemStylePlain
                                                                 target:self
                                                                 action:@selector(loadNewsFromButton)];
    
    [rightItem setAction:@selector(loadNewsFromButton)];
    [self.navigationItem setRightBarButtonItem:rightItem];
    
    [self loadNewsFromServer:^(NSArray* newsItemsArray) {
            dispatch_async(dispatch_get_main_queue(), ^{
                self.newsItemsArray = newsItemsArray;
                self.tableView.reloadData;
            });
      }];
    
}

- (void)loadNewsFromServer:(void (^)(NSArray<NewsItem*>*))completion; {
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
//            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
            NSError *parseError = nil;
            NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&parseError];
            if ([responseDictionary[@"articles"] isKindOfClass:[NSArray class]]) {
                NSMutableArray<NewsItem*>* newsItemsArray = [NSMutableArray new];
                NSArray* articles = (NSArray*)responseDictionary[@"articles"];
                for (NSDictionary* articleDictionary in articles) {
                    NewsItem* item = [[NewsItem alloc] initWithDictionary:articleDictionary];
                    [newsItemsArray addObject:item];
//                    NSLog(@"%@ добавлена статья from VC", item.title);
                }
                
                completion(newsItemsArray);
                
                NSLog(@"from VC ended");
            }
            
            NSLog(@"News from VC did load");
        }
    }];
    [dataTask resume];
}


- (void)loadNewsFromButton {
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
//            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
            NSError *parseError = nil;
            NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&parseError];
            if ([responseDictionary[@"articles"] isKindOfClass:[NSArray class]]) {
                NSMutableArray<NewsItem*>* newsItemsArray = [NSMutableArray new];
                NSArray* articles = (NSArray*)responseDictionary[@"articles"];
                for (NSDictionary* articleDictionary in articles) {
                    NewsItem* item = [[NewsItem alloc] initWithDictionary:articleDictionary];
                    [newsItemsArray addObject:item];
                    NSLog(@"%@ добавлена статья", item.publishedAt);
                }
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
    }
    
    cell.imageView.image = [UIImage systemImageNamed:@"bolt"];
    cell.textLabel.text = [NSString stringWithFormat:@"Новость %@", self.newsItemsArray[indexPath.row].title];
    cell.backgroundColor = [UIColor whiteColor];
    cell.tintColor = [UIColor redColor];
//    NSLog(@"Cell formatted %@", _newsItemsArray[indexPath.row]);
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _newsItemsArray.count;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    [_dataObjects removeObjectAtIndex:indexPath.row];
    [tableView deleteRowsAtIndexPaths:@[ indexPath ] withRowAnimation:UITableViewRowAnimationFade];
}




@end
