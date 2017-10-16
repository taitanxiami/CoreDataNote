//
//  ViewController.m
//  CoreDataNote
//
//  Created by taitanxiami on 2017/10/15.
//  Copyright © 2017年 taitanxiami. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "Clothes+CoreDataProperties.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *dataSource;

@property (strong, nonatomic) AppDelegate *myDelegate;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataSource= @[].mutableCopy;
    self.myDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    [self fetchData];
}
- (void)fetchData {
    
    NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:@"Clothes"];
    NSArray *data =  [self.myDelegate.persistentContainer.viewContext executeFetchRequest:req error:nil];
    NSSortDescriptor *sort = [[NSSortDescriptor alloc]initWithKey:@"price" ascending:YES];
    req.sortDescriptors = @[sort];
    [self.dataSource addObjectsFromArray:data];
    [self.tableView reloadData];
    
    
    
}


#pragma mark ====================  Core data insert data ====================
- (IBAction)addItem:(id)sender {
    
    NSEntityDescription *des = [NSEntityDescription entityForName:@"Clothes" inManagedObjectContext:self.myDelegate.persistentContainer.viewContext];
    Clothes *cloth = [[Clothes alloc]initWithEntity:des insertIntoManagedObjectContext:self.myDelegate.persistentContainer.viewContext];
//    Clothes *cloth  = [NSEntityDescription insertNewObjectForEntityForName:@"Clothes" inManagedObjectContext:self.myDelegate.managerObjecrContext];
    cloth.name = @"Nike";
    
    cloth.price = arc4random() % 1000 + 1;
    
    [self.dataSource addObject:cloth];
    
    NSIndexPath *idx = [NSIndexPath indexPathForRow:self.dataSource.count-1 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[idx] withRowAnimation:UITableViewRowAnimationLeft];
    [self.myDelegate saveContext];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataSource.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    
    Clothes *cloth = self.dataSource[indexPath.row];
    cell.textLabel.text = cloth.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%ld",cloth.price];
    return cell;
}

#pragma mark ====================  Core data delete data ====================
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        Clothes *delCloth = self.dataSource[indexPath.row];
        //删除数据源
        [self.dataSource removeObject:delCloth];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        [self.myDelegate.persistentContainer.viewContext deleteObject:delCloth];
        [self.myDelegate saveContext];
    }
}
#pragma mark ====================  Core Data Update Data ====================
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Clothes *updateCloth = self.dataSource[indexPath.row];
    updateCloth.name = @"Fersh";
    
    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    [self.myDelegate saveContext];
}






@end
