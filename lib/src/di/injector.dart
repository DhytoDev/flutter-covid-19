import 'package:data/datasources/cases_local_data_source.dart';
import 'package:data/datasources/cases_network_data_source.dart';
import 'package:data/local/dao/cases_dao.dart';
import 'package:data/local/database/database.dart';
import 'package:data/network/network_info.dart';
import 'package:data/repositories/cases_repository_impl.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:domain/repositories/cases_repository.dart';
import 'package:domain/usecases/get_covid19_global_cases_usecase.dart';
import 'package:flutter_covid19/src/blocs/cases_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> injectDependencies() async {
  // Network Info
  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(DataConnectionChecker()));

  // Databases
  getIt.registerLazySingleton<CovidDatabase>(() => constructDb());
  getIt.registerLazySingleton(() => CasesDao(getIt()));

  // Data sources
  getIt.registerLazySingleton<CasesNetworkDataSource>(
      () => CasesNetworkDataSourceImpl());
  getIt.registerLazySingleton<CasesLocalDataSource>(() => CasesLocalDataSourceImpl(getIt()));

  // Repositories
  getIt.registerLazySingleton<CasesRepository>(
      () => CasesRepositoryImpl(getIt(), getIt(), getIt()));

  // Use cases
  getIt.registerLazySingleton(() => GetCovid19GlobalCasesUseCase(getIt()));

  // Blocs
  getIt.registerFactory(() => CasesBloc(getIt()));
}
