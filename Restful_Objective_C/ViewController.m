//
//  ViewController.m
//  Restful_Objective_C
//
//  Created by Nguyễn Đức Hậu on 03/10/2024.
//

#import "ViewController.h"
#import "AFNetworking.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getDataFromAPI];
    [self postDataToAPI];

}
- (void)postDataToAPI {
    // Tạo URL get
    NSURL *URL = [NSURL URLWithString:@"https://d892-14-232-245-144.ngrok-free.app/api/post"];
    
    // Tạo AFHTTPSessionManager
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    // Dữ liệu gửi đến API
    NSDictionary *parameters = @{@"fullname": @"hiep nguyen", @"username": @"hiep", @"password": @"123", @"image_account": @"link"};
    
    // Gửi yêu cầu post
    [manager POST:URL.absoluteString
       parameters:parameters
          headers:nil
          progress:nil
           success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
               // Xử lý dữ liệu khi thành công
               NSLog(@"Gửi dữ liệu thành công: %@", responseObject);
           }
           failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
               // Xử lý khi có lỗi
               NSLog(@"Lỗi khi gửi dữ liệu: %@", error.localizedDescription);
           }
     ];
}

- (void)getDataFromAPI {
    // Tạo URL get
    NSURL *URL = [NSURL URLWithString:@"https://d892-14-232-245-144.ngrok-free.app/api/getList"];
    
    // Tạo AFHTTPSessionManager
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    // Gửi yêu cầu get
    [manager GET:URL.absoluteString
      parameters:nil
        headers:nil
        progress:nil
         success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
             // Xử lý dữ liệu khi thành công
             NSLog(@"Dữ liệu lấy từ API: %@", responseObject);
         }
         failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
             // Xử lý khi có lỗi
             NSLog(@"Lỗi khi lấy dữ liệu: %@", error.localizedDescription);
         }
     ];
}


@end
