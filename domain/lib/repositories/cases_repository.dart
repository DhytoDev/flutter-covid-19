import 'package:core/error.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/model/cases.dart';

abstract class CasesRepository {
  Future<Either<Failure, Case>> getCovid19GlobalCases();
}