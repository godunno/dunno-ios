//
//  MenuViewController.m
//  dunno-ipad
//
//  Created by Wanderley Miyata on 9/1/14.
//  Copyright (c) 2014 BlueScreen Sistemas. All rights reserved.
//

#import "PDMenuViewController.h"
#import "PDMenuItem.h"
#import "PDMenuItemViewCell.h"

#define MENU_CLASS 1
#define MENU_COURSE 2
#define MENU_LOGOUT 9

@interface PDMenuViewController ()

@property (nonatomic, strong) NSMutableArray *menuList;

@end

@implementation PDMenuViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // initialize menu items
    _menuList = [[NSMutableArray alloc] initWithObjects:[[PDMenuItem alloc] initWithIcon:@"menu_aulas_sel" title:@"Aulas" key:MENU_CLASS], [[PDMenuItem alloc] initWithIcon:@"menu_disciplinas_sel" title:@"Disciplinas" key:MENU_COURSE], [[PDMenuItem alloc] initWithIcon:@"menu_logout_sel" title:@"Logout" key:MENU_LOGOUT], nil];
    
    // configure table style
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    // top gap
    self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 120, 20)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_menuList count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // load cell
    PDMenuItemViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PDMenuItemCell" forIndexPath:indexPath];
    
    // load item
    PDMenuItem *menuItem = (PDMenuItem*)[_menuList objectAtIndex:indexPath.row];
    
    // configure cell
    cell.iconView.image = [UIImage imageNamed:menuItem.icon];
    cell.titleLabel.text = menuItem.title;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    // cell height
    return 100.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // load item
    PDMenuItem *item = (PDMenuItem*)[_menuList objectAtIndex:indexPath.row];
    
    // notify
    [_delegate didSelectItem:item.key];
}

- (void)selectItem:(NSInteger)row {
    // select item cell
    dispatch_async(dispatch_get_main_queue(), ^{
        NSIndexPath *path = [NSIndexPath indexPathForRow:0 inSection:0];
        UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:path];
        [self.tableView selectRowAtIndexPath:path animated:NO scrollPosition:UITableViewScrollPositionTop];
        [cell setSelected:YES];
    });
}

@end
