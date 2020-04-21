import 'package:moor/moor.dart';

@DataClassName('CaseEntity')
class Cases extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get confirmed => integer()();
  IntColumn get deaths => integer()();
  IntColumn get recovered => integer()();
  TextColumn get lastUpdate => text()();
}