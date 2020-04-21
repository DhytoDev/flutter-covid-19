import 'package:data/local/dao/cases_dao.dart';
import 'package:data/local/entities/case_entity.dart';
import 'package:domain/model/cases.dart';

abstract class CasesLocalDataSource {
  Future<int> insertCase(Case cases);

  Future<List<Case>> getCases();
}

class CasesLocalDataSourceImpl implements CasesLocalDataSource {
  final CasesDao caseDao;

  CasesLocalDataSourceImpl(this.caseDao);

  @override
  Future<List<Case>> getCases() async {
    final cases = await caseDao.getAllCases();

    return cases.map((caseEntity) => Cases.toCase(caseEntity)).toList();
  }

  @override
  Future<int> insertCase(Case cases) async =>
      caseDao.insertCase(Cases.toCaseCompanion(cases));
}
