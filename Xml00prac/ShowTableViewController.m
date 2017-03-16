//
//  ShowTableViewController.m
//  Xml00prac
//
//  Created by Student-002 on 09/03/17.
//  Copyright © 2017 Felix-its-com. All rights reserved.
//

#import "ShowTableViewController.h"
#import "CustomTableViewCell.h"
#import "add.h"

@interface ShowTableViewController ()

@end

@implementation ShowTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _temparr=[[NSMutableArray alloc]init];
    
    [self.tableView registerNib:[UINib nibWithNibName: @"CustomTableViewCell" bundle: nil] forCellReuseIdentifier: @"cell"];
    
    _par=[[NSXMLParser alloc]initWithContentsOfURL:[NSURL URLWithString:@"https://www.w3schools.com/xml/plant_catalog.xml"]];
    _par.delegate=self;
    [_par parse];
    
    
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
 
    return _temparr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"cell" forIndexPath:indexPath];
    
    add * c=[_temparr objectAtIndex: indexPath.row];
    
    cell.lbl1.text=c.common;
    cell.lbl2.text=c.botanical;
    return cell;
}
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict{
    if ([elementName isEqualToString:@"PLANT"]) {
        _a=[[add alloc]init];
    }if ([elementName isEqualToString:@"COMMON"]) {
        _str=_a.common;
    }if ([elementName isEqualToString: @"botanical"]) {
        _str=_a.botanical;
    }
    
}
-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    
    [_str appendString: string];
    
}
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    if ([elementName isEqualToString:@"COMMON"]) {
        _a.common=_str;
    }if ([elementName isEqualToString:@"botanical"]) {
        _a.botanical=_str;
    }if ([elementName isEqualToString: @"plant"]) {
        [_temparr addObject: _str];
        NSLog(@"%@",_temparr);
        _str=nil;
    }
    
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
