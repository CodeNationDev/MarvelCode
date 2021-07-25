//

import Foundation
import Network

public protocol ReachabilityManager {
    func start()
    func stop()
    func isReachable() -> Bool
}

public protocol ReachabilityManagerDelegate {
    func didChangeReachabilityStatus(status: NWPath.Status)
}

public let sharedReachabilityManager = ReachabilityManagerImp()

public class ReachabilityManagerImp: ReachabilityManager {
    public var delegate: ReachabilityManagerDelegate?
    let pathMonitor = NWPathMonitor()
    let queue = DispatchQueue(label: "ReachabilityMonitor")

    private var reachable: Bool = true
    
    init() {
        config()
    }
    
    func config() {
        pathMonitor.pathUpdateHandler = { path in
            switch path.status {
            case .satisfied:
                self.reachable = true
                self.delegate?.didChangeReachabilityStatus(status: .satisfied)
            case .unsatisfied:
                self.reachable = false
                self.delegate?.didChangeReachabilityStatus(status: .unsatisfied)
            case .requiresConnection:
                self.reachable = false
                self.delegate?.didChangeReachabilityStatus(status: .requiresConnection)
            default:
                self.reachable = false
                self.delegate?.didChangeReachabilityStatus(status: .unsatisfied)
            }
            print(path.isExpensive)
        }
    }
    
    public func start() {
        pathMonitor.start(queue: queue)
    }
    
    public func stop() {
        pathMonitor.cancel()
    }
    
    public func isReachable() -> Bool {
        return self.reachable
    }
}
