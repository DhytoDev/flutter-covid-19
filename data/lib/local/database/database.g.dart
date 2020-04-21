// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class CaseEntity extends DataClass implements Insertable<CaseEntity> {
  final int id;
  final int confirmed;
  final int deaths;
  final int recovered;
  final String lastUpdate;
  CaseEntity(
      {@required this.id,
      @required this.confirmed,
      @required this.deaths,
      @required this.recovered,
      @required this.lastUpdate});
  factory CaseEntity.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return CaseEntity(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      confirmed:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}confirmed']),
      deaths: intType.mapFromDatabaseResponse(data['${effectivePrefix}deaths']),
      recovered:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}recovered']),
      lastUpdate: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}last_update']),
    );
  }
  factory CaseEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return CaseEntity(
      id: serializer.fromJson<int>(json['id']),
      confirmed: serializer.fromJson<int>(json['confirmed']),
      deaths: serializer.fromJson<int>(json['deaths']),
      recovered: serializer.fromJson<int>(json['recovered']),
      lastUpdate: serializer.fromJson<String>(json['lastUpdate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'confirmed': serializer.toJson<int>(confirmed),
      'deaths': serializer.toJson<int>(deaths),
      'recovered': serializer.toJson<int>(recovered),
      'lastUpdate': serializer.toJson<String>(lastUpdate),
    };
  }

  @override
  CasesCompanion createCompanion(bool nullToAbsent) {
    return CasesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      confirmed: confirmed == null && nullToAbsent
          ? const Value.absent()
          : Value(confirmed),
      deaths:
          deaths == null && nullToAbsent ? const Value.absent() : Value(deaths),
      recovered: recovered == null && nullToAbsent
          ? const Value.absent()
          : Value(recovered),
      lastUpdate: lastUpdate == null && nullToAbsent
          ? const Value.absent()
          : Value(lastUpdate),
    );
  }

  CaseEntity copyWith(
          {int id,
          int confirmed,
          int deaths,
          int recovered,
          String lastUpdate}) =>
      CaseEntity(
        id: id ?? this.id,
        confirmed: confirmed ?? this.confirmed,
        deaths: deaths ?? this.deaths,
        recovered: recovered ?? this.recovered,
        lastUpdate: lastUpdate ?? this.lastUpdate,
      );
  @override
  String toString() {
    return (StringBuffer('CaseEntity(')
          ..write('id: $id, ')
          ..write('confirmed: $confirmed, ')
          ..write('deaths: $deaths, ')
          ..write('recovered: $recovered, ')
          ..write('lastUpdate: $lastUpdate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          confirmed.hashCode,
          $mrjc(deaths.hashCode,
              $mrjc(recovered.hashCode, lastUpdate.hashCode)))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is CaseEntity &&
          other.id == this.id &&
          other.confirmed == this.confirmed &&
          other.deaths == this.deaths &&
          other.recovered == this.recovered &&
          other.lastUpdate == this.lastUpdate);
}

class CasesCompanion extends UpdateCompanion<CaseEntity> {
  final Value<int> id;
  final Value<int> confirmed;
  final Value<int> deaths;
  final Value<int> recovered;
  final Value<String> lastUpdate;
  const CasesCompanion({
    this.id = const Value.absent(),
    this.confirmed = const Value.absent(),
    this.deaths = const Value.absent(),
    this.recovered = const Value.absent(),
    this.lastUpdate = const Value.absent(),
  });
  CasesCompanion.insert({
    this.id = const Value.absent(),
    @required int confirmed,
    @required int deaths,
    @required int recovered,
    @required String lastUpdate,
  })  : confirmed = Value(confirmed),
        deaths = Value(deaths),
        recovered = Value(recovered),
        lastUpdate = Value(lastUpdate);
  CasesCompanion copyWith(
      {Value<int> id,
      Value<int> confirmed,
      Value<int> deaths,
      Value<int> recovered,
      Value<String> lastUpdate}) {
    return CasesCompanion(
      id: id ?? this.id,
      confirmed: confirmed ?? this.confirmed,
      deaths: deaths ?? this.deaths,
      recovered: recovered ?? this.recovered,
      lastUpdate: lastUpdate ?? this.lastUpdate,
    );
  }
}

