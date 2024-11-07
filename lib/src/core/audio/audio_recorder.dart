// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:io' as io;

import 'package:another_audio_recorder/another_audio_recorder.dart';
import 'package:file/file.dart';
import 'package:file/local.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import 'package:notes_app_with_ai/src/core/_barrel.dart';

import 'package:notes_app_with_ai/src/foundation/_barrel.dart';

import 'package:rxdart/rxdart.dart';

@lazySingleton
class AudioRecorderService {
  static const _localFileSystem = LocalFileSystem();
  static const _autoUpdateTick = Duration(milliseconds: 100);
  static const _customPathRoot = '/another_audio_recorder_';
  static final _log = Logger('AudioRecorderService');

  AnotherAudioRecorder? _recorder;

  final _recordingStatus = BehaviorSubject<RecordingStatus>.seeded(RecordingStatus.Unset);
  final _recordingData = BehaviorSubject<Recording?>.seeded(null);
  final _erorrProvider = BehaviorSubject<Exception?>.seeded(null);

  RecordingStatus get currentRecordingStatus => _recordingStatus.value;
  Recording? get currentRecordingData => _recordingData.value;

  void init() {
    _safetyAction(_init);
  }

  @disposeMethod
  void dispose() {
    _recordingStatus.close();
    _recordingData.close();
    _erorrProvider.close();
  }

  void nextAction() {
    _safetyAction(_nextAction);
  }

  void _setRecordingStatus(RecordingStatus? current) {
    String msg() => 'Update _recordingStatus: ${currentRecordingStatus.name}';

    if (current == null) {
      _recordingStatus.add(RecordingStatus.Unset);
      _log.warning(msg());
    } else {
      _recordingStatus.add(current);
      _log.finest(msg());
    }
  }

  void _setRecordingData(Recording? current) {
    _recordingData.add(current);
    _log.finest('Update _recordingData: power = ${currentRecordingData?.metering?.averagePower}');
  }

  Future<void> _updateRecordingDataAndStatus() async {
    final current = await _recorder?.current(channel: 0);

    _setRecordingData(current);
    _setRecordingStatus(currentRecordingData?.status);
  }

  Widget buildExample(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            // buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () => nextAction,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightBlue,
                    ),
                    child: Text(
                      nextActionText,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: currentRecordingStatus != RecordingStatus.Unset ? _stop : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent.withOpacity(0.5),
                  ),
                  child: const Text('Stop', style: TextStyle(color: Colors.white)),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: onPlayAudio,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent.withOpacity(0.5),
                  ),
                  child: const Text('Play (todo)', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),

            // info
            const Gap.y(40),
            Text('Status : $currentRecordingStatus'),
            Text('Avg Power: ${currentRecordingData?.metering?.averagePower}'),
            Text('Peak Power: ${currentRecordingData?.metering?.peakPower}'),
            Text('File path of the record: ${currentRecordingData?.path}'),
            Text('Format: ${currentRecordingData?.audioFormat}'),
            Text('isMeteringEnabled: ${currentRecordingData?.metering?.isMeteringEnabled}'),
            Text('Extension : ${currentRecordingData?.extension}'),
            Text('Audio recording duration : ${currentRecordingData?.duration.toString()}'),
            const Gap.y(40),
          ],
        ),
      ),
    );
  }

  FutureOr<T> _safetyAction<T>(FutureOr<T> Function() fn) async {
    try {
      return await fn();
    } on Exception catch (e, t) {
      _log.severe('$e\n$t');
      _erorrProvider.add(e);
      rethrow;
    }
  }

  Future<void> _init() async {
    if (!(await AnotherAudioRecorder.hasPermissions)) {
      throw const AudioRecorderException(description: 'You must accept permissions');
    }

    final io.Directory appDocDirectory = await DirectoryInfo.getPlatformStorageDirectory();

    // can add extension like ".mp4" ".wav" ".m4a" ".aac"
    final customPath = appDocDirectory.path + _customPathRoot + DateTime.now().millisecondsSinceEpoch.toString();

    // .wav <---> AudioFormat.WAV
    // .mp4 .m4a .aac <---> AudioFormat.AAC
    // AudioFormat is optional, if given value, will overwrite path extension when there is conflicts.
    _recorder = AnotherAudioRecorder(customPath, audioFormat: AudioFormat.WAV);

    // await initialization
    await _recorder?.initialized;

    // after initialization
    // final current = await _recorder?.current(channel: 0);
    await _updateRecordingDataAndStatus();
  }

  Future<void> _nextAction() async {
    switch (currentRecordingStatus) {
      case RecordingStatus.Initialized:
        {
          await _start();
          break;
        }
      case RecordingStatus.Recording:
        {
          await _pause();
          break;
        }
      case RecordingStatus.Paused:
        {
          await _resume();
          break;
        }
      case RecordingStatus.Stopped:
        {
          await _init();
          break;
        }
      case RecordingStatus.Unset:
        {
          throw const AudioRecorderException(description: 'RecordingStatus is Unset');
        }
    }
  }

  Future<void> _start() async {
    await _recorder?.start();
    // final recording = await _recorder?.current(channel: 0);
    await _updateRecordingDataAndStatus();

    Timer.periodic(_autoUpdateTick, (t) async {
      if (currentRecordingStatus == RecordingStatus.Stopped) t.cancel();

      // final current = await _recorder?.current(channel: 0);
      await _updateRecordingDataAndStatus();
    });
  }

  Future<void> _resume() async {
    await _recorder?.resume();

    // todo: remove ???
    // final current = await _recorder?.current(channel: 0);
    await _updateRecordingDataAndStatus();
  }

  Future<void> _pause() async {
    await _recorder?.pause();

    // todo: remove ???
    // final current = await _recorder?.current(channel: 0);
    await _updateRecordingDataAndStatus();
  }

  Future<void> _stop() async {
    if (currentRecordingStatus == RecordingStatus.Unset) return;

    final result = await _recorder?.stop();
    pprint('Stop recording: ${result?.path}');
    pprint('Stop recording: ${result?.duration}');
    final File file = _localFileSystem.file(result?.path);
    pprint('File length: ${await file.length()}');

    await _updateRecordingDataAndStatus();

    // todo: check
    // _updateRecordingDataAndStatus(result);
  }

  String get nextActionText => switch (currentRecordingStatus) {
        // todo:
        RecordingStatus.Unset => '???',
        RecordingStatus.Initialized => 'Start',
        RecordingStatus.Recording => 'Pause',
        RecordingStatus.Paused => 'Resume',
        RecordingStatus.Stopped => 'Init',
      };

  // todo
  Future<void> onPlayAudio() async {
    // final AudioPlayer audioPlayer = AudioPlayer();
    // final Source source = DeviceFileSource(_current!.path!);
    // await audioPlayer.play(source);
  }
}
