# H4XOR News

## Introduction

H4XOR News is a SwiftUI-based iOS application that fetches and displays top stories from Hacker News. This app demonstrates the usage of SwiftUI, Combine, and URLSession for building modern iOS applications with reactive programming.

### Preview

<div style="text-align: center;">
  <img src="./demo.png" alt="Preview" style="width: 50%;">
</div>

## Features

- **Top Stories Display:** Fetches and displays top stories from Hacker News.
- **Story Navigation:** Allows users to navigate to detailed views showing the story content in a WebView.
- **Modern SwiftUI Interface:** Utilizes SwiftUI for a responsive and modern user interface.
- **Reactive Data Fetching:** Uses Combine framework to handle asynchronous data fetching and updates.

## Code Structure

### Model

The `Story` struct represents a single story fetched from Hacker News, conforming to `Decodable` and `Identifiable` protocols.

### ViewModel

The `NetworkManager` class is an `ObservableObject` responsible for fetching story IDs and story details from the Hacker News API. It manages the data fetching process using `URLSession` and notifies the views of data updates using the `@Published` property wrapper.

### Views

- **ContentView:** The main view displaying a list of top stories. It uses `NavigationView` and `List` to display the stories and allows navigation to `DetailView` for story details.
- **DetailView:** A view that displays the content of a story in a WebView.
- **WebView:** A custom `UIViewRepresentable` that wraps a `WKWebView` to display web content.

## Conclusion

H4XOR News is a simple yet effective demonstration of how to build a modern iOS application using SwiftUI, Combine, and URLSession. It showcases how to fetch data from an API, manage state reactively, and build intuitive user interfaces with SwiftUI. This app can be a great starting point for developers looking to explore these technologies and build similar applications.

Feel free to explore the code and customize it further to add more features or integrate with other APIs. Happy coding!