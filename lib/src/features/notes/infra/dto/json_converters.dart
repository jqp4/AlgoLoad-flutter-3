import 'package:algoload_flutter_web_app/src/features/notes/_barrel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

class TimestampSerializer implements JsonConverter<DateTime, dynamic> {
  const TimestampSerializer();

  @override
  DateTime fromJson(secTimestamp) {
    final secTimestampInt = switch (secTimestamp.runtimeType) {
      int => secTimestamp as int,
      String => int.parse(secTimestamp),
      _ => throw TypeError(),
    };

    return Timestamp.fromMillisecondsSinceEpoch(secTimestampInt * 1000).toDate();
  }

  @override
  String toJson(DateTime date) => Timestamp.fromDate(date).millisecondsSinceEpoch.toString();
}

class NoteLanguageSerializer implements JsonConverter<NoteLanguage, String> {
  const NoteLanguageSerializer();

  static const _netherlands = 'ne';
  static const _english = 'en';
  static const _germany = 'ge';
  static const _russian = 'ru';
  static const _spain = 'sp';

  @override
  NoteLanguage fromJson(String noteLanguageName) => switch (noteLanguageName) {
        _netherlands => NoteLanguage.netherlands,
        _english => NoteLanguage.english,
        _germany => NoteLanguage.germany,
        _russian => NoteLanguage.russian,
        _spain => NoteLanguage.spain,
        _ => throw TypeError(),
      };

  @override
  String toJson(NoteLanguage noteLanguage) => switch (noteLanguage) {
        NoteLanguage.netherlands => _netherlands,
        NoteLanguage.english => _english,
        NoteLanguage.germany => _germany,
        NoteLanguage.russian => _russian,
        NoteLanguage.spain => _spain,
        _ => throw TypeError(),
      };
}

class NoteSourceSerializer implements JsonConverter<NoteSource, String> {
  const NoteSourceSerializer();

  static const _audioFile = 'local';
  static const _youtube = 'youtube';

  @override
  NoteSource fromJson(String noteSourceName) => switch (noteSourceName) {
        _audioFile => NoteSource.audioFile,
        _youtube => NoteSource.youtube,
        _ => throw TypeError(),
      };

  @override
  String toJson(NoteSource noteSource) => switch (noteSource) {
        NoteSource.audioFile => _audioFile,
        NoteSource.youtube => _youtube,
        _ => throw TypeError(),
      };
}
