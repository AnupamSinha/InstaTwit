//
//  ViewController.m
//  InstaTwit
//
//  Created by Anupam Sinha
//  
//

#import "InstaTwitViewController.h"

#import <Social/Social.h>

@interface InstaTwitViewController ()

@property (nonatomic, strong) NSArray *activities;
@property (nonatomic, strong) NSArray *feelings;

@end

@implementation InstaTwitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.activities = @[@"sleeping", @"eating", @"working", @"thinking",
                        @"crying", @"begging", @"leaving", @"shopping", @"hello worlding"];
    self.feelings = @[@"i m cool", @"sad", @"happy", @"ambivalent", @"nauseous",
                      @"psyched", @"confused", @"hopeful", @"anxious"];
}

#pragma mark -
#pragma mark Actions

- (IBAction)textFieldDoneEditing:(id)sender {
    [sender resignFirstResponder];
}

- (IBAction)tweetButtonTapped:(id)sender {
    NSString *message = [NSString stringWithFormat:@"%@ Test Tweet I'm %@ and feeling %@ about it.",
                         self.notesField.text ? self.notesField.text : @"",
                         self.activities[[self.tweetPicker selectedRowInComponent:0]],
                         self.feelings[[self.tweetPicker selectedRowInComponent:1]]];
    NSLog(@"%@", message);
    
    SLComposeViewController *composeViewController = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
    [composeViewController setInitialText:message];
    [self presentViewController:composeViewController animated:YES completion:nil];
}

#pragma mark -
#pragma mark UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0) {
        return [self.activities count];
    }
    else {
        return [self.feelings count];
    }
}

#pragma mark -
#pragma mark UIPickerViewDelegate

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (component == 0) {
        return self.activities[row];
    }
    else {
        return self.feelings[row];
    }
}

#pragma mark -
#pragma mark Memory Management

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
