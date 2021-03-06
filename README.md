# TBSTableView
Subclass of NSTableView with auto _sort descriptor saving/loading + handle delete/return keys properly._

### Sort Descriptors

It will automatically save and load the sort descriptors for the table, provided that the **uniqueIdentifier** is set

If you'd like to have it use a default sort descriptor if nothing is saved (ex: the first time the app is launched), set the **defaultSortDescriptor** property.

Here's an example of how to use it assuming the table NSArrayController objects have the key **dueDate** and are NSDate objects which implement the **compare:** selector.

```
tableView.uniqueIdentifier = @"myUniqueIDForThisTable";
tableView.defaultSortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"dueDate" ascending:YES selector:@selector(compare:)];
```

### Delete & Return Keys

This custom class will catch keydown events for the Delete, Return and Enter keys. For the Delete key it will call the selector **deleteAction:** and for the Return/Enter keys it will call **editAction:**. It will go through the responder chain until someone responds to these selectors. The signature for both methods is **void deleteAction:(id)sender**, just like an IBAction.


That's it! Now the table will automatically have the sort descriptor(s) that the user has setup.
