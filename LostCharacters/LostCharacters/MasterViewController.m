#import "MasterViewController.h"


@interface MasterViewController() <UITableViewDataSource>
@property  (nonatomic) NSArray *Lost;

@end


@implementation MasterViewController

- (void)viewDidLoad
{
    [self load];
    [self createCharacterObject];
}
-(void)load
{
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Lost"];
    NSSortDescriptor *sortDescriptor1 = [[NSSortDescriptor alloc] initWithKey:@"actor" ascending:YES];
    NSSortDescriptor *sortDescriptor2 = [[NSSortDescriptor alloc] initWithKey:@"passenger" ascending:NO];
    request.sortDescriptors = [NSArray arrayWithObjects:sortDescriptor1, sortDescriptor2, nil];
    //request.predicate = predicate;
    self.Lost = [self.managedObjectContext executeFetchRequest:request error:nil];
    [self.tableView reloadData];

}

- (void)createCharacterObject
{
    NSManagedObject *character1 = [NSEntityDescription insertNewObjectForEntityForName:@"Lost" inManagedObjectContext:self.managedObjectContext];

    [character1 setValue:@"Matthew Fox" forKey:@"actor"];
    [character1 setValue:@"Jack Shepard" forKey:@"passenger"];
    [self.managedObjectContext save:nil];

    NSManagedObject *character2 = [NSEntityDescription insertNewObjectForEntityForName:@"Lost" inManagedObjectContext:self.managedObjectContext];

    [character2 setValue:@"Evaneline Lilly" forKey:@"actor"];
    [character2 setValue:@"Kate Austen" forKey:@"passenger"];
    [self.managedObjectContext save:nil];

    NSManagedObject *character3 = [NSEntityDescription insertNewObjectForEntityForName:@"Lost" inManagedObjectContext:self.managedObjectContext];

    [character3 setValue:@"Jorge Garcia" forKey:@"actor"];
    [character3 setValue:@"Hugh 'Hurley' Reyes" forKey:@"passenger"];
    [self.managedObjectContext save:nil];
    [self load];

}

#pragma mark - Tableview DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.Lost.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath

{
    NSManagedObject *Lost = [self.Lost objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];

    cell.textLabel.text = [Lost valueForKey:@"actor"];
    cell.detailTextLabel.text = [Lost valueForKey:@"passenger"];
    return cell;
}


@end