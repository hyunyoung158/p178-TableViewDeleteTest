//
//  ViewController.m
//  TableViewDeleteTest
//
//  Created by SDT-1 on 2014. 1. 6..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"
#define CELL_ID @"CELL_ID"
@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation ViewController {
    NSMutableArray *data;
}

//밀어서 셀 삭제
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    //data 삭제
    [data removeObjectAtIndex:indexPath.row];
    //table cell 삭제
//    NSArray *rows = [NSArray arrayWithObject:indexPath];
    NSArray *rows = @[indexPath];
    [tableView deleteRowsAtIndexPaths:rows withRowAnimation:UITableViewRowAnimationAutomatic];
}

//셀 개수
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [data count];
}

//셀 생성하기, dynamic prototypes 방식 사용
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_ID forIndexPath:indexPath];
    
    cell.textLabel.text = [data objectAtIndex:indexPath.row];
    return cell;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
//    data = @[@"a", @"b", @"c", @"d", @"e", @"f", @"g"];
    data = [[NSMutableArray alloc] initWithObjects:@"a", @"b", @"c", @"d", @"e", @"f", @"g", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
