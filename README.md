# WebRTC based voice activity detection

[![CI Status](https://img.shields.io/travis/reedom/VoiceActivityDetector.svg?style=flat)](https://travis-ci.org/reedom/VoiceActivityDetector)
[![Version](https://img.shields.io/cocoapods/v/VoiceActivityDetector.svg?style=flat)](https://cocoapods.org/pods/VoiceActivityDetector)
[![License](https://img.shields.io/cocoapods/l/VoiceActivityDetector.svg?style=flat)](https://cocoapods.org/pods/VoiceActivityDetector)
[![Platform](https://img.shields.io/cocoapods/p/VoiceActivityDetector.svg?style=flat)](https://cocoapods.org/pods/VoiceActivityDetector)

This is a Swift/Objective-C interface to the WebRTC Voice Activity Detector (VAD).

A VAD classifies a piece of audio data as being voiced or unvoiced. It can be useful for telephony and speech recognition.

The VAD that Google developed for the WebRTC project is reportedly one of the best available, being fast, modern and free.

## Fork Information

This is a fork of the original project by [reedom](https://github.com/reedom/VoiceActivityDetector), with added support for Swift Package Manager and ongoing maintenance.

The fork is available at: [https://github.com/stormychel/VoiceActivityDetector](https://github.com/stormychel/VoiceActivityDetector)

## Sample data format

The VAD engine works only with signed 16-bit, single channel PCM.

Supported sample rates are:

* 8000Hz
* 16000Hz
* 32000Hz
* 48000Hz

Note that internally all processing is done at 8000Hz; input data at higher sample rates will be downsampled first.

## Usage

```swift
import VoiceActivityDetector

let voiceActivityDetector = VoiceActivityDetector(sampleRate: 8000,
                                                  agressiveness: .veryAggressive)

func didReceiveSampleBuffer(_ sampleBuffer: CMSampleBuffer) {
  let activities = voiceActivityDetector(sampleBuffer: sampleBuffer, byEachMilliSec: 10)!
  // ...
}
```

For usage with a microphone, see [Example](Example/VoiceActivityDetector/ViewController.swift).
And against an audio file, see [Test code](Example/Tests/Tests.swift).

## API

### Constructors

```swift
init?()
convenience init?(sampleRate: Int = 8000, agressiveness: DetectionAgressiveness = .quality)
convenience init?(agressiveness: DetectionAgressiveness = .quality)
```

### Properties

```swift
var agressiveness: DetectionAgressiveness
var sampleRate: Int
```

### Functions

```swift
func reset()
func detect(frames: UnsafePointer<Int16>, count: Int) -> VoiceActivity
func detect(frames: UnsafePointer<Int16>, lengthInMilliSec ms: Int) -> VoiceActivity
func detect(sampleBuffer: CMSampleBuffer, byEachMilliSec ms: Int, offset: Int = 0, duration: Int? = nil) -> [VoiceActivityInfo]?
```

## Swift Package Manager

VoiceActivityDetector now also supports Swift Package Manager. (added by [stormychel](https://github.com/stormychel))

You can add it to your project by specifying:

```swift
.package(url: "https://github.com/stormychel/VoiceActivityDetector.git", from: "1.0.0")
```

And include it in your target dependencies:

```swift
.target(
    name: "YourTarget",
    dependencies: ["VoiceActivityDetector"]
),
```

## CocoaPods

VoiceActivityDetector is also available via [CocoaPods](https://cocoapods.org).
Add the following line to your Podfile:

```ruby
pod 'VoiceActivityDetector'
```

## Author

Originally developed by reedom ([tohru@reedom.com](mailto:tohru@reedom.com)).

Fork maintained by [stormychel](https://github.com/stormychel).

## License

VoiceActivityDetector is available under the MIT license. See the LICENSE file for more information.
