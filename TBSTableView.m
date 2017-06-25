//
//  TBSTableView.m
//
//  Created by Matt Austin on 2017-03-02.
//  Copyright (c) 2017 Tunabelly Software Inc. All rights reserved.
//

#import "TBSTableView.h"

@interface TBSTableView ()

- (void)loadAndSetSortDescriptors;
- (void)saveSortDescriptors;

@end

@implementation TBSTableView

- (void)keyDown:(NSEvent *)theEvent
{
	// handle delete
	unichar key = [[theEvent charactersIgnoringModifiers] characterAtIndex:0];
	if (key == NSDeleteCharacter && self.selectedRow != -1) {
		[NSApp sendAction:@selector(delete:) to:nil from:self];
	}
	else {
		[super keyDown:theEvent];
	}
}

- (void)viewWillMoveToWindow:(nullable NSWindow *)newWindow
{
	[super viewWillMoveToWindow:newWindow];

	// only do the load/save if there is a unique ID that's been set
	if (self.uniqueIdentifier != nil)
	{
		if (newWindow != nil)
		{
			// window it about to be shown
			[self loadAndSetSortDescriptors];
		}
		else
		{
			// window is closing
			[self saveSortDescriptors];
		}
	}
}

#pragma mark - Loading/Saving Sort Descriptors

- (void)loadAndSetSortDescriptors
{
	NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
	
	// check if there's a stored sort descriptors
	NSArray *sortDescriptors = nil;
	NSData *storedData = [userDefaults objectForKey:self.uniqueIdentifier];
	if (storedData != nil)
	{
		// load the stored sort descriptors
		sortDescriptors = [NSUnarchiver unarchiveObjectWithData:storedData];
	}
	else
	{
		// use the default one
		if (self.defaultSortDescriptor != nil) {
			sortDescriptors = @[self.defaultSortDescriptor];
		}
	}

	// set the sort descriptors
	[self setSortDescriptors:sortDescriptors];
}

- (void)saveSortDescriptors
{
	NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
	
	// save the table sort descriptors
	NSData *storedData = [NSArchiver archivedDataWithRootObject:[self sortDescriptors]];
	
	[userDefaults setObject:storedData forKey:self.uniqueIdentifier];
	[userDefaults synchronize];
}

@end
