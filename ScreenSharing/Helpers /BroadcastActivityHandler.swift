//
//  SampleHandler.swift
//  ScreenSharing
//
//  Created by Mian Usama on 11/09/2024.
//

import ReplayKit
import SwiftUI

struct BroadcastActivityViewControllerRepresentable: UIViewControllerRepresentable {
    class Coordinator: NSObject, RPBroadcastActivityViewControllerDelegate {
        var parent: BroadcastActivityViewControllerRepresentable
        
        init(parent: BroadcastActivityViewControllerRepresentable) {
            self.parent = parent
        }
        
        func broadcastActivityViewController(_ broadcastActivityViewController: RPBroadcastActivityViewController, didFinishWith broadcastController: RPBroadcastController?, error: Error?) {
            broadcastActivityViewController.dismiss(animated: true) {
                if let error = error {
                    print("Broadcast activity error: \(error.localizedDescription)")
                } else {
                    self.parent.broadcastController = broadcastController
                    self.parent.isBroadcasting = true
                    broadcastController?.startBroadcast { error in
                        if let error = error {
                            print("Error starting broadcast: \(error.localizedDescription)")
                        } else {
                            print("Broadcast started successfully.")
                        }
                    }
                }
            }
        }
    }
    
    @Binding var isBroadcasting: Bool
    @Binding var broadcastController: RPBroadcastController?
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    func makeUIViewController(context: Context) -> UIViewController {
        UIViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        if !isBroadcasting {
            RPBroadcastActivityViewController.load { [weak uiViewController] (broadcastActivityViewController, error) in
                if let broadcastActivityViewController = broadcastActivityViewController {
                    broadcastActivityViewController.delegate = context.coordinator
                    uiViewController?.present(broadcastActivityViewController, animated: true, completion: nil)
                } else if let error = error {
                    print("Error loading broadcast activity view controller: \(error.localizedDescription)")
                }
            }
        }
    }
}
