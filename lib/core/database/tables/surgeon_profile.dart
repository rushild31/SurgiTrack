import 'package:drift/drift.dart';

@DataClassName('SurgeonProfileData')
class SurgeonProfile extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();

  TextColumn get email => text().nullable()();

  TextColumn get phone => text().nullable()();

  TextColumn get profilePhotoPath => text().nullable()();

  TextColumn get qualification => text().nullable()();

  TextColumn get specialty => text().nullable()();

  TextColumn get department => text().nullable()();

  TextColumn get institution => text().nullable()();

  TextColumn get trainingYear => text().nullable()();

  DateTimeColumn get residencyStartDate => dateTime().nullable()();

  DateTimeColumn get residencyEndDate => dateTime().nullable()();

  TextColumn get registrationNumber => text().nullable()();

  TextColumn get memberships => text().nullable()();

  DateTimeColumn get createdAt => dateTime()();

  DateTimeColumn get updatedAt => dateTime()();
}
