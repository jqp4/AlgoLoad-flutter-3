// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_text_block_collection.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const NoteTextBlockCollectionSchema = Schema(
  name: r'NoteTextBlockCollection',
  id: -5898971912259817813,
  properties: {
    r'subtitle': PropertySchema(
      id: 0,
      name: r'subtitle',
      type: IsarType.string,
    ),
    r'texts': PropertySchema(
      id: 1,
      name: r'texts',
      type: IsarType.stringList,
    ),
    r'timing': PropertySchema(
      id: 2,
      name: r'timing',
      type: IsarType.string,
    )
  },
  estimateSize: _noteTextBlockCollectionEstimateSize,
  serialize: _noteTextBlockCollectionSerialize,
  deserialize: _noteTextBlockCollectionDeserialize,
  deserializeProp: _noteTextBlockCollectionDeserializeProp,
);

int _noteTextBlockCollectionEstimateSize(
  NoteTextBlockCollection object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.subtitle.length * 3;
  bytesCount += 3 + object.texts.length * 3;
  {
    for (var i = 0; i < object.texts.length; i++) {
      final value = object.texts[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.timing.length * 3;
  return bytesCount;
}

void _noteTextBlockCollectionSerialize(
  NoteTextBlockCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.subtitle);
  writer.writeStringList(offsets[1], object.texts);
  writer.writeString(offsets[2], object.timing);
}

NoteTextBlockCollection _noteTextBlockCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = NoteTextBlockCollection();
  object.subtitle = reader.readString(offsets[0]);
  object.texts = reader.readStringList(offsets[1]) ?? [];
  object.timing = reader.readString(offsets[2]);
  return object;
}

P _noteTextBlockCollectionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readStringList(offset) ?? []) as P;
    case 2:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension NoteTextBlockCollectionQueryFilter on QueryBuilder<
    NoteTextBlockCollection, NoteTextBlockCollection, QFilterCondition> {
  QueryBuilder<NoteTextBlockCollection, NoteTextBlockCollection,
      QAfterFilterCondition> subtitleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'subtitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteTextBlockCollection, NoteTextBlockCollection,
      QAfterFilterCondition> subtitleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'subtitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteTextBlockCollection, NoteTextBlockCollection,
      QAfterFilterCondition> subtitleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'subtitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteTextBlockCollection, NoteTextBlockCollection,
      QAfterFilterCondition> subtitleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'subtitle',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteTextBlockCollection, NoteTextBlockCollection,
      QAfterFilterCondition> subtitleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'subtitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteTextBlockCollection, NoteTextBlockCollection,
      QAfterFilterCondition> subtitleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'subtitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteTextBlockCollection, NoteTextBlockCollection,
          QAfterFilterCondition>
      subtitleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'subtitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteTextBlockCollection, NoteTextBlockCollection,
          QAfterFilterCondition>
      subtitleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'subtitle',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteTextBlockCollection, NoteTextBlockCollection,
      QAfterFilterCondition> subtitleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'subtitle',
        value: '',
      ));
    });
  }

  QueryBuilder<NoteTextBlockCollection, NoteTextBlockCollection,
      QAfterFilterCondition> subtitleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'subtitle',
        value: '',
      ));
    });
  }

  QueryBuilder<NoteTextBlockCollection, NoteTextBlockCollection,
      QAfterFilterCondition> textsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'texts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteTextBlockCollection, NoteTextBlockCollection,
      QAfterFilterCondition> textsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'texts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteTextBlockCollection, NoteTextBlockCollection,
      QAfterFilterCondition> textsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'texts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteTextBlockCollection, NoteTextBlockCollection,
      QAfterFilterCondition> textsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'texts',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteTextBlockCollection, NoteTextBlockCollection,
      QAfterFilterCondition> textsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'texts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteTextBlockCollection, NoteTextBlockCollection,
      QAfterFilterCondition> textsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'texts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteTextBlockCollection, NoteTextBlockCollection,
          QAfterFilterCondition>
      textsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'texts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteTextBlockCollection, NoteTextBlockCollection,
          QAfterFilterCondition>
      textsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'texts',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteTextBlockCollection, NoteTextBlockCollection,
      QAfterFilterCondition> textsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'texts',
        value: '',
      ));
    });
  }

  QueryBuilder<NoteTextBlockCollection, NoteTextBlockCollection,
      QAfterFilterCondition> textsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'texts',
        value: '',
      ));
    });
  }

  QueryBuilder<NoteTextBlockCollection, NoteTextBlockCollection,
      QAfterFilterCondition> textsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'texts',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<NoteTextBlockCollection, NoteTextBlockCollection,
      QAfterFilterCondition> textsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'texts',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<NoteTextBlockCollection, NoteTextBlockCollection,
      QAfterFilterCondition> textsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'texts',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<NoteTextBlockCollection, NoteTextBlockCollection,
      QAfterFilterCondition> textsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'texts',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<NoteTextBlockCollection, NoteTextBlockCollection,
      QAfterFilterCondition> textsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'texts',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<NoteTextBlockCollection, NoteTextBlockCollection,
      QAfterFilterCondition> textsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'texts',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<NoteTextBlockCollection, NoteTextBlockCollection,
      QAfterFilterCondition> timingEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timing',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteTextBlockCollection, NoteTextBlockCollection,
      QAfterFilterCondition> timingGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timing',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteTextBlockCollection, NoteTextBlockCollection,
      QAfterFilterCondition> timingLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timing',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteTextBlockCollection, NoteTextBlockCollection,
      QAfterFilterCondition> timingBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timing',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteTextBlockCollection, NoteTextBlockCollection,
      QAfterFilterCondition> timingStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'timing',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteTextBlockCollection, NoteTextBlockCollection,
      QAfterFilterCondition> timingEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'timing',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteTextBlockCollection, NoteTextBlockCollection,
          QAfterFilterCondition>
      timingContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'timing',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteTextBlockCollection, NoteTextBlockCollection,
          QAfterFilterCondition>
      timingMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'timing',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteTextBlockCollection, NoteTextBlockCollection,
      QAfterFilterCondition> timingIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timing',
        value: '',
      ));
    });
  }

  QueryBuilder<NoteTextBlockCollection, NoteTextBlockCollection,
      QAfterFilterCondition> timingIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'timing',
        value: '',
      ));
    });
  }
}

extension NoteTextBlockCollectionQueryObject on QueryBuilder<
    NoteTextBlockCollection, NoteTextBlockCollection, QFilterCondition> {}
