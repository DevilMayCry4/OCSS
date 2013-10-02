//
//  DEMOStyleListViewController.m
//  OCSS-Demo
//
//  Created by Yusuke Kawasaki on 2013/10/01.
//  Copyright (c) 2013 Kawanet. All rights reserved.
//

#import "DEMOStyleListViewController.h"
#import "DEMODeclarationViewController.h"

@interface DEMOStyleListViewController ()

@end

@implementation DEMOStyleListViewController {
    NSArray *_list;
    OCSS *_css;
}

static NSMutableDictionary *_cache;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *path = self.url.absoluteURL.lastPathComponent;
    self.navigationItem.title = path;
    
    if (!_cache) _cache = NSMutableDictionary.new;
    _css = _cache[self.url.absoluteString];
    if (!_css) {
        _css = [[OCSS alloc] initWithContentsOfURL:self.url];
        _cache[self.url.absoluteString] = _css;
    }
    
    NSMutableArray *array = NSMutableArray.new;
    
    for(OCSSStyleSheet *styleSheet in _css.document.styleSheets) {
        for(OCSSStyleRule *rule in styleSheet.cssRules) {
            if (![rule isKindOfClass:[OCSSStyleRule class]]) continue;
            [array addObject:rule];
        }
    }
    
    _list = array;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _list.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    OCSSStyleRule *rule = _list[indexPath.row];
    cell.textLabel.text = rule.selectorText;
    cell.detailTextLabel.text = rule.style.cssText;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DEMODeclarationViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"DEMODeclarationViewController"];
    
    vc.css = _css;
    OCSSStyleRule *rule = _list[indexPath.row];
    vc.selector = rule.selectorText;
    
    [self.navigationController pushViewController:vc animated:YES];
}

@end
