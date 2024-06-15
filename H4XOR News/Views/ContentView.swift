import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(networkManager.stories) { story in
                NavigationLink(destination: DetailView(url: story.url)) {
                    Text(story.title)
                }
            }
            .navigationTitle("H4XOR News")
            
        }
        .onAppear {
            self.networkManager.fetchStories { stories in
                print("results: \(stories.count)")
            }
        }
    }
}


#Preview {
    ContentView()
}
