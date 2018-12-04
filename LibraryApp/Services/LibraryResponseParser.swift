//
//  LibraryResponseParser.swift
//  LibraryApp
//
//  Created by Ilya Sysoi on 12/4/18.
//  Copyright © 2018 Ilya Sysoi. All rights reserved.
//

import Foundation
import AEXML
import Result

class LibraryResponseParser {
    
    private func parseBook() {
        
    }
    
    func parseAllBooksResponse(_ data: Data?) -> Result<[BookItem], LibraryService.LibraryServiceErrorEnum>{
        
        sleep(2)
        return .success(books)
    }
    
    func parseBookUpdateAvailability(_ data: Data?) -> Result<Bool, LibraryService.LibraryServiceErrorEnum> {
        
        sleep(1)
        return .success(true)
    }
 
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    var books = [BookItem(id: 1, name: "test book name 1", author: "test author name 1", isAvailable: false),
                 BookItem(id: 2, name: "test book name 2", author: "test author name 2", isAvailable: false),
                 BookItem(id: 3, name: "test book name 3", author: "test author name 3", isAvailable: true)]
    
    
}
