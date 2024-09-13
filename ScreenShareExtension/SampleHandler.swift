//
//  SampleHandler.swift
//  ScreenShareExtension
//
//  Created by Mian Usama on 11/09/2024.
//

import ReplayKit


class BroadcastUploadExtension: RPBroadcastSampleHandler {

    override func broadcastStarted(withSetupInfo setupInfo: [String : NSObject]?) {
        print("Broadcast started")
        // Handle setup info if needed
    }

    override func broadcastPaused() {
        print("Broadcast paused")
        // Handle pause
    }

    override func broadcastResumed() {
        print("Broadcast resumed")
        // Handle resume
    }

    override func broadcastFinished() {
        print("Broadcast finished")
        // Handle finish
    }

    override func processSampleBuffer(_ sampleBuffer: CMSampleBuffer, with type: RPSampleBufferType) {
        // Process the sample buffer for video/audio
        if type == .video {
            // Handle video sample buffer
        } else if type == .audioApp || type == .audioMic {
            // Handle audio sample buffer
        }
    }
}
