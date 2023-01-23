//
//  LocalState.swift
//  Bankey
//
//  Created by Mason Kim on 2023/01/23.
//

import Foundation

public class LocalState {
    private enum Keys: String {
        case hasOnboarded
    }

    public static var hasOnboarded: Bool {
        get {
            return UserDefaults.standard.bool(forKey: Keys.hasOnboarded.rawValue)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Keys.hasOnboarded.rawValue)
            UserDefaults.standard.synchronize()
            // ✨synchronize: UserDefaults 에 기록된 값을 파일에 씀.
            // cf1) 호출하지 않아도 UserDefaults가 특정 인터벌이나 클래스 deinit 시를 기준으로 synchronize() 를 알아서 호출하긴 함.
            // cf2) 여러 값을 변경할 경우 마지막에 딱 한번만 synchronize() 를 호출하면 됨
        }
    }
}
