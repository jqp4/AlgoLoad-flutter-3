import 'dart:async';
import 'dart:io' as io;

import 'package:another_audio_recorder/another_audio_recorder.dart';
import 'package:file/file.dart';
import 'package:file/local.dart';
import 'package:flutter/material.dart';
import 'package:notes_app_with_ai/src/core/uikit/_barrel.dart';
import 'package:notes_app_with_ai/src/foundation/_barrel.dart';
import 'package:path_provider/path_provider.dart';

// import 'package:audioplayers/audioplayers.dart';

class AudioRecorderExample1 extends StatefulWidget {
  const AudioRecorderExample1({
    super.key,
    localFileSystem,
  }) : localFileSystem = localFileSystem ?? const LocalFileSystem();

  final LocalFileSystem localFileSystem;

  @override
  State<StatefulWidget> createState() => AudioRecorderExample1State();
}

class AudioRecorderExample1State extends State<AudioRecorderExample1> {
  AnotherAudioRecorder? _recorder;
  Recording? _current;
  RecordingStatus _currentStatus = RecordingStatus.Unset;

  @override
  void initState() {
    super.initState();

    // _init();
    _tmpLogger(_init);
  }

  @override
  Widget build(BuildContext context) {
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
                    onPressed: () => _tmpLogger(_action),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightBlue,
                    ),
                    child: _buildText(_currentStatus),
                  ),
                ),
                ElevatedButton(
                  onPressed: _currentStatus != RecordingStatus.Unset ? _stop : null,
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
            Text('Status : $_currentStatus'),
            Text('Avg Power: ${_current?.metering?.averagePower}'),
            Text('Peak Power: ${_current?.metering?.peakPower}'),
            Text('File path of the record: ${_current?.path}'),
            Text('Format: ${_current?.audioFormat}'),
            Text('isMeteringEnabled: ${_current?.metering?.isMeteringEnabled}'),
            Text('Extension : ${_current?.extension}'),
            Text('Audio recording duration : ${_current?.duration.toString()}'),
            const Gap.y(40),
          ],
        ),
      ),
    );
  }

  FutureOr<T?> _tmpLogger<T>(FutureOr<T> Function() fn) async {
    try {
      return await fn();
    } on Exception catch (e, t) {
      pprint('Exception: $e\nTrace: $t');
      // rethrow;
      return null;
    }
  }

  Future<void> _init() async {
    try {
      if (await AnotherAudioRecorder.hasPermissions) {
        const customPathRoot = '/another_audio_recorder_';

        io.Directory appDocDirectory;

        if (io.Platform.isIOS) {
          appDocDirectory = await getApplicationDocumentsDirectory();
        } else {
          appDocDirectory = (await getExternalStorageDirectory())!;
        }

        // final io.Directory appDocDirectory = await DirectoryInfo.getPlatformStorageDirectory();

        // can add extension like ".mp4" ".wav" ".m4a" ".aac"
        final customPath = appDocDirectory.path + customPathRoot + DateTime.now().millisecondsSinceEpoch.toString();
        pprint('1');
        // .wav <---> AudioFormat.WAV
        // .mp4 .m4a .aac <---> AudioFormat.AAC
        // AudioFormat is optional, if given value, will overwrite path extension when there is conflicts.
        _recorder = AnotherAudioRecorder(customPath, audioFormat: AudioFormat.WAV);

        pprint('2');

        await _recorder?.initialized;

        pprint('3');

        // after initialization
        final current = await _recorder?.current(channel: 0);
        pprint('4, current: $current');

        // should be "Initialized", if all working fine
        setState(() {
          _current = current;
          _currentStatus = current!.status!;
          pprint(_currentStatus);
        });

        pprint('5');
      } else {
        // return const SnackBar(content: Text('You must accept permissions'));
        context.showSnackbar('You must accept permissions');
      }
    } on Exception catch (e, t) {
      pprint('eeee: $e\n$t');
    }
  }

  Future<void> _action() async {
    switch (_currentStatus) {
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
      default:
        break;
    }
  }

  Future<void> _start() async {
    try {
      await _recorder?.start();
      final recording = await _recorder?.current(channel: 0);
      setState(() {
        _current = recording;
      });

      const tick = Duration(milliseconds: 50);
      Timer.periodic(tick, (t) async {
        if (_currentStatus == RecordingStatus.Stopped) {
          t.cancel();
        }

        final current = await _recorder?.current(channel: 0);
        setState(() {
          _current = current;
          _currentStatus = _current!.status!;
        });
      });
    } on Exception catch (e) {
      pprint(e);
    }
  }

  Future<void> _resume() async {
    await _recorder?.resume();
    setState(() {});
  }

  Future<void> _pause() async {
    await _recorder?.pause();
    setState(() {});
  }

  Future<void> _stop() async {
    final result = await _recorder?.stop();
    pprint('Stop recording: ${result?.path}');
    pprint('Stop recording: ${result?.duration}');
    final File file = widget.localFileSystem.file(result?.path);
    pprint('File length: ${await file.length()}');
    setState(() {
      _current = result;
      _currentStatus = _current!.status!;
    });
  }

  Widget _buildText(RecordingStatus status) {
    var text = '';
    switch (_currentStatus) {
      case RecordingStatus.Initialized:
        {
          text = 'Start';
          break;
        }
      case RecordingStatus.Recording:
        {
          text = 'Pause';
          break;
        }
      case RecordingStatus.Paused:
        {
          text = 'Resume';
          break;
        }
      case RecordingStatus.Stopped:
        {
          text = 'Init';
          break;
        }
      default:
        break;
    }
    return Text(text, style: const TextStyle(color: Colors.white));
  }

  Future<void> onPlayAudio() async {
    // final AudioPlayer audioPlayer = AudioPlayer();
    // final Source source = DeviceFileSource(_current!.path!);
    // await audioPlayer.play(source);
  }
}
