//
//  ActivityMenuViewController.m
//  dunno-ipad
//
//  Created by Wanderley Miyata on 9/2/14.
//  Copyright (c) 2014 BlueScreen Sistemas. All rights reserved.
//

#import "PDActivityMenuViewController.h"

@interface PDActivityMenuViewController ()

@property (nonatomic, strong) NSMutableArray *optionList;

@end

@implementation PDActivityMenuViewController

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

    //TODO: definir ações
    // initialize activity menu options
    _optionList = [[NSMutableArray alloc] initWithObjects:@"Ver detalhes", @"Inserir na timeline", @"Enviar para dia", @"Editar tarefa", @"Apagar tarefa", nil];
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
    // menu options item count
    return [_optionList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // load cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PDActivityMenuCell" forIndexPath:indexPath];
    
    // configure cell
    cell.textLabel.text = [_optionList objectAtIndex:indexPath.row];
    
    return cell;
}

@end
