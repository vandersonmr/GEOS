DatabaseManager *DB1;
DatabaseManager *DB2;

TEST(DatabaseManager, constructors) {
  ASSERT_DEATH(new DatabaseManager("FileThatDoesntExist"),
      ".*Impossible to open the database file\\..*");

  DB1 = new DatabaseManager("db1");  
  DB2 = new DatabaseManager("db2");  
}

TEST(DatabaseManager, size) {
  ASSERT_EQ(DB1->size(), 2022);
  ASSERT_EQ(DB2->size(), 3598);
}

TEST(DatabaseManager, getTime) {
  BBHash Hash1(
      "11-0-0-0-0-0-1-1-2-0-1-3-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0");
  BBHash Hash2(
      "32-2-0-1-1-0-0-0-0-0-3-0-0-0-0-0-0-0-0-0-0-1-0-1-0-2-0-0-1-1-0-0-0-0-0");
   
  ASSERT_EQ(DB1->getTime(Hash1), 41);
  ASSERT_EQ(DB2->getTime(Hash2), 61.5);

  ASSERT_EQ(DB1->getTime(Hash2), 61.5);
  ASSERT_EQ(DB2->getTime(Hash1), 0);
}

TEST(DatabaseManager, hasHash) {
  BBHash Hash1(
      "11-0-0-0-0-0-1-1-2-0-1-3-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0");
  BBHash Hash2(
      "32-2-0-1-1-0-0-0-0-0-3-0-0-0-0-0-0-0-0-0-0-1-0-1-0-2-0-0-1-1-0-0-0-0-0");
  BBHash Hash3(
      "11-2-0-1-1-0-0-0-0-0-3-0-0-0-0-0-0-0-0-0-0-1-0-1-0-2-0-0-1-1-0-0-0-0-0");

  ASSERT_TRUE(DB1->hasHash(Hash1));
  ASSERT_FALSE(DB2->hasHash(Hash1));

  ASSERT_TRUE(DB1->hasHash(Hash2));
  ASSERT_TRUE(DB2->hasHash(Hash2));

  ASSERT_FALSE(DB1->hasHash(Hash3));
  ASSERT_FALSE(DB2->hasHash(Hash3));
}

TEST(DatabaseManager, getNearest) {
  BBHash Hash1(
      "11-0-0-0-0-0-1-1-2-0-1-3-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0");
  BBHash Hash2(
      "32-2-0-1-1-0-0-0-0-0-3-0-0-0-0-0-0-0-0-0-0-1-0-1-0-2-0-0-1-1-0-0-0-0-0");
  BBHash Hash3(
      "11-2-0-1-1-0-0-0-0-0-3-0-0-0-0-0-0-0-0-0-0-1-0-1-0-2-0-0-1-1-0-0-0-0-0");

  ASSERT_EQ(*(DB1->getNearest(Hash1)), Hash1);

  ASSERT_EQ(*(DB1->getNearest(Hash2)), Hash2);
  ASSERT_EQ(*(DB2->getNearest(Hash2)), Hash2);

  ASSERT_FALSE((*(DB1->getNearest(Hash3))) == Hash3);
  ASSERT_FALSE((*(DB2->getNearest(Hash3))) == Hash3);
}

TEST(DatabaseManager, unionWith) {
  DatabaseManager DB("db1");  
  
  DB.unionWith(*DB1);
  ASSERT_EQ(DB.size(), 2022);

  DB.unionWith(*DB2);
  ASSERT_EQ(DB.size(), 5045);

  for (auto Elem : *DB2) {
    if(!DB.hasHash(Elem.first))
      ASSERT_TRUE(DB.hasHash(Elem.first));
  }
}

TEST(DatabaseManager, insert) {
  BBHash
    H1("11-2-0-1-1-0-0-0-0-0-3-0-0-0-0-0-0-0-0-0-0-1-0-1-0-2-0-0-1-1-0-0-0-0-0");

  ASSERT_DEATH(DB1->insert(H1, -1), 
      ".*Cannot insert in the database a negative value\\..*"); 

  int OldSize = DB1->size();

  DB1->insert(H1, 10);
  ASSERT_EQ(DB1->size(), OldSize + 1);

  DB1->insert(H1, 20);
  ASSERT_EQ(DB1->getTime(H1), 15);
}
