struct Story: Decodable, Identifiable {
    let id: Int
    let score: Int
    let title: String
    let url: String?
}
