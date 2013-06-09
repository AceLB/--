//
//  UIButton+Down.m
//  ChiHao
//
//  Created by s on 12-3-19.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "UIButton+Down.h"
#import "SDImageView+SDWebCache.h"
#import "SDWebDataManager.h"
#import "SDWebImageCompatibly.h"

@implementation UIButton (UIButton_Down)
- (void)setImageView:(NSString *)urlStr
{
    UIActivityIndicatorView *activiy = (UIActivityIndicatorView*)[self viewWithTag:200];
	if (!activiy) {
		activiy = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(self.frame.size.width/2-10, self.frame.size.height/2-10, 20, 20)];
		activiy.tag = 200;
		[self addSubview:activiy];
		[activiy startAnimating];
		[activiy release];
	}
    
    NSURL *url = [NSURL URLWithString:urlStr];
    SDWebDataManager *manager = [SDWebDataManager sharedManager];
    [manager cancelForDelegate:self];
	
    if (url)
    {
        [manager downloadWithURL:url delegate:self refreshCache:NO];
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
		if ([v isKindOfClass:[UIActivityIndicatorView class]]&&v.tag == 200) {
			[v removeFromSuperview];
		}
	}
	UIImage *img=[UIImage imageWithData:aData];
    if (img) {
        [self setImage:img forState:UIControlStateNormal];
        [self setImage:img forState:UIControlStateHighlighted];
    }else{
        NSLog(@"nil");
    }

}
-(void)webDataManager:(SDWebDataManager *)dataManager didFailWithError:(NSError *)error{
    for (UIView *v in [self subviews]) {
		if ([v isKindOfClass:[UIActivityIndicatorView class]]&&v.tag == 200) {
			[v removeFromSuperview];
		}
	}
}
@end
