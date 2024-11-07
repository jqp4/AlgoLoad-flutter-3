// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetNoteCollectionCollection on Isar {
  IsarCollection<NoteCollection> get noteCollections => this.collection();
}

const NoteCollectionSchema = CollectionSchema(
  name: r'NoteCollection',
  id: -880493522486186259,
  properties: {
    r'creationDate': PropertySchema(
      id: 0,
      name: r'creationDate',
      type: IsarType.dateTime,
    ),
    r'description': PropertySchema(
      id: 1,
      name: r'description',
      type: IsarType.string,
    ),
    r'emojiIcon': PropertySchema(
      id: 2,
      name: r'emojiIcon',
      type: IsarType.string,
    ),
    r'language': PropertySchema(
      id: 3,
      name: r'language',
      type: IsarType.byte,
      enumMap: _NoteCollectionlanguageEnumValueMap,
    ),
    r'noteSource': PropertySchema(
      id: 4,
      name: r'noteSource',
      type: IsarType.byte,
      enumMap: _NoteCollectionnoteSourceEnumValueMap,
    ),
    r'taskId': PropertySchema(
      id: 5,
      name: r'taskId',
      type: IsarType.string,
    ),
    r'textBlocks': PropertySchema(
      id: 6,
      name: r'textBlocks',
      type: IsarType.objectList,
      target: r'NoteTextBlockCollection',
    ),
    r'title': PropertySchema(
      id: 7,
      name: r'title',
      type: IsarType.string,
    ),
    r'youtubeSourceLink': PropertySchema(
      id: 8,
      name: r'youtubeSourceLink',
      type: IsarType.string,
    )
  },
  estimateSize: _noteCollectionEstimateSize,
  serialize: _noteCollectionSerialize,
  deserialize: _noteCollectionDeserialize,
  deserializeProp: _noteCollectionDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {r'NoteTextBlockCollection': NoteTextBlockCollectionSchema},
  getId: _noteCollectionGetId,
  getLinks: _noteCollectionGetLinks,
  attach: _noteCollectionAttach,
  version: '3.1.0+1',
);

int _noteCollectionEstimateSize(
  NoteCollection object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.description.length * 3;
  bytesCount += 3 + object.emojiIcon.length * 3;
  bytesCount += 3 + object.taskId.length * 3;
  bytesCount += 3 + object.textBlocks.length * 3;
  {
    final offsets = allOffsets[NoteTextBlockCollection]!;
    for (var i = 0; i < object.textBlocks.length; i++) {
      final value = object.textBlocks[i];
      bytesCount += NoteTextBlockCollectionSchema.estimateSize(
          value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.title.length * 3;
  bytesCount += 3 + object.youtubeSourceLink.length * 3;
  return bytesCount;
}

void _noteCollectionSerialize(
  NoteCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.creationDate);
  writer.writeString(offsets[1], object.description);
  writer.writeString(offsets[2], object.emojiIcon);
  writer.writeByte(offsets[3], object.language.index);
  writer.writeByte(offsets[4], object.noteSource.index);
  writer.writeString(offsets[5], object.taskId);
  writer.writeObjectList<NoteTextBlockCollection>(
    offsets[6],
    allOffsets,
    NoteTextBlockCollectionSchema.serialize,
    object.textBlocks,
  );
  writer.writeString(offsets[7], object.title);
  writer.writeString(offsets[8], object.youtubeSourceLink);
}

NoteCollection _noteCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = NoteCollection();
  object.creationDate = reader.readDateTime(offsets[0]);
  object.description = reader.readString(offsets[1]);
  object.emojiIcon = reader.readString(offsets[2]);
  object.id = id;
  object.language =
      _NoteCollectionlanguageValueEnumMap[reader.readByteOrNull(offsets[3])] ??
          NoteLanguage.netherlands;
  object.noteSource = _NoteCollectionnoteSourceValueEnumMap[
          reader.readByteOrNull(offsets[4])] ??
      NoteSource.audioFile;
  object.taskId = reader.readString(offsets[5]);
  object.textBlocks = reader.readObjectList<NoteTextBlockCollection>(
        offsets[6],
        NoteTextBlockCollectionSchema.deserialize,
        allOffsets,
        NoteTextBlockCollection(),
      ) ??
      [];
  object.title = reader.readString(offsets[7]);
  object.youtubeSourceLink = reader.readString(offsets[8]);
  return object;
}

P _noteCollectionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (_NoteCollectionlanguageValueEnumMap[
              reader.readByteOrNull(offset)] ??
          NoteLanguage.netherlands) as P;
    case 4:
      return (_NoteCollectionnoteSourceValueEnumMap[
              reader.readByteOrNull(offset)] ??
          NoteSource.audioFile) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readObjectList<NoteTextBlockCollection>(
            offset,
            NoteTextBlockCollectionSchema.deserialize,
            allOffsets,
            NoteTextBlockCollection(),
          ) ??
          []) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _NoteCollectionlanguageEnumValueMap = {
  'netherlands': 0,
  'russian': 1,
  'english': 2,
  'germany': 3,
  'spain': 4,
  'unknown': 5,
};
const _NoteCollectionlanguageValueEnumMap = {
  0: NoteLanguage.netherlands,
  1: NoteLanguage.russian,
  2: NoteLanguage.english,
  3: NoteLanguage.germany,
  4: NoteLanguage.spain,
  5: NoteLanguage.unknown,
};
const _NoteCollectionnoteSourceEnumValueMap = {
  'audioFile': 0,
  'youtube': 1,
  'unknown': 2,
};
const _NoteCollectionnoteSourceValueEnumMap = {
  0: NoteSource.audioFile,
  1: NoteSource.youtube,
  2: NoteSource.unknown,
};

