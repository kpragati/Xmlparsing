//
//  ShowTableViewController.h
//  Xml00prac
//
//  Created by Student-002 on 09/03/17.
//  Copyright © 2017 Felix-its-com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "add.h"

@interface ShowTableViewController : UITableViewController<NSXMLParserDelegate>

@property(nonatomic,retain)NSMutableArray * temparr;
@property(nonatomic,retain)NSXMLParser * par;
@property(nonatomic,retain)add *a;
@property(nonatomic,retain)NSMutableString * str;

@end
