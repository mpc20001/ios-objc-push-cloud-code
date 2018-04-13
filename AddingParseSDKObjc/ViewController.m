//
//  ViewController.m
//  AddingParseSDKObjc
//
//  Created by Joren Winge on 12/28/17.
//  Copyright © 2017 Back4App. All rights reserved.
//

#import "ViewController.h"
#import <Parse/Parse.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    [self askToSendPushnotifications];
}

- (void)askToSendPushnotifications {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Send a push to the news channel"
                                                                   message:nil
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIPopoverPresentationController *popPresenter = [alert popoverPresentationController];
    popPresenter.sourceView = self.view;
    UIAlertAction *Okbutton = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self sendPushNotifications];
    }];
    [alert addAction:Okbutton];
    UIAlertAction *cancelbutton = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {

    }];
    [alert addAction:cancelbutton];
    popPresenter.sourceRect = self.view.frame;
    alert.modalPresentationStyle = UIModalPresentationPopover;
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)sendPushNotifications {
    [PFCloud callFunctionInBackground:@"pushsample"
                       withParameters:@{}
                                block:^(id object, NSError *error) {
                                    if (!error) {
                                        NSLog(@"PUSH SENT");
                                    }else{
                                        NSLog(@"ERROR SENDING PUSH: %@",error.localizedDescription);
                                    }
                                }];
}


@end
