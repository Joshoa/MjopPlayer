//
//  VideoPlayerViewModel.swift
//  MjopPlayer
//
//  Created by Marcos Joshoa on 02/05/24.
//

import AVKit
import Combine

class VideoPlayerViewModel: NSObject, ObservableObject, AVPictureInPictureControllerDelegate {
    @Published var player = AVPlayer()
    var pipController: AVPictureInPictureController?
    private var cancellables = Set<AnyCancellable>()
    
    @Published var videoURL: URL? {
        didSet {
            if let url = videoURL {
                loadVideo(url: url)
            }
        }
    }
    
    override init() {
        super.init()
        setupPiPController()
    }
    
    func loadVideo(url: URL) {
        player.replaceCurrentItem(with: AVPlayerItem(url: url))
        player.play()
    }
    
    private func setupPiPController() {
        guard AVPictureInPictureController.isPictureInPictureSupported() else {
            return
        }
        
        let playerLayer = AVPlayerLayer(player: player)
        pipController = AVPictureInPictureController(playerLayer: playerLayer)
        pipController?.delegate = self
    }
    
    func togglePiP() {
        if pipController?.isPictureInPictureActive == true {
            pipController?.stopPictureInPicture()
        } else {
            pipController?.startPictureInPicture()
        }
    }
    
    func observePlayerStatus() {
        player.publisher(for: \.timeControlStatus)
            .receive(on: RunLoop.main)
            .sink { [weak self] status in
                switch status {
                case .paused:
                    self?.handlePlayerPaused()
                case .playing:
                    self?.handlePlayerPlaying()
                default:
                    break
                }
            }
            .store(in: &cancellables)
    }
    
    private func handlePlayerPaused() {
        savePlaybackPosition()
    }
    
    private func handlePlayerPlaying() {
        restorePlaybackPosition()
    }
    
    private func savePlaybackPosition() {
        let currentTime = player.currentTime()
        UserDefaults.standard.set(CMTimeGetSeconds(currentTime), forKey: "lastPlaybackTime")
    }
    
    private func restorePlaybackPosition() {
        if let lastPlaybackTime = UserDefaults.standard.value(forKey: "lastPlaybackTime") as? Double {
            let seekTime = CMTimeMake(value: Int64(lastPlaybackTime), timescale: 1)
            player.seek(to: seekTime)
        }
    }
}
