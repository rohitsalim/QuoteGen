//
//  ViewController.h
//  QuoteGen
//
//  Created by ROHITH SALIM on 7/9/13.
//  Copyright (c) 2013 ROHITH SALIM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, strong) NSArray *myQuotes;
@property (nonatomic, strong) NSMutableArray *movieQuotes;
@property (nonatomic, strong) IBOutlet UITextView *quoteText;
- (IBAction)quoteButtonTapped:(id)sender;
@property (nonatomic, strong) IBOutlet UISegmentedControl *quoteOpt;
@end
