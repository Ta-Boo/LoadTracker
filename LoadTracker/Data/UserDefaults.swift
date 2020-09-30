//
//  UserDefaults.swift
//  LoadTracker
//
//  Created by hladek on 30/09/2020.
//

import Foundation


enum UserDefaultsKey: String, CaseIterable  {
    case showOnboarding
    
    var defaultValue: Any {
        switch self {
        case .showOnboarding:
            return true
        }
    }
    
}

class AppCache {
    private static let cache = UserDefaults.standard
    
    static var showOnboarding: Bool {
        get {
            value(forKey: .showOnboarding) as? Bool ?? UserDefaultsKey.showOnboarding.defaultValue as! Bool
        }
        set {
            setValue(newValue, forKey: .showOnboarding)
        }
    }
    
    static func value(forKey key: UserDefaultsKey) -> Any {
        return cache.value(forKey: key.rawValue) ?? key.defaultValue
    }
    
    static  func setValue(_ value: Any, forKey key: UserDefaultsKey ) {
        cache.set(value, forKey: String(describing: key.rawValue))
    }
    
    
}

class LoaderConfiguration {
    
}
