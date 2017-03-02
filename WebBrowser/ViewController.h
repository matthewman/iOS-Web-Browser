//
//  ViewController.h
//  WebBrowser
//
//  Created by Matthew Man on 1/3/2017.
//  Copyright © 2017年 MatthewApp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIWebViewDelegate,UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *backButton;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *forwardButton;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *reloadButton;
- (IBAction)gotoURL:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *textField;

@end

