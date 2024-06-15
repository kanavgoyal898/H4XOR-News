import SwiftUI

struct ContentView: View {
    var stories = [Story]()
    var networkManager = NetworkManager()
    var body: some View {
        NavigationView {
            List {
                Text("hello, world")
            }
            .navigationTitle("H4XOR News")
            
        }
        .onAppear {
            self.networkManager.fetchStories { stories in
                print(stories)
            }
        }
    }
}


#Preview {
    ContentView()
}
