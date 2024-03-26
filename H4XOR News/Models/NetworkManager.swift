import Foundation

struct NetworkManager {
    func fetchData() {
        if let url = URL(string: "https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                    if error == nil {
                        let decoder = JSONDecoder()
                        if let safeData = data {
                            do {
                                let results = try decoder.decode([Int].self, from: safeData)
                                let stories = fetchPosts(results: results)
                                print(stories)
                            } catch {
                                print(error)
                            }
                        }
                    }
                }
            task.resume()
        }
    }
    
    func fetchPosts(results: [Int]) -> [Story] {
        let genericURL = "https://hacker-news.firebaseio.com/v0/item/"
        var stories = [Story]()
        let group = DispatchGroup()
        for i in results {
            if let url = URL(string: "\(genericURL)\(i).json?print=pretty") {
                group.enter()
                let session = URLSession(configuration: .default)
                let task = session.dataTask(with: url) { data, response, error in
                    if error == nil {
                        let decoder = JSONDecoder()
                        if let safeData = data {
                            do {
                            let story = try decoder.decode(Story.self, from: safeData)
                                stories.append(story)
                            } catch {
                                print(error)
                            }
                        }
                    }
                    group.leave()
                }
                task.resume()
            }
        }
        group.notify(queue: .main) {
            print(stories)
        }
        return stories
    }
}