Id _noteCollectionGetId(NoteCollection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _noteCollectionGetLinks(NoteCollection object) {
  return [];
}

void _noteCollectionAttach(
    IsarCollection<dynamic> col, Id id, NoteCollection object) {
  object.id = id;
}

extension NoteCollectionQueryWhereSort
    on QueryBuilder<NoteCollection, NoteCollection, QWhere> {
  QueryBuilder<NoteCollection, NoteCollection, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension NoteCollectionQueryWhere
    on QueryBuilder<NoteCollection, NoteCollection, QWhereClause> {
  QueryBuilder<NoteCollection, NoteCollection, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<NoteCollection, NoteCollection, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterWhereClause> idBetween(
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

extension NoteCollectionQueryFilter
    on QueryBuilder<NoteCollection, NoteCollection, QFilterCondition> {
  QueryBuilder<NoteCollection, NoteCollection, QAfterFilterCondition>
      creationDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'creationDate',
        value: value,
      ));
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterFilterCondition>
      creationDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'creationDate',
        value: value,
      ));
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterFilterCondition>
      creationDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'creationDate',
        value: value,
      ));
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterFilterCondition>
      creationDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'creationDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterFilterCondition>
      descriptionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterFilterCondition>
      descriptionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterFilterCondition>
      descriptionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterFilterCondition>
      descriptionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterFilterCondition>
      descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterFilterCondition>
      descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterFilterCondition>
      emojiIconEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'emojiIcon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterFilterCondition>
      emojiIconGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'emojiIcon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterFilterCondition>
      emojiIconLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'emojiIcon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterFilterCondition>
      emojiIconBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'emojiIcon',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterFilterCondition>
      emojiIconStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'emojiIcon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterFilterCondition>
      emojiIconEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'emojiIcon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterFilterCondition>
      emojiIconContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'emojiIcon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterFilterCondition>
      emojiIconMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'emojiIcon',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterFilterCondition>
      emojiIconIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'emojiIcon',
        value: '',
      ));
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterFilterCondition>
      emojiIconIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'emojiIcon',
        value: '',
      ));
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<NoteCollection, NoteCollection, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<NoteCollection, NoteCollection, QAfterFilterCondition> idBetween(
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

  QueryBuilder<NoteCollection, NoteCollection, QAfterFilterCondition>
      languageEqualTo(NoteLanguage value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'language',
        value: value,
      ));
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterFilterCondition>
      languageGreaterThan(
    NoteLanguage value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'language',
        value: value,
      ));
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterFilterCondition>
      languageLessThan(
    NoteLanguage value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'language',
        value: value,
      ));
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterFilterCondition>
      languageBetween(
    NoteLanguage lower,
    NoteLanguage upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'language',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterFilterCondition>
      noteSourceEqualTo(NoteSource value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'noteSource',
        value: value,
      ));
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterFilterCondition>
      noteSourceGreaterThan(
    NoteSource value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'noteSource',
        value: value,
      ));
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterFilterCondition>
      noteSourceLessThan(
    NoteSource value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'noteSource',
        value: value,
      ));
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterFilterCondition>
      noteSourceBetween(
    NoteSource lower,
    NoteSource upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'noteSource',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterFilterCondition>
      taskIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taskId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterFilterCondition>
      taskIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'taskId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterFilterCondition>
      taskIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'taskId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterFilterCondition>
      taskIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'taskId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterFilterCondition>
      taskIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'taskId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterFilterCondition>
      taskIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'taskId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterFilterCondition>
      taskIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'taskId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterFilterCondition>
      taskIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'taskId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterFilterCondition>
      taskIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taskId',
        value: '',
      ));
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterFilterCondition>
      taskIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'taskId',
        value: '',
      ));
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterFilterCondition>
      textBlocksLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'textBlocks',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterFilterCondition>
      textBlocksIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'textBlocks',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterFilterCondition>
      textBlocksIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'textBlocks',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterFilterCondition>
      textBlocksLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'textBlocks',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterFilterCondition>
      textBlocksLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'textBlocks',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterFilterCondition>
      textBlocksLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'textBlocks',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterFilterCondition>
      titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterFilterCondition>
      titleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterFilterCondition>
      titleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterFilterCondition>
      titleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'title',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterFilterCondition>
      titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterFilterCondition>
      titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterFilterCondition>
      titleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterFilterCondition>
      titleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterFilterCondition>
      titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterFilterCondition>
      titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterFilterCondition>
      youtubeSourceLinkEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'youtubeSourceLink',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterFilterCondition>
      youtubeSourceLinkGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'youtubeSourceLink',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterFilterCondition>
      youtubeSourceLinkLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'youtubeSourceLink',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterFilterCondition>
      youtubeSourceLinkBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'youtubeSourceLink',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterFilterCondition>
      youtubeSourceLinkStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'youtubeSourceLink',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterFilterCondition>
      youtubeSourceLinkEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'youtubeSourceLink',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterFilterCondition>
      youtubeSourceLinkContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'youtubeSourceLink',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterFilterCondition>
      youtubeSourceLinkMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'youtubeSourceLink',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterFilterCondition>
      youtubeSourceLinkIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'youtubeSourceLink',
        value: '',
      ));
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterFilterCondition>
      youtubeSourceLinkIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'youtubeSourceLink',
        value: '',
      ));
    });
  }
}

