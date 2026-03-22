#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonCrypto.h>


- (void)fetch_all_tickersWithCompletion:(void(^)(NSDictionary *, NSError *))completion {
    // GET /api/tickers
    NSString *urlString = @"https://exchange-api.lcx.com/api/tickers";
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];

    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            completion(nil, error);
        } else {
            id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            completion(json, nil);

        }
    }] resume];
}

- (void)get_ticker_for_pairWithCompletion:(void(^)(NSDictionary *, NSError *))completion {
    // GET /api/ticker
    NSString *urlString = @"https://exchange-api.lcx.com/api/ticker";
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];

    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            completion(nil, error);
        } else {

        }
    }] resume];
}

- (void)fetch_all_pairsWithCompletion:(void(^)(NSDictionary *, NSError *))completion {
    // GET /api/pairs
    NSString *urlString = @"https://exchange-api.lcx.com/api/pairs";
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];

    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            completion(nil, error);
        } else {
            id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            completion(json, nil);

        }
    }] resume];
}

- (void)get_pair_infoWithCompletion:(void(^)(NSDictionary *, NSError *))completion {
    // GET /api/pair/BTC/USDC
    NSString *urlString = @"https://exchange-api.lcx.com/api/pair/BTC/USDC";
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];

    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            completion(nil, error);
        } else {

        }
    }] resume];
}

- (void)get_order_bookWithCompletion:(void(^)(NSDictionary *, NSError *))completion {
    // GET /api/book
    NSString *urlString = @"https://exchange-api.lcx.com/api/book";
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];

    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            completion(nil, error);
        } else {
            id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            completion(json, nil);

        }
    }] resume];
}

- (void)get_recent_tradesWithCompletion:(void(^)(NSDictionary *, NSError *))completion {
    // GET /api/trades
    NSString *urlString = @"https://exchange-api.lcx.com/api/trades";
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];

    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            completion(nil, error);
        } else {

        }
    }] resume];
}

- (void)get_candle_dataWithCompletion:(void(^)(NSDictionary *, NSError *))completion {
    // GET /v1/market/kline
    NSString *urlString = @"https://api-kline.lcx.com/v1/market/kline";
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];

    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            completion(nil, error);
        } else {
            id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            completion(json, nil);

        }
    }] resume];
}

- (void)market_overviewWithCompletion:(void(^)(NSDictionary *, NSError *))completion {
    // GET /api/book
    NSString *urlString = @"https://exchange-api.lcx.com/api/book";
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];

    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            completion(nil, error);
        } else {

        }
    }] resume];
}

- (void)get_tradesWithCompletion:(void(^)(NSDictionary *, NSError *))completion {
    // GET /api/trades
    NSString *urlString = @"https://exchange-api.lcx.com/api/trades";
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];

    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            completion(nil, error);
        } else {

        }
    }] resume];
}

# None method not supported for objective-c
