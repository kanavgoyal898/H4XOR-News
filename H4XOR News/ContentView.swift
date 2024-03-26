import SwiftUI

struct ContentView: View {
    var networkManager = NetworkManager()
    var body: some View {
        NavigationView {
            List {
                Text("hello, world")
            }
            .navigationTitle("H4XOR News")
            
        }
        .onAppear {
            self.networkManager.fetchData()
        }
    }
}


#Preview {
    ContentView()
}
