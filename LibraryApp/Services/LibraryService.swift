//
//  LibraryService.swift
//  LibraryApp
//
//  Created by Ilya Sysoi on 12/3/18.
//  Copyright © 2018 Ilya Sysoi. All rights reserved.
//

import Foundation
import Alamofire
import enum Result.Result

class LibraryService {
    
    enum LibraryServiceErrorEnum: Error {
        case invalidResponce
    }
    
    var books = [BookItem(id: 1, name: "test book name 1", author: "test author name 1", isAvailable: false),
                 BookItem(id: 2, name: "test book name 2", author: "test author name 2", isAvailable: false),
                 BookItem(id: 3, name: "test book name 3", author: "test author name 3", isAvailable: true)]
    
    func getAllBooks(token: Int, complitionHandler: @escaping (Result<[BookItem], LibraryServiceErrorEnum>) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            complitionHandler(.success(self.books))
        }
    }
    
    
    func updateBookAvailability(token: Int,
                                id: Int,
                                newValue: Bool,
                                complitionHandler: @escaping (Result<Bool, LibraryServiceErrorEnum>) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.books = self.books.map {
                if $0.id == id {
                    return BookItem(id: $0.id, name: $0.name, author: $0.author, isAvailable: newValue)
                }
                return $0
            }
            complitionHandler(.success(true))
        }
    }
    
}
