//
//  ViewController.m
//  WebBrowser
//
//  Created by Matthew Man on 1/3/2017.
//  Copyright © 2017年 MatthewApp. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.backButton.enabled = NO;
    self.forwardButton.enabled = NO;
    self.textField.delegate = self;
    NSURL *url = [NSURL URLWithString:@"http://www.shoeisha.co.jp/"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)webViewDidFinishLoad:(UIWebView*) webView
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    self.backButton.enabled = self.webView.canGoBack;
    self.forwardButton.enabled = self.webView.canGoForward;
    
}

- (void)webViewDidStartLoad:(UIWebView*) webView
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

- (IBAction)gotoURL:(id)sender {
    NSString *tmp;
    if([self.textField.text containsString:@"http://"] || [self.textField.text containsString:@"https://"]){
        tmp = [NSString stringWithFormat:@"%@",self.textField.text];
    }
    else{
        tmp = [NSString stringWithFormat:@"%s%@", "https://",self.textField.text];
    }
    NSLog(@"%@", tmp);
    NSURL *url = [NSURL URLWithString:tmp];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    
    [self.textField resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextView*) textField
{
    [self gotoURL:self.textField];
    return YES;
}


@end
