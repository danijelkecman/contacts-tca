//
//  ContactsTcaApp.swift
//  ContactsTca
//
//  Created by Danijel Kecman on 8/5/23.
//

import SwiftUI
import ComposableArchitecture

@main
struct ContactsTcaApp: App {
  let store  = Store(initialState: ContactsFeature.State()) {
    ContactsFeature()
  }
  var body: some Scene {
    WindowGroup {
      ContactsView(store: store)
    }
  }
}
