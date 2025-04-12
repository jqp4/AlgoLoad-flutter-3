// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_text_block_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NoteTextBlockDtoImpl _$$NoteTextBlockDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$NoteTextBlockDtoImpl(
      subtitle: json['title'] as String,
      timing: json['time'] as String,
      texts: (json['texts'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$NoteTextBlockDtoImplToJson(
        _$NoteTextBlockDtoImpl instance) =>
    <String, dynamic>{
      'title': instance.subtitle,
      'time': instance.timing,
      'texts': instance.texts,
    };
