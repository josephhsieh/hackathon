//
//  VisViewController.m
//  Visualizr
//
//  Created by Jeff DeButte on 2014-02-26.
//  Copyright (c) 2014 Jeff DeButte. All rights reserved.
//

#import "VisViewController.h"
#import "VisWebView.h"

@interface VisViewController ()
@property (strong, nonatomic) IBOutlet VisWebView *webView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *back;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *refresh;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *forward;

@end

@implementation VisViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

	NSString *htmlFile = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
    //NSString* htmlString = [NSString stringWithContentsOfFile:htmlFile encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"htmlFile: %@", htmlFile);
    NSURL *url = [[NSURL alloc] initFileURLWithPath:htmlFile];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    
    self.webView.delegate = self;
    [self.webView loadRequest:request];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    NSString *url = [[[webView request] URL] absoluteString];
    NSLog(@"Loading: %@", url);
    [self updateButtons];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    [self updateButtons];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    [self updateButtons];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSString *url = [[[webView request] URL] absoluteString];
    
    NSLog(@"ShoudLoad: %@", url);
    
    return YES;
}

- (void)loadRequest:(NSURLRequest *)request
{
    NSString *url = [[request URL] absoluteString];
    NSLog(@"VisWebView Loading: %@", url);
}

- (void)updateButtons
{
    self.forward.enabled = self.webView.canGoForward;
    self.back.enabled = self.webView.canGoBack;
}

@end
