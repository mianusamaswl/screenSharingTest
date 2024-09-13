//
//  ContentView.swift
//  ScreenSharing
//
//  Created by Mian Usama on 11/09/2024.
//

import SwiftUI
import StreamVideo
import StreamVideoSwiftUI

struct ScreenRecordingView: View {
    @Injected(\.streamVideo) var streamVideo
    @StateObject var callViewModel = CallViewModel()
    @State var callId = ""
    
    var body: some View {
        VStack(spacing: 10){
            TextField("Insert a call id", text: $callId)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            Button {
                resignFirstResponder()
                callViewModel.startCall(
                    callType: "default",
                    callId: callId,
                    members: [/* Your list of participants goes here. */]
                )
            } label: {
                Text("Start a call")
            }
            
            Button(action: {
                callViewModel.startScreensharing(type: .broadcast)
            }){
                Text("Start Sharing Screen!")
            }
        }
        .padding()
        .modifier(CallModifier(viewModel: callViewModel))
    }
}
