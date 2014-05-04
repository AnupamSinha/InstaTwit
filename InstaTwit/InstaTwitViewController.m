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
    
    self.activities = @[@"networking", @"coding", @"cheating", @"disturbing",
                        @"plying", @"ChickenIning", @"chaliIng", @"mooking", @"wondering"];
    self.feelings = @[@"curious", @"strange", @"crazy", @"WTF", @"ROFL",
                      @"great", @"strangled", @"hip hip hooray", @"WHOA"];
}

#pragma mark -
#pragma mark Actions

- (IBAction)textFieldDoneEditing:(id)sender {
    [sender resignFirstResponder];
}

- (IBAction)tweetButtonTapped:(id)sender {
    NSLog(@"Is this a logging message");
    NSString *message = [NSString stringWithFormat:@"%@ I'm %@ and feeling %@ about it.",
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
