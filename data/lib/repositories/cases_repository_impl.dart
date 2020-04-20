import 'package:core/error.dart';
import 'package:dartz/dartz.dart';
import 'package:data/datasources/cases_network_data_source.dart';
import 'package:domain/model/cases.dart';
import 'package:domain/repositories/cases_repository.dart';

class CasesRepositoryImpl implements CasesRepository {
  final CasesNetworkDataSource remote;

  CasesRepositoryImpl(this.remote);

  @override
  Future<Either<Failure, Cases>> getCovid19GlobalCases() async {
    try {
      final response = await remote.getCovid19GlobalCases();

      return Right(response.toCases());
    } on NetworkException {
      return Left(NetworkFailure());
    }
  }
}
