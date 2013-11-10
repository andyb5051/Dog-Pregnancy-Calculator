//
//  DogPregnancyCalculatorViewController.m
//  Dog Pregnancy Calculator
//
//  Created by Andy Brown on 05/01/2013.
//  Copyright (c) 2013 Andy Brown. All rights reserved.
//

#import "DogPregnancyCalculatorViewController.h"

@interface DogPregnancyCalculatorViewController ()

@end

@implementation DogPregnancyCalculatorViewController

@synthesize datePicker;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSDate *)CalculateDate {
    NSInteger daysToAdd = 64;
    NSDate *inputtedDate = datePicker.date;
    NSDateComponents *dateComponents = [[NSDateComponents alloc]init];
    [dateComponents setDay:daysToAdd];
    return [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:inputtedDate options:0];
}

- (IBAction)calculateDueDateBtn:(id)sender {
    
    NSDate *result = [self CalculateDate];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    
    NSString *userVisibleDateTimeString = [dateFormatter stringFromDate:result];
    NSString* messageString = @"Your puppies are due on: ";
    messageString = [messageString stringByAppendingString:userVisibleDateTimeString];
    
    UIAlertView *alertView = [[UIAlertView alloc]
                              initWithTitle: @"Date calculated"
                              message: messageString
                              delegate: nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
    
    [alertView show];
}
@end