extension NoteCollectionQueryObject
    on QueryBuilder<NoteCollection, NoteCollection, QFilterCondition> {
  QueryBuilder<NoteCollection, NoteCollection, QAfterFilterCondition>
      textBlocksElement(FilterQuery<NoteTextBlockCollection> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'textBlocks');
    });
  }
}

extension NoteCollectionQueryLinks
    on QueryBuilder<NoteCollection, NoteCollection, QFilterCondition> {}

extension NoteCollectionQuerySortBy
    on QueryBuilder<NoteCollection, NoteCollection, QSortBy> {
  QueryBuilder<NoteCollection, NoteCollection, QAfterSortBy>
      sortByCreationDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creationDate', Sort.asc);
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterSortBy>
      sortByCreationDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creationDate', Sort.desc);
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterSortBy>
      sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterSortBy>
      sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterSortBy> sortByEmojiIcon() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emojiIcon', Sort.asc);
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterSortBy>
      sortByEmojiIconDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emojiIcon', Sort.desc);
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterSortBy> sortByLanguage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'language', Sort.asc);
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterSortBy>
      sortByLanguageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'language', Sort.desc);
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterSortBy>
      sortByNoteSource() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'noteSource', Sort.asc);
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterSortBy>
      sortByNoteSourceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'noteSource', Sort.desc);
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterSortBy> sortByTaskId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taskId', Sort.asc);
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterSortBy>
      sortByTaskIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taskId', Sort.desc);
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterSortBy>
      sortByYoutubeSourceLink() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'youtubeSourceLink', Sort.asc);
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterSortBy>
      sortByYoutubeSourceLinkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'youtubeSourceLink', Sort.desc);
    });
  }
}

