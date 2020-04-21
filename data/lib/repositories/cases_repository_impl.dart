import 'package:core/error.dart';
import 'package:dartz/dartz.dart';
import 'package:data/datasources/cases_local_data_source.dart';
import 'package:data/datasources/cases_network_data_source.dart';
import 'package:data/network/network_info.dart';
import 'package:domain/model/cases.dart';
import 'package:domain/repositories/cases_repository.dart';

class CasesRepositoryImpl implements CasesRepository {
  final CasesNetworkDataSource remote;
  final CasesLocalDataSource local;
  final NetworkInfo networkInfo;

  CasesRepositoryImpl(this.remote, this.local, this.networkInfo);

  @override
  Future<Either<Failure, Case>> getCovid19GlobalCases() async {

    if (await networkInfo.isConnected) {
      try {
        final cases = await remote.getCovid19GlobalCases();
        local.insertCase(cases.toCase());

        return Right(cases.toCase());
      } on NetworkException {
        return Left(NetworkFailure());
      }
    } else {
      try {
        final cases = await local.getCases();

        return Right(cases[0]);
      } on NetworkException {
        return Left(CacheFailure());
      }
    }
  }
}
