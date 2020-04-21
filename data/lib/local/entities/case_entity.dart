import 'package:data/local/database/database.dart';
import 'package:domain/model/cases.dart';
import 'package:moor/moor.dart';

@DataClassName('CaseEntity')
class Cases extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get confirmed => integer()();

  IntColumn get deaths => integer()();

  IntColumn get recovered => integer()();

  TextColumn get lastUpdate => text()();

  @override
  Set<Column> get primaryKey => {id};

  static Case toCase(CaseEntity caseEntity) => Case(caseEntity.confirmed,
      caseEntity.deaths, caseEntity.recovered, caseEntity.lastUpdate);

  static CasesCompanion toCaseCompanion(Case cases) => CasesCompanion.insert(
      confirmed: cases.confirmed,
      deaths: cases.deaths,
      recovered: cases.recovered,
      lastUpdate: cases.lastUpdate);
}
