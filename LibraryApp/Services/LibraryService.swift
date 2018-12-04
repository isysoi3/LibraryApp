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
    
    func getAllBooks(token: Int, complitionHandler: @escaping (Result<[BookItem], LibraryServiceErrorEnum>) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            
            complitionHandler(.success([BookItem(id: 1, name: "test 231", isAvailable: false),
                               BookItem(id: 1, name: "test 231", isAvailable: false),
                               BookItem(id: 1, name: "test 231", isAvailable: true)]))
        }
    }
    
    
    func updateBookAvailebility(token: Int,
                                id: Int,
                                newValue: Bool,
                                complitionHandler: @escaping (Result<Bool, LibraryServiceErrorEnum>) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            complitionHandler(.success(true))
        }
    }
    
}