class $CasesTable extends Cases with TableInfo<$CasesTable, CaseEntity> {
  final GeneratedDatabase _db;
  final String _alias;
  $CasesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _confirmedMeta = const VerificationMeta('confirmed');
  GeneratedIntColumn _confirmed;
  @override
  GeneratedIntColumn get confirmed => _confirmed ??= _constructConfirmed();
  GeneratedIntColumn _constructConfirmed() {
    return GeneratedIntColumn(
      'confirmed',
      $tableName,
      false,
    );
  }

  final VerificationMeta _deathsMeta = const VerificationMeta('deaths');
  GeneratedIntColumn _deaths;
  @override
  GeneratedIntColumn get deaths => _deaths ??= _constructDeaths();
  GeneratedIntColumn _constructDeaths() {
    return GeneratedIntColumn(
      'deaths',
      $tableName,
      false,
    );
  }

  final VerificationMeta _recoveredMeta = const VerificationMeta('recovered');
  GeneratedIntColumn _recovered;
  @override
  GeneratedIntColumn get recovered => _recovered ??= _constructRecovered();
  GeneratedIntColumn _constructRecovered() {
    return GeneratedIntColumn(
      'recovered',
      $tableName,
      false,
    );
  }

  final VerificationMeta _lastUpdateMeta = const VerificationMeta('lastUpdate');
  GeneratedTextColumn _lastUpdate;
  @override
  GeneratedTextColumn get lastUpdate => _lastUpdate ??= _constructLastUpdate();
  GeneratedTextColumn _constructLastUpdate() {
    return GeneratedTextColumn(
      'last_update',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, confirmed, deaths, recovered, lastUpdate];
  @override
  $CasesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'cases';
  @override
  final String actualTableName = 'cases';
  @override
  VerificationContext validateIntegrity(CasesCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    }
    if (d.confirmed.present) {
      context.handle(_confirmedMeta,
          confirmed.isAcceptableValue(d.confirmed.value, _confirmedMeta));
    } else if (isInserting) {
      context.missing(_confirmedMeta);
    }
    if (d.deaths.present) {
      context.handle(
          _deathsMeta, deaths.isAcceptableValue(d.deaths.value, _deathsMeta));
    } else if (isInserting) {
      context.missing(_deathsMeta);
    }
    if (d.recovered.present) {
      context.handle(_recoveredMeta,
          recovered.isAcceptableValue(d.recovered.value, _recoveredMeta));
    } else if (isInserting) {
      context.missing(_recoveredMeta);
    }
    if (d.lastUpdate.present) {
      context.handle(_lastUpdateMeta,
          lastUpdate.isAcceptableValue(d.lastUpdate.value, _lastUpdateMeta));
    } else if (isInserting) {
      context.missing(_lastUpdateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CaseEntity map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return CaseEntity.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(CasesCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.confirmed.present) {
      map['confirmed'] = Variable<int, IntType>(d.confirmed.value);
    }
    if (d.deaths.present) {
      map['deaths'] = Variable<int, IntType>(d.deaths.value);
    }
    if (d.recovered.present) {
      map['recovered'] = Variable<int, IntType>(d.recovered.value);
    }
    if (d.lastUpdate.present) {
      map['last_update'] = Variable<String, StringType>(d.lastUpdate.value);
    }
    return map;
  }

  @override
  $CasesTable createAlias(String alias) {
    return $CasesTable(_db, alias);
  }
}

abstract class _$CovidDatabase extends GeneratedDatabase {
  _$CovidDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $CasesTable _cases;
  $CasesTable get cases => _cases ??= $CasesTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [cases];
}
