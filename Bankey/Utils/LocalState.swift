//
//  LocalState.swift
//  Bankey
//
//  Created by Mason Kim on 2023/01/23.
//

import Foundation

// ✨TIP: 상태값을 로컬로 저장하기 위한 Util - UserDefaults 활용
// TODO: 🤔왜 public 으로 선언했을까? -> 다른 모듈에서도 쓸 일이 있을 것 같아서..??
public class LocalState {
    private enum Keys: String {
        case hasOnboarded
    }

    // ✨TIP: 유저가 처음 앱을 키고 온보딩 단계를 거쳤는지 확인하기 위한 bool 상태값
    public static var hasOnboarded: Bool {
        get {
            return UserDefaults.standard.bool(forKey: Keys.hasOnboarded.rawValue)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Keys.hasOnboarded.rawValue)

            // UserDefaults.standard.synchronize()
            // ✨synchronize?: UserDefaults 에 기록된 값을 파일에 씀.
            // cf1) 호출하지 않아도 UserDefaults가 특정 인터벌이나 클래스 deinit 시를 기준으로 synchronize() 를 알아서 호출함. iOS 12 부터 불필요해 졌음!
            // cf2) 여러 값을 변경할 경우 마지막에 딱 한번만 synchronize() 를 호출하면 됨
        }
    }
}
