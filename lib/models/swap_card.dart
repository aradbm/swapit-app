
// SwapCards
// -
// CardID int PK
// UserID-H1 int FK >- Users.UserID 
// UserID-H2 int  FK >- Users.UserID 
// UserID-H3 int  FK >- Users.UserID NULL
// BP_Item1 int  FK >- BackpackItems.ItemID   
// BP_Item2 int  FK >- BackpackItems.ItemID 
// BP_Item3 int  FK >- BackpackItems.ItemID NULL
// User1Interested bool NULL
// User2Interested bool NULL
// User3Interested bool NULL
// SwapDate dateTime default=GETUTCDATE()