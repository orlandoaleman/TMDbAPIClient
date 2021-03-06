//
// TMDbClient
//
// Copyright (c) 2013 Orlando Aleman (http://orlandoaleman.com)
//
// Based on ILTMDb by Gustavo Leguizamon (http://goopi.me)
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

#import "AFHTTPRequestOperationManager.h"
#import "TMDbConstants.h"


#pragma mark - Notifications
FOUNDATION_EXPORT NSString *const kTMDbClientImagesBaseUrlChangedNotification;


#pragma mark - Response
typedef void (^TMDbClientResponseBlock)(NSDictionary *JSON, NSError *error);


#pragma mark - TMDbClient

@interface TMDbClient : AFHTTPRequestOperationManager

+ (TMDbClient *)sharedClient;
- (void)getPath:(NSString *)path parameters:(NSDictionary *)parameters block:(TMDbClientResponseBlock)block;
- (NSURL *)fullURLForPath:(NSString *)path parameters:(NSDictionary *)parameters;

@property (nonatomic, readonly) NSURL *imagesBaseUrl;
@property (nonatomic, copy) NSString *apiKey;
@end

