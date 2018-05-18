# TBSTableView
Subclass of NSTableView with auto _sort descriptor saving/loading + handle delete key properly._

It will automatically save and load the sort descriptors for the table, provided that the **uniqueIdentifier** is set

If you'd like to have it use a default sort descriptor if nothing is saved (ex: the first time the app is launched), set the **defaultSortDescriptor** property.

Here's an example of how to use it assuming the table NSArrayController objects have the key **dueDate** and are NSDate objects which implement the **compare:** selector.

```
tableView.uniqueIdentifier = @"myUniqueIDForThisTable";
tableView.defaultSortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"dueDate" ascending:YES selector:@selector(compare:)];
```

That's it! Now the table will automatically have the sort descriptor(s) that the user has setup.
