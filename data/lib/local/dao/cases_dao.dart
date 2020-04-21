
import 'package:data/local/database/database.dart';
import 'package:data/local/entities/case_entity.dart';
import 'package:moor/moor.dart';

part 'cases_dao.g.dart';

@UseDao(tables: [Cases])
class CasesDao extends DatabaseAccessor<CovidDatabase> with _$CasesDaoMixin {
  CasesDao(CovidDatabase db) : super(db);

  Future<List<CaseEntity>> getAllCases() => select(cases).get();

  Future<int> insertCase(CasesCompanion entry) => into(cases).insert(entry, orReplace: true);

}