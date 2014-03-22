//
// TMDbClient
//
// Copyright (c) 2013 Orlando Aleman ( http://orlandoaleman.com )
//
// Based on ILTMDb by Gustavo Leguizamon ( http://goopi.me )
//
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.


#import "TMDbClient.h"


#pragma mark - Notifications
NSString *const kTMDbClientImagesBaseUrlChangedNotification = @"TMDbClientsImagesBaseUrlChanged";


#pragma mark -TMDbClient


@implementation TMDbClient


+ (TMDbClient *)sharedClient
{
    static TMDbClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _sharedClient = [[TMDbClient alloc] initWithBaseURL:[NSURL URLWithString:kTMDbBaseURLString]];
    });
    return _sharedClient;
}


- (TMDbClient *)initWithBaseURL:(NSURL *)url
{
    if (self = [super initWithBaseURL:url]) {
        self.securityPolicy.allowInvalidCertificates = NO;
        self.securityPolicy.SSLPinningMode = AFSSLPinningModePublicKey;
        self.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"application/json", nil];
    }
    
    return self;
}


- (void)setApiKey:(NSString *)apiKey
{
    _apiKey = apiKey;
    
    [self setup];
}


- (void)setup
{
    [self getPath:kTMDbConfigurationPath parameters:nil block: ^(NSDictionary *JSON, NSError *error) {
        _imagesBaseUrl = [NSURL URLWithString:JSON[kTMDbConfigurationImagesKey][kTMDbConfigurationImagesBaseUrlKey]];        
        [[NSNotificationCenter defaultCenter] postNotificationName:kTMDbClientImagesBaseUrlChangedNotification object:_imagesBaseUrl];
    }];
}


- (void)getPath:(NSString *)path parameters:(NSDictionary *)parameters block:(TMDbClientResponseBlock)block
{
    NSParameterAssert(self.apiKey);
    
    NSMutableDictionary *params = parameters ? [parameters mutableCopy] : [@{} mutableCopy];
    params[@"api_key"] = self.apiKey;
    
    if ([path rangeOfString:@":id"].location != NSNotFound) {
        NSParameterAssert(parameters[@"id"]);
        path = [path stringByReplacingOccurrencesOfString:@":id" withString:parameters[@"id"]];
        [params removeObjectForKey:@"id"];
    }

    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    [super GET:path parameters:params success: ^(AFHTTPRequestOperation *operation, id JSON) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        block(JSON, nil);
    }
    failure: ^(AFHTTPRequestOperation *operation, NSError *error) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;        
        block(nil, error);
    }];
}


- (NSURL *)fullURLForPath:(NSString *)path parameters:(NSDictionary *)parameters
{
    if ([path rangeOfString:@":id"].location != NSNotFound) {
        NSParameterAssert(parameters[@"id"]);
        path = [path stringByReplacingOccurrencesOfString:@":id" withString:parameters[@"id"]];
    }
    return [NSURL URLWithString:[kTMDbBasePublicURLString stringByAppendingPathComponent:path]];
}


@end
