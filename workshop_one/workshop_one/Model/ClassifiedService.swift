import Foundation

actor ClassifiedService {
    func fetchClassifieds(in seconds: Double? = nil) async -> [Classified]{
        let time = UInt64((seconds ?? Double.random(in: 0...1)) * Double(NSEC_PER_SEC))
        try? await Task.sleep(nanoseconds: time)
        return Array(Classified.mocks.shuffled()[0...5])
    }
}
