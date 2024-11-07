// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expected_task_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetExpectedTaskCollectionCollection on Isar {
  IsarCollection<ExpectedTaskCollection> get expectedTaskCollections =>
      this.collection();
}

const ExpectedTaskCollectionSchema = CollectionSchema(
  name: r'ExpectedTaskCollection',
  id: 6716406469448073602,
  properties: {
    r'remoteTaskId': PropertySchema(
      id: 0,
      name: r'remoteTaskId',
      type: IsarType.string,
    )
  },
  estimateSize: _expectedTaskCollectionEstimateSize,
  serialize: _expectedTaskCollectionSerialize,
  deserialize: _expectedTaskCollectionDeserialize,
  deserializeProp: _expectedTaskCollectionDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _expectedTaskCollectionGetId,
  getLinks: _expectedTaskCollectionGetLinks,
  attach: _expectedTaskCollectionAttach,
  version: '3.1.0+1',
);

int _expectedTaskCollectionEstimateSize(
  ExpectedTaskCollection object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.remoteTaskId.length * 3;
  return bytesCount;
}

void _expectedTaskCollectionSerialize(
  ExpectedTaskCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.remoteTaskId);
}

ExpectedTaskCollection _expectedTaskCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ExpectedTaskCollection();
  object.id = id;
  object.remoteTaskId = reader.readString(offsets[0]);
  return object;
}

P _expectedTaskCollectionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _expectedTaskCollectionGetId(ExpectedTaskCollection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _expectedTaskCollectionGetLinks(
    ExpectedTaskCollection object) {
  return [];
}

void _expectedTaskCollectionAttach(
    IsarCollection<dynamic> col, Id id, ExpectedTaskCollection object) {
  object.id = id;
}

extension ExpectedTaskCollectionQueryWhereSort
    on QueryBuilder<ExpectedTaskCollection, ExpectedTaskCollection, QWhere> {
  QueryBuilder<ExpectedTaskCollection, ExpectedTaskCollection, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ExpectedTaskCollectionQueryWhere on QueryBuilder<
    ExpectedTaskCollection, ExpectedTaskCollection, QWhereClause> {
  QueryBuilder<ExpectedTaskCollection, ExpectedTaskCollection,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ExpectedTaskCollection, ExpectedTaskCollection,
      QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<ExpectedTaskCollection, ExpectedTaskCollection,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ExpectedTaskCollection, ExpectedTaskCollection,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ExpectedTaskCollection, ExpectedTaskCollection,
      QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ExpectedTaskCollectionQueryFilter on QueryBuilder<
    ExpectedTaskCollection, ExpectedTaskCollection, QFilterCondition> {
  QueryBuilder<ExpectedTaskCollection, ExpectedTaskCollection,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ExpectedTaskCollection, ExpectedTaskCollection,
      QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ExpectedTaskCollection, ExpectedTaskCollection,
      QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ExpectedTaskCollection, ExpectedTaskCollection,
      QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ExpectedTaskCollection, ExpectedTaskCollection,
      QAfterFilterCondition> remoteTaskIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remoteTaskId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExpectedTaskCollection, ExpectedTaskCollection,
      QAfterFilterCondition> remoteTaskIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'remoteTaskId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExpectedTaskCollection, ExpectedTaskCollection,
      QAfterFilterCondition> remoteTaskIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'remoteTaskId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExpectedTaskCollection, ExpectedTaskCollection,
      QAfterFilterCondition> remoteTaskIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'remoteTaskId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExpectedTaskCollection, ExpectedTaskCollection,
      QAfterFilterCondition> remoteTaskIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'remoteTaskId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExpectedTaskCollection, ExpectedTaskCollection,
      QAfterFilterCondition> remoteTaskIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'remoteTaskId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExpectedTaskCollection, ExpectedTaskCollection,
          QAfterFilterCondition>
      remoteTaskIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'remoteTaskId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExpectedTaskCollection, ExpectedTaskCollection,
          QAfterFilterCondition>
      remoteTaskIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'remoteTaskId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExpectedTaskCollection, ExpectedTaskCollection,
      QAfterFilterCondition> remoteTaskIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remoteTaskId',
        value: '',
      ));
    });
  }

  QueryBuilder<ExpectedTaskCollection, ExpectedTaskCollection,
      QAfterFilterCondition> remoteTaskIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'remoteTaskId',
        value: '',
      ));
    });
  }
}

extension ExpectedTaskCollectionQueryObject on QueryBuilder<
    ExpectedTaskCollection, ExpectedTaskCollection, QFilterCondition> {}

extension ExpectedTaskCollectionQueryLinks on QueryBuilder<
    ExpectedTaskCollection, ExpectedTaskCollection, QFilterCondition> {}

extension ExpectedTaskCollectionQuerySortBy
    on QueryBuilder<ExpectedTaskCollection, ExpectedTaskCollection, QSortBy> {
  QueryBuilder<ExpectedTaskCollection, ExpectedTaskCollection, QAfterSortBy>
      sortByRemoteTaskId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteTaskId', Sort.asc);
    });
  }

  QueryBuilder<ExpectedTaskCollection, ExpectedTaskCollection, QAfterSortBy>
      sortByRemoteTaskIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteTaskId', Sort.desc);
    });
  }
}

extension ExpectedTaskCollectionQuerySortThenBy on QueryBuilder<
    ExpectedTaskCollection, ExpectedTaskCollection, QSortThenBy> {
  QueryBuilder<ExpectedTaskCollection, ExpectedTaskCollection, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ExpectedTaskCollection, ExpectedTaskCollection, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ExpectedTaskCollection, ExpectedTaskCollection, QAfterSortBy>
      thenByRemoteTaskId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteTaskId', Sort.asc);
    });
  }

  QueryBuilder<ExpectedTaskCollection, ExpectedTaskCollection, QAfterSortBy>
      thenByRemoteTaskIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteTaskId', Sort.desc);
    });
  }
}

extension ExpectedTaskCollectionQueryWhereDistinct
    on QueryBuilder<ExpectedTaskCollection, ExpectedTaskCollection, QDistinct> {
  QueryBuilder<ExpectedTaskCollection, ExpectedTaskCollection, QDistinct>
      distinctByRemoteTaskId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remoteTaskId', caseSensitive: caseSensitive);
    });
  }
}

extension ExpectedTaskCollectionQueryProperty on QueryBuilder<
    ExpectedTaskCollection, ExpectedTaskCollection, QQueryProperty> {
  QueryBuilder<ExpectedTaskCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ExpectedTaskCollection, String, QQueryOperations>
      remoteTaskIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remoteTaskId');
    });
  }
}
