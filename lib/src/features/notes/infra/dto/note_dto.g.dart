// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NoteDtoImpl _$$NoteDtoImplFromJson(Map<String, dynamic> json) =>
    _$NoteDtoImpl(
      title: json['note_title'] as String,
      emojiIcon: json['emoji'] as String,
      description: json['description'] as String,
      language:
          const NoteLanguageSerializer().fromJson(json['language'] as String),
      creationDate: const TimestampSerializer().fromJson(json['date']),
      textBlocks: (json['summary'] as List<dynamic>)
          .map((e) => NoteTextBlockDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      noteSource:
          const NoteSourceSerializer().fromJson(json['note_source'] as String),
      youtubeSourceLink: json['note_source_youtube_url'] as String,
      taskId: json['task_id'] as String,
    );

Map<String, dynamic> _$$NoteDtoImplToJson(_$NoteDtoImpl instance) =>
    <String, dynamic>{
      'note_title': instance.title,
      'emoji': instance.emojiIcon,
      'description': instance.description,
      'language': const NoteLanguageSerializer().toJson(instance.language),
      'date': const TimestampSerializer().toJson(instance.creationDate),
      'summary': instance.textBlocks,
      'note_source': const NoteSourceSerializer().toJson(instance.noteSource),
      'note_source_youtube_url': instance.youtubeSourceLink,
      'task_id': instance.taskId,
    };
