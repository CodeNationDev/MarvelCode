//

import Foundation
import Network

protocol ConnectionManager {
    
    func start()
    func stop()
    func isReachable() -> Bool
}

protocol ConnectionManagerDelegate {
    func didChangeReachabilityStatus(status: NWPath.Status)
}

class ConnectionManagerImp: ConnectionManager {
    
    static let sharedInstance = ConnectionManagerImp()
    var delegate: ConnectionManagerDelegate?
    let pathMonitor = NWPathMonitor()
    let queue = DispatchQueue(label: "ReachabilityMonitor")

    private var reachable: Bool = true
    let serverMocks = ServerMock()
    
    init() {
        config()
        serverMocks.initMocks(type(of: self))
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
    
    func start() {
        
        pathMonitor.start(queue: queue)
    }
    
    func stop() {
        
        pathMonitor.cancel()
    }
    
    func isReachable() -> Bool {
        
        return self.reachable
    }
}
