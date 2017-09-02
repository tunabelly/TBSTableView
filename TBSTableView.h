//
//  TBSTableView.h
//
//  Created by Matt Austin on 2017-03-02.
//  Copyright (c) 2017 Tunabelly Software Inc. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface TBSTableView : NSTableView

@property NSString *uniqueIdentifier;
@property NSSortDescriptor *defaultSortDescriptor;
@property NSString *printJobTitle;

@end
