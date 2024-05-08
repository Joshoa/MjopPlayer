//
//  AppDelegate.swift
//  MjopPlayer
//
//  Created by Marcos Joshoa on 02/05/24.
//

import SwiftUI
import Foundation
import AVKit

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .moviePlayback, options: [.mixWithOthers, .allowAirPlay])
            debugPrint("Playback OK")
            try AVAudioSession.sharedInstance().setActive(true)
            debugPrint("Session is Active")
        } catch {
            debugPrint(error)
        }
        return true
    }
}
