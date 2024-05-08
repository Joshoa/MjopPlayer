<p align="center">
<a href="https://github.com/Joshoa/MjopPlayer/blob/main/media/mjopplayer_tag.png"> <img src="https://github.com/Joshoa/MjopPlayer/blob/main/media/mjopplayer_tag.png?raw=true" style="width: auto; max-width: 100%; height: 250px" title="MjopPlayer" alt="MjopPlayer" /> </a>
</p>

# MjopPlayer
> App to load and play videos from URL.

> This project demonstrates the implementation of a video player in Swift that supports Picture in Picture (PiP) mode and uses the Combine framework to manage asynchronous events.

## Features

- [x] Video playback with standard controls
- [x] Support for Picture in Picture (PiP) mode
- [x] Management of player state and events with Combine
- [x] User interface built with SwiftUI
- [x] Unit tests



## PreViews

<table align="center">
  <tr>
  <td><a href="https://github.com/Joshoa/MjopPlayer/blob/main/media/preview_01.gif"><img src="https://github.com/Joshoa/MjopPlayer/blob/main/media/preview_01.gif?raw=true" style="width: 500px; max-width: 100%; height: auto" title="PreView 01" alt="PreView 01" /></a></td>
  <td> <=> </td>
  <td><a href="https://github.com/Joshoa/MjopPlayer/blob/main/media/preview_02.gif"><img src="https://github.com/Joshoa/MjopPlayer/blob/main/media/preview_02.gif?raw=true" style="width: 500px; max-width: 100%; height: auto" title="PreView 02" alt="PreView 02" /></a></td>
  </tr>
</table>

## Installation

- ### Prerequisites for running the application:

    * **iOS 14.0+**
    * **Xcode 12.0+**
    * **Swift 5.3+**

- ### Run App:
    1. Clone the repository;
    2. Open the project in XCode;
    3. Build and install the App on the Simulator present in XCode.

        *  *Or*: [Run app on device](https://developer.apple.com/documentation/xcode/running_your_app_in_the_simulator_or_on_a_device)

## Usage

Run the app on your iOS device or simulator. Enter the desired video URL in the text field and press “Load Video” to start playback.

## Estrutura do Projeto

- `VideoPlayerViewModel.swift`: Contains the ViewModel logic to manage the `AVPlayer` and PiP.
- `PlayerViewControllerRepresentable.swift`: A `UIViewControllerRepresentable`to integrate `AVPlayerViewController` with SwiftUI.
- `ContentView.swift`: The main view that allows the user to interact with the video player.
- `AppDelegate.swift`: Configures the audio session to allow background playback.

## Testes

The project includes unit tests to verify the video player’s functionality. To run the tests, select the test scheme in Xcode and press `Command+U`.

Made with 🖤 by Marcos Joshoa 👉 [Check out my LinkedIn](https://www.linkedin.com/in/mrmjop/)