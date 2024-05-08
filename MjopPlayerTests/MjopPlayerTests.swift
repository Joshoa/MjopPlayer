//
//  MjopPlayerTests.swift
//  MjopPlayerTests
//
//  Created by Marcos Joshoa on 08/05/24.
//

import XCTest
import AVFoundation

@testable import MjopPlayer

final class VideoPlayerViewModelTests: XCTestCase {
    var viewModel: VideoPlayerViewModel!
    var player: AVPlayer {
        return viewModel.player
    }

    override func setUpWithError() throws {
        // Inicialize o ViewModel antes de cada teste
        viewModel = VideoPlayerViewModel()
    }

    override func tearDownWithError() throws {
        // Desfaça o que foi feito após cada teste
        viewModel = nil
    }

    func testLoadVideo() throws {
        // Defina uma expectativa para uma resposta assíncrona
        let expectation = XCTestExpectation(description: "Load and play video")

        // Substitua a URL por uma URL válida de um vídeo para teste
        let testVideoURL = URL(string: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4")!
        viewModel.videoURL = testVideoURL

        // Observe o status do player para mudar para 'playing'
        let timeToWait = TimeInterval(5) // Ajuste conforme necessário
        DispatchQueue.main.asyncAfter(deadline: .now() + timeToWait) {
            if case .playing = self.player.timeControlStatus {
                expectation.fulfill()
            } else {
                XCTFail("The player did not start playing the video.")
            }
        }

        // Aguarde até que a expectativa seja cumprida ou o tempo limite seja atingido
        wait(for: [expectation], timeout: timeToWait + 1)
    }
}
