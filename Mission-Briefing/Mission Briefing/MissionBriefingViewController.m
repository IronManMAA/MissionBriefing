//
//  ViewController.m
//  Mission Briefing
//
//  Created by Ben Gohlke on 1/16/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "MissionBriefingViewController.h"

@interface MissionBriefingViewController ()

@property (strong, nonatomic) IBOutlet UITextField *agentNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *agentPasswordTextField;
@property (strong, nonatomic) IBOutlet UILabel *greetingLabel;
@property (strong, nonatomic) IBOutlet UITextView *missionBriefingTextView;

- (IBAction)authenticateAgent:(UIButton *)sender;

@end

@implementation MissionBriefingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    //
    // 1. These three UI elements need to be emptied on launch
    //    Hint: there is a string literal that represents empty
    //
    
    self.agentNameTextField.text = @"" ;
    //<#what goes here?#>];
    self.greetingLabel.text = @"" ;
    // <#how about here?#>;
    self.missionBriefingTextView.text = @"" ;
    //<#and here?#>;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)authenticateAgent:(UIButton *)sender
{
    NSString *agentName = self.agentNameTextField.text;
    NSString *agentPassWordName = self.agentPasswordTextField.text;
    NSArray *subStrings = [agentName componentsSeparatedByString:@" "];
    if ([agentName length] == 0)
      {
      self.greetingLabel.text = @"Please provide your Login Name";
      self.view.backgroundColor = [UIColor redColor];
      return;
      }
    if ([agentPassWordName length] == 0)
    {
        self.greetingLabel.text = @"Please provide your password";
        self.view.backgroundColor = [UIColor redColor];
        return;
    }
    NSInteger size = [subStrings count];
    if (size > 1)
    {
        NSString *agentLastName = [subStrings objectAtIndex:1];
        //NSString *agentFirstName = [subStrings objectAtIndex:0];
        self.greetingLabel.text = [NSString stringWithFormat:@"Good evening, Agent: %@",agentLastName];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"MissionBriefing" ofType:@"txt"];
        NSString *str=[NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:NULL];
        //    NSString *str = @"This is a string";
        str = [str stringByReplacingOccurrencesOfString:@"%@" withString: agentLastName];
        self.missionBriefingTextView.text = str;
        self.view.backgroundColor = [UIColor greenColor];
        
    }
    else
    {
        self.greetingLabel.text = @"Please provide your Last Name";
        self.view.backgroundColor = [UIColor redColor];
        return;
    }

}
@end
