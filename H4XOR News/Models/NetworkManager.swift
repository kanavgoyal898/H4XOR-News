import Foundation

class NetworkManager {
    var storyIDs = [Int]()
    var stories = [Story]()
    
    func fetchStories(completion: @escaping ([Story]) -> Void) {
        fetchData { [weak self] in
            guard let self = self else { return }
            
            let genericURL = "https://hacker-news.firebaseio.com/v0/item/"
            let group = DispatchGroup()
            
            for i in self.storyIDs {
                if let url = URL(string: "\(genericURL)\(i).json?print=pretty") {
                    group.enter()
                    let session = URLSession(configuration: .default)
                    let task = session.dataTask(with: url) { data, response, error in
                        if error == nil {
                            let decoder = JSONDecoder()
                            if let safeData = data {
                                do {
                                    let story = try decoder.decode(Story.self, from: safeData)
                                    self.stories.append(story)
                                } catch {
                                    print(error)
                                }
                            }
                        } else {
                            print(error?.localizedDescription ?? "Unresolved Issue")
                        }
                        group.leave()
                    }
                    task.resume()
                }
            }
            
            group.notify(queue: .main) {
                completion(self.stories)
            }
        }
    }
    
    func fetchData(completion: @escaping () -> Void) {
        if let url = URL(string: "https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            self.storyIDs = try decoder.decode([Int].self, from: safeData)
                            completion()
                        } catch {
                            print(error)
                        }
                    }
                } else {
                    print(error?.localizedDescription ?? "Unresolved Issue")
                }
            }
            task.resume()
        }
    }
    
    
}
