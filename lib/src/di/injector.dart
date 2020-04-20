import 'package:data/datasources/cases_network_data_source.dart';
import 'package:data/repositories/cases_repository_impl.dart';
import 'package:domain/repositories/cases_repository.dart';
import 'package:domain/usecases/get_covid19_global_cases_usecase.dart';
import 'package:flutter_covid19/src/blocs/cases_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> injectDependencies() async {
  // Data sources
  getIt.registerLazySingleton<CasesNetworkDataSource>(
      () => CasesNetworkDataSourceImpl());

  // Repositories
  getIt.registerLazySingleton<CasesRepository>(
      () => CasesRepositoryImpl(getIt()));

  // Use cases
  getIt.registerLazySingleton(() => GetCovid19GlobalCasesUseCase(getIt()));

  // Blocs
  getIt.registerFactory(() => CasesBloc(getIt()));
}
