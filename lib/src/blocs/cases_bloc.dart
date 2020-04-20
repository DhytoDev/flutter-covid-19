import 'package:core/resource_state.dart';
import 'package:core/usecase.dart';
import 'package:domain/model/cases.dart';
import 'package:domain/usecases/get_covid19_global_cases_usecase.dart';
import 'package:rxdart/rxdart.dart';

class CasesBloc {
  final GetCovid19GlobalCasesUseCase useCase;

  final _casesSubject = BehaviorSubject<Resource<Cases>>();

  Stream<Resource<Cases>> get globalCases => _casesSubject.stream;

  CasesBloc(this.useCase) {
    getGlobalCases();
  }

  void dispose() {
    _casesSubject.close();
  }

  void getGlobalCases() {
    _casesSubject.sink.add(Resource(resourceState: ResourceState.LOADING));
    useCase.execute(NoParams()).then((result) {
      result.fold(
          (failure) => _casesSubject.sink.add(Resource(
              resourceState: ResourceState.ERROR, message: failure.toString())),
          (cases) => _casesSubject.sink.add(
              Resource(resourceState: ResourceState.SUCCESS, data: cases)));
    });
  }
}
