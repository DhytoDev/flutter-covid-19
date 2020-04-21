import 'package:core/error.dart';
import 'package:core/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/model/cases.dart';
import 'package:domain/repositories/cases_repository.dart';

class GetCovid19GlobalCasesUseCase implements UseCase<Case, NoParams> {
  final CasesRepository repository;

  GetCovid19GlobalCasesUseCase(this.repository);

  @override
  Future<Either<Failure, Case>> execute(NoParams params) =>
      repository.getCovid19GlobalCases();
}
