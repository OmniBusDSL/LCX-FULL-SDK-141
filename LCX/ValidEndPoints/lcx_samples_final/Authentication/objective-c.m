#import <Foundation/Foundation.h>

NSURL *url = [NSURL URLWithString:@"https://exchange-api.lcx.com"];
NSData *data = [NSData dataWithContentsOfURL:url];
NSLog(@"%@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
