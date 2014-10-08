//
//  PDStudentMenuViewController.m
//  dunno-ipad
//
//  Created by Wanderley Miyata on 10/1/14.
//  Copyright (c) 2014 Dunno Solucoes Educacionais. All rights reserved.
//

#import "PDStudentMenuViewController.h"
#import "PDStudentMenuViewCell.h"
#import "DUNStudent.h"
#import <UIImageView+AFNetworking.h>

@interface PDStudentMenuViewController ()

@end

@implementation PDStudentMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_studentList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // load student
    DUNStudent *student = (DUNStudent*)[_studentList objectAtIndex:indexPath.row];
    
    // load cell
    PDStudentMenuViewCell *cell = (PDStudentMenuViewCell *)[tableView dequeueReusableCellWithIdentifier:@"PDStudentMenuCell" forIndexPath:indexPath];
    
    // configure cell
    cell.nameLabel.text = student.name;
    cell.ageLabel.text = @"22";

    // configure avatar
    [cell.pictureView setImageWithURL:[NSURL URLWithString:student.avatar]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    // cell height
    return 68.0;
}

@end
