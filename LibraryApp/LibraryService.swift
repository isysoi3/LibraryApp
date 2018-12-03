//
//  LibraryService.swift
//  LibraryApp
//
//  Created by Ilya Sysoi on 12/3/18.
//  Copyright © 2018 Ilya Sysoi. All rights reserved.
//

import Foundation
//import enum Result.Result

class LibraryService {
    
    enum LibraryServiceErrorEnum: Error {
        case invalidResponce
    }
    
//    func getAllBooks(token: String, complitionHandler: (Result<[BookItem], LibraryServiceErrorEnum>) -> ()) {
//
//    }
    
    func getAllBooks(token: String, complitionHandler: @escaping ([BookItem]?) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            
            complitionHandler([BookItem(id: 1, name: "test 231", isAvailable: false),
                                BookItem(id: 1, name: "test 231", isAvailable: false),
                                BookItem(id: 1, name: "test 231", isAvailable: true)])
        }
    }
    
}
