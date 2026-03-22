#import <Foundation/Foundation.h>

NSURL *url = [NSURL URLWithString:@"https://exchange-api.lcx.com/api/auth/ws?x-access-key={value}&x-access-sign={value}&x-access-timestamp={value}"];
NSData *data = [NSData dataWithContentsOfURL:url];
NSLog(@"%@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
