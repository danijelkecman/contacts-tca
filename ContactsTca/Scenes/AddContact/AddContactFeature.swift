//
//  AddContactFeature.swift
//  ContactsTca
//
//  Created by Danijel Kecman on 8/5/23.
//

import Foundation
import ComposableArchitecture

struct AddContactFeature: Reducer {
  struct State: Equatable {
    var contact: Contact
  }
  
  enum Action: Equatable {
    case cancelButtonTapped
    case delegate(Delegate)
    case saveButtonTapped
    case setName(String)
    enum Delegate: Equatable {
      case saveContact(Contact)
    }
  }
  
  @Dependency(\.dismiss) var dismis
  func reduce(into state: inout State, action: Action) -> Effect<Action> {
    switch action {
    case .cancelButtonTapped:
      return .run { _ in await self.dismis() }
      
    case .delegate:
      return .none
      
    case .saveButtonTapped:
      return .run { [contact = state.contact] send in
        await send(.delegate(.saveContact(contact)))
        await self.dismis()
      }
      
    case let .setName(name):
      state.contact.name = name
      return .none
    }
  }
}
