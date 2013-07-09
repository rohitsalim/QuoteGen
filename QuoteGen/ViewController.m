//
//  ViewController.m
//  QuoteGen
//
//  Created by ROHITH SALIM on 7/9/13.
//  Copyright (c) 2013 ROHITH SALIM. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.myQuotes = @[
                      @"Live and Let live",
                      @"Stay hungry, Stay foolish",
                      @"Be motivated by the possibility of greatness",
                      @"You miss a hundre percent of the shots you don't take",
                      @"My Name is Rohith Salim and I will leave a legacy"
                      ];
    
    //2 Load movie quotes
    NSString *plistCatPath = [[NSBundle mainBundle] pathForResource:@"quotes" ofType:@"plist"];
    self.movieQuotes = [NSMutableArray arrayWithContentsOfFile:plistCatPath];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)quoteButtonTapped:(id)sender {
    
    if (self.quoteOpt.selectedSegmentIndex == 2) {
        int array_tot = [self.myQuotes count];
        
        NSString *currentQuote = nil;
        NSString *allQuotes = @"";
        for (int x = 0 ; x < array_tot; x++) {
            currentQuote = self.myQuotes[x];
            allQuotes = [NSString stringWithFormat:@"%@\n%@\n", allQuotes, currentQuote];
        }
        
        
        self.quoteText.text = [NSString stringWithFormat:@"All Quotes: \n%@", allQuotes];
    } else {
        NSString *selectedCategory = @"classic";
        if (self.quoteOpt.selectedSegmentIndex == 1) {
            selectedCategory = @"modern";
        }
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"category == %@", selectedCategory];
        NSArray *filteredArray = [self.movieQuotes filteredArrayUsingPredicate:predicate];
        
        int array_tot = [filteredArray count];
        if (array_tot > 0) {
            int index = (arc4random() % array_tot);
            NSString *quote = filteredArray[index][@"quote"];
            
            NSString *source = [[filteredArray objectAtIndex:index] valueForKey:@"source"];
            if (![source length] == 0) {
                quote = [NSString stringWithFormat:@"%@\n\n%@", source, quote];
            }
            
            if ([selectedCategory isEqualToString:@"classic"]) {
                quote = [NSString stringWithFormat:@"Classic Movie Quote: \n\n%@", quote];
            } else {
                quote = [NSString stringWithFormat:@"Modern Movie Quote: \n\n%@", quote];
            }
            
            self.quoteText.text = quote;
        } else {
            self.quoteText.text = @"No Quotes to display";
        }
        
        
    }
}

@end