extension NoteCollectionQuerySortThenBy
    on QueryBuilder<NoteCollection, NoteCollection, QSortThenBy> {
  QueryBuilder<NoteCollection, NoteCollection, QAfterSortBy>
      thenByCreationDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creationDate', Sort.asc);
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterSortBy>
      thenByCreationDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creationDate', Sort.desc);
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterSortBy>
      thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterSortBy>
      thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterSortBy> thenByEmojiIcon() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emojiIcon', Sort.asc);
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterSortBy>
      thenByEmojiIconDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emojiIcon', Sort.desc);
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterSortBy> thenByLanguage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'language', Sort.asc);
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterSortBy>
      thenByLanguageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'language', Sort.desc);
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterSortBy>
      thenByNoteSource() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'noteSource', Sort.asc);
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterSortBy>
      thenByNoteSourceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'noteSource', Sort.desc);
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterSortBy> thenByTaskId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taskId', Sort.asc);
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterSortBy>
      thenByTaskIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taskId', Sort.desc);
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterSortBy>
      thenByYoutubeSourceLink() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'youtubeSourceLink', Sort.asc);
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QAfterSortBy>
      thenByYoutubeSourceLinkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'youtubeSourceLink', Sort.desc);
    });
  }
}

extension NoteCollectionQueryWhereDistinct
    on QueryBuilder<NoteCollection, NoteCollection, QDistinct> {
  QueryBuilder<NoteCollection, NoteCollection, QDistinct>
      distinctByCreationDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'creationDate');
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QDistinct> distinctByEmojiIcon(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'emojiIcon', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QDistinct> distinctByLanguage() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'language');
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QDistinct>
      distinctByNoteSource() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'noteSource');
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QDistinct> distinctByTaskId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'taskId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NoteCollection, NoteCollection, QDistinct>
      distinctByYoutubeSourceLink({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'youtubeSourceLink',
          caseSensitive: caseSensitive);
    });
  }
}

extension NoteCollectionQueryProperty
    on QueryBuilder<NoteCollection, NoteCollection, QQueryProperty> {
  QueryBuilder<NoteCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<NoteCollection, DateTime, QQueryOperations>
      creationDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'creationDate');
    });
  }

  QueryBuilder<NoteCollection, String, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<NoteCollection, String, QQueryOperations> emojiIconProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'emojiIcon');
    });
  }

  QueryBuilder<NoteCollection, NoteLanguage, QQueryOperations>
      languageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'language');
    });
  }

  QueryBuilder<NoteCollection, NoteSource, QQueryOperations>
      noteSourceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'noteSource');
    });
  }

  QueryBuilder<NoteCollection, String, QQueryOperations> taskIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'taskId');
    });
  }

  QueryBuilder<NoteCollection, List<NoteTextBlockCollection>, QQueryOperations>
      textBlocksProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'textBlocks');
    });
  }

  QueryBuilder<NoteCollection, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<NoteCollection, String, QQueryOperations>
      youtubeSourceLinkProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'youtubeSourceLink');
    });
  }
}
