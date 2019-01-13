//
//  ViewController.h
//  Jungian Typology
//
//  Created by Kartikeya Chauhan on 09/01/19.
//  Copyright © 2019 Jungian Typology. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MFMailComposeViewController.h>
#import <MessageUI/MFMessageComposeViewController.h>


@interface ViewController : UIViewController


<UIPickerViewDataSource, UIPickerViewDelegate, MFMailComposeViewControllerDelegate,MFMessageComposeViewControllerDelegate> {
    NSArray* activities_;
    NSArray* feelings_;
    UIPickerView *emailPicker_;
    UITextField *notesField_;
    NSArray *recipents_;
}
@property (nonatomic, retain) IBOutlet UIPickerView *emailPicker;
@property (nonatomic, retain) IBOutlet UITextField *notesField;

- (IBAction) sendButtonTapped: (id) sender;
- (IBAction) textFieldDoneEditing:(id) sender;


@end







