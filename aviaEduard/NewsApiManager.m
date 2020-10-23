//
//  NewsApiManager.m
//  aviaEduard
//
//  Created by Эдуард Фархшатов on 22.10.2020.
//
/*
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define API_KEY @"c5d01c823e2e453593d23a653e99e231"
#define API_URL_IP_ADDRESS @"http://newsapi.org/v2/top-headlines"// -G \ -d country=us \ -d apiKey=c5d01c823e2e453593d23a653e99e231"
//#define API_URL_CHEAP @"https://api.travelpayouts.com/v1/prices/cheap"
//#define API_URL_CITY_FROM_IP @"https://www.travelpayouts.com/whereami?ip="

@interface NewsApiManager : NSObject




+ (instancetype)sharedInstance;
//- (void)cityForCurrentIP:(void (^)(City *city))completion;

@end

// APIManager.m




@implementation NewsApiManager

+ (instancetype)sharedInstance {
    static NewsApiManager *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[NewsApiManager alloc] init];
    });
    return instance;
}


- (void)getNews

//- (void)cityForCurrentIP:(void (^)(City *city))completion {
//    [self IPAddressWithCompletion:^(NSString *ipAddress) {
//        [self load:[NSString stringWithFormat:@"%@%@", API_URL_CITY_FROM_IP, ipAddress] withCompletion:^(id  _Nullable result) {
//            NSDictionary *json = result;
//            NSString *iata = [json valueForKey:@"iata"];
//            if (iata) {
//                City *city = [[DataManager sharedInstance] cityForIATA:iata];
//                if (city) {
//                    dispatch_async(dispatch_get_main_queue(), ^{
//                        completion(city);
//                    });
//                }
//            }
//        }];
//    }];
//}

//- (void)IPAddressWithCompletion:(void (^)(NSString *ipAddress))completion {
//    [self load:API_URL_IP_ADDRESS withCompletion:^(id  _Nullable result) {
//        NSDictionary *json = result;
//        completion([json valueForKey:@"ip"]);
//    }];
//}

//- (void)load:(NSString *)API_URL_IP_ADDRESS withCompletion:(void (^)(id _Nullable result))completion {
//    dispatch_async(dispatch_get_main_queue(), ^{
//       [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
//    });
//    [[[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString:API_URL_IP_ADDRESS] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
//        });
//        completion([NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil]);
//    }] resume] ;
//}

@end

*/
