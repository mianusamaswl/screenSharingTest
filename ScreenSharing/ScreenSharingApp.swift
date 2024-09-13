//
//  ScreenSharingApp.swift
//  ScreenSharing
//
//  Created by Mian Usama on 11/09/2024.
//

import SwiftUI
import StreamVideo
import StreamVideoSwiftUI

@main
struct ScreenSharingApp: App {
    @State var streamVideo: StreamVideoUI?
    
    init(){
        setupStreamVideo(with: "5myqhth3ze8ucx8qsrprfgq9kxqjd3wcaf5h67nbzbejnnute862dsfs4antgnkr", userCredentials: .demoUser)
    }
    
    var body: some Scene {
        WindowGroup {
            ScreenRecordingView()
        }
    }
    
    private func setupStreamVideo(
        with apiKey: String,
        userCredentials: UserCredentials
    ){
        streamVideo = StreamVideoUI(
            apiKey: apiKey,
            user: userCredentials.user,
            token: userCredentials.token,
            tokenProvider: { result in
                result(.success(userCredentials.token))
            }
        )
    }
}


struct UserCredentials {
    let user: User
    let token: UserToken
}

extension UserCredentials {
    static let demoUser = UserCredentials(
        user: User(
            id: "testuser",
            name: "Test User",
            imageURL: URL(string: "https://vignette.wikia.nocookie.net/starwars/images/2/20/LukeTLJ.jpg")!,
            customData: [:]
        ),
        token: UserToken(rawValue: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdHJlYW0tdmlkZW8tZ29AdjAuMS4wIiwic3ViIjoidXNlci90ZXN0dXNlciIsImlhdCI6MTY2NjY5ODczMSwidXNlcl9pZCI6InRlc3R1c2VyIn0.h4lnaF6OFYaNPjeK8uFkKirR5kHtj1vAKuipq3A5nM0")
    )
}
