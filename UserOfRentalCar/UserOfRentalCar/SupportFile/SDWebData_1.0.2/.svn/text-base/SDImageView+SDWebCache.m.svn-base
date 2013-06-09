//
//  UIImageView+SDWebCache.m
//  SDWebData
//
//  Created by stm on 11-7-13.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SDImageView+SDWebCache.h"

@implementation UIImageView(SDWebCacheCategory)

- (void)setImageWithURL:(NSURL *)url
{
	[self setImageWithURL:url refreshCache:NO];
}

- (void)setImageWithURL:(NSURL *)url refreshCache:(BOOL)refreshCache
{
	[self setImageWithURL:url refreshCache:refreshCache placeholderImage:nil];
}

- (void)setImageWithURL:(NSURL *)url refreshCache:(BOOL)refreshCache placeholderImage:(UIImage *)placeholder
{
    
    UIActivityIndicatorView *activiy = (UIActivityIndicatorView*)[self viewWithTag:100];
	if (!activiy) {
		activiy= [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(self.frame.size.width/2-10, self.frame.size.height/2-10, 20, 20)];
		activiy.tag = 100;
		[self addSubview:activiy];
		[activiy startAnimating];
		[activiy release];
	}

    SDWebDataManager *manager = [SDWebDataManager sharedManager];
	
    // Remove in progress downloader from queue
    [manager cancelForDelegate:self];
    self.image = placeholder;
	
    if (url)
    {
        [manager downloadWithURL:url delegate:self refreshCache:refreshCache];
    }       
}

- (void)cancelCurrentImageLoad
{
    [[SDWebDataManager sharedManager] cancelForDelegate:self];
}

#pragma mark -
#pragma mark SDWebDataManagerDelegate

- (void)webDataManager:(SDWebDataManager *)dataManager didFinishWithData:(NSData *)aData isCache:(BOOL)isCache
{
    for (UIView *v in [self subviews]) {
		if ([v isKindOfClass:[UIActivityIndicatorView class]]&&v.tag == 100) {
			[v removeFromSuperview];
		}
	}
	UIImage *img=[UIImage imageWithData:aData];
    self.image=img;
}

-(void)webDataManager:(SDWebDataManager *)dataManager didFailWithError:(NSError *)error{
    for (UIView *v in [self subviews]) {
		if ([v isKindOfClass:[UIActivityIndicatorView class]]&&v.tag == 100) {
			[v removeFromSuperview];
		}
	}
}
@end
