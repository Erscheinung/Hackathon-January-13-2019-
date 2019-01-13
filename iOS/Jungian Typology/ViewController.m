//
//  ViewController.m
//  Jungian Typology
//
//  Created by Kartikeya Chauhan on 09/01/19.
//  Copyright © 2019 Jungian Typology. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize emailPicker=emailPicker_;
@synthesize notesField=notesField_;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    activities_ = [[NSArray alloc] initWithObjects:@"harrassed", @"followed", @"molested", @"threatened", @"hurt", @"held hostage", @"robbed", @"tortured", nil];
    
    feelings_ = [[NSArray alloc] initWithObjects:@"anxious", @"suspicious", @"afraid", @"horrified", @"disgusted", @"threatened", @"confused", @"dizzy", @"agonised", nil];
}

#pragma mark -
#pragma mark Picker Datasource Protocol
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *) pickerView {
    return 2; }
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent :(NSInteger)component {
    if (component == 0)
        return [activities_ count];
    else
        return [feelings_ count];
    
}

#pragma mark -
#pragma mark Picker Delegate Protocol
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (component == 0)
        return [activities_ objectAtIndex:row];
    else
        return [feelings_ objectAtIndex:row];
    return nil;
}

#pragma mark - #pragma mark Actions
- (IBAction) sendButtonTapped: (id) sender {
    NSString* theMessage = [NSString stringWithFormat:@"%@ I’m being %@ and feeling %@ about it.", notesField_.text ? notesField_.text : @"",[activities_ objectAtIndex:[emailPicker_ selectedRowInComponent:0]], [feelings_ objectAtIndex:[emailPicker_ selectedRowInComponent:1]]];
    NSLog(@"%@",theMessage);
    if ([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController* mailController = [[MFMailComposeViewController alloc] init];
        mailController.mailComposeDelegate = self;
        [mailController setSubject:@"EMERGENCY: Help!"];
        [mailController setMessageBody:theMessage isHTML:NO];
        [self presentViewController:mailController animated:YES completion:nil];
    }
    else {NSLog(@"%@", @"Sorry, you need to setup mail first!");
    }
}
/*
#pragma mark - #pragma mark Actions

- (IBAction)sendButtonTapped:(id) sender{
MFMessageComposeViewController *messageController = [[MFMessageComposeViewController alloc] init];
messageController.messageComposeDelegate = self;
[messageController setRecipients:recipents];
[messageController setBody:message];
    
}
*/

#pragma mark -
#pragma mark Mail composer delegate method
- (void)mailComposeController:(MFMailComposeViewController*) controller

          didFinishWithResult:(MFMailComposeResult)result
                        error:(NSError*)error;
{
    [self dismissViewControllerAnimated:YES completion: nil];
}

- (IBAction)textFieldDoneEditing:(id) sender {
    [sender resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
- (void)showSMS:(NSString*)file {
    
    if(![MFMessageComposeViewController canSendText]) {
        UIAlertView *warningAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Your device doesn't support SMS!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [warningAlert show];
        return;
    }
    
    NSArray *recipents = @[@"12345678", @"72345524"];
    NSString *message = [NSString stringWithFormat:@"Just sent the %@ file to your email. Please check!", file];
    
    MFMessageComposeViewController *messageController = [[MFMessageComposeViewController alloc] init];
    messageController.messageComposeDelegate = self;
    [messageController setRecipients:recipents];
    [messageController setBody:message];
    
    // Present message view controller on screen
    [self presentViewController:messageController animated:YES completion:nil];
}
*/
#pragma mark -
#pragma mark Message composer delegate method
- (IBAction)SendSMS:(id)sender {
    /*
    NSString* theSMS = [NSString stringWithFormat:@"%@ I’m being %@ and feeling %@ about it.", notesField_.text ? notesField_.text : @"",[activities_ objectAtIndex:[emailPicker_ selectedRowInComponent:0]], [feelings_ objectAtIndex:[emailPicker_ selectedRowInComponent:1]]];
    NSLog(@"%@",theSMS);
    
- (void)sendSMS:(NSString *)bodyOfMessage recipientList:(NSArray *)recipients    {
        MFMessageComposeViewController *controller = [[MFMessageComposeViewController alloc] init];
        if([MFMessageComposeViewController canSendText])
        {
            controller.body = bodyOfMessage;
            controller.recipients = recipients;
            controller.messageComposeDelegate = self;
            [self presentModalViewController:controller animated:YES];
        }
    }
*/
    NSString* Message = [NSString stringWithFormat:@"%@ I’m being %@ and feeling %@ about it.", notesField_.text ? notesField_.text : @"",[activities_ objectAtIndex:[emailPicker_ selectedRowInComponent:0]], [feelings_ objectAtIndex:[emailPicker_ selectedRowInComponent:1]]];
    NSLog(@"%@",Message);
    MFMessageComposeViewController *mailController = [[MFMessageComposeViewController alloc] init];
    if([MFMessageComposeViewController canSendText])
    {
        mailController.body = Message;
        mailController.recipients = [NSArray arrayWithObjects:@"1(234)567-8910", nil];
        mailController.messageComposeDelegate = self;
        [self presentViewController:mailController animated:YES completion:nil];    }
}

- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result
{
    if (result == MessageComposeResultCancelled){
        NSLog(@"Message cancelled");
    }
    else if (result == MessageComposeResultSent){
        NSLog(@"Message sent");
    }
    else{
        NSLog(@"Message failed");
    }
}

-(void)MessageComposeController:(MFMailComposeViewController *)controller
         didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    if (result == MessageComposeResultCancelled){
        NSLog(@"Message cancelled");
    }
    else if (result == MessageComposeResultSent){
        NSLog(@"Message sent");
    }
    else{
        NSLog(@"Message failed");
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
-(void)mailComposeController:(MFMailComposeViewController *)controller
         didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    if (result == MessageComposeResultCancelled){
        NSLog(@"Message cancelled");
    }
    else if (result == MessageComposeResultSent){
        NSLog(@"Message sent");
    }
    else{
        NSLog(@"Message failed");
    }
    [self dismissViewControllerAnimated:YES completion:nil]; //<---- This line
}
*/

@end
