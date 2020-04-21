import 'dart:io';

import 'package:data/local/entities/case_entity.dart';
import 'package:moor/moor.dart';
import 'package:moor_ffi/moor_ffi.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

@UseMoor(tables: [Cases], daos: [])
class CovidDatabase extends _$CovidDatabase {
  CovidDatabase(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 1;
}

CovidDatabase constructDb({bool logStatements = true}) {
  final executor = LazyDatabase(() async {
    final dataDir = await getApplicationDocumentsDirectory();
    final dbFile = File(join(dataDir.path, "covid_19.sqlite"));

    return VmDatabase(dbFile, logStatements: logStatements);
  });

  return CovidDatabase(executor);
}
