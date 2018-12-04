//
//  LibraryRequestBuilder.swift
//  LibraryApp
//
//  Created by Ilya Sysoi on 12/4/18.
//  Copyright © 2018 Ilya Sysoi. All rights reserved.
//

import Foundation
import AEXML

class LibraryRequestBuilder {
    
    func getAllBooks(token: Int) -> String {
        
        let soapRequest = AEXMLDocument()
        let attributes = ["xmlns:xsi" : "http://www.w3.org/2001/XMLSchema-instance", "xmlns:xsd" : "http://www.w3.org/2001/XMLSchema"]
        let envelope = soapRequest.addChild(name: "soap:Envelope", attributes: attributes)
        envelope.addChild(name: "soap:Header")
        let body = envelope.addChild(name: "soap:Body")
        body.addChild(name: "token", value: "\(token)")
        
        
        return soapRequest.xml
    }
    
    func updateBookAvailability(token: Int, bookId: Int, newValue: Bool) -> String {
        
        let soapRequest = AEXMLDocument()
        let attributes = ["xmlns:xsi" : "http://www.w3.org/2001/XMLSchema-instance", "xmlns:xsd" : "http://www.w3.org/2001/XMLSchema"]
        let envelope = soapRequest.addChild(name: "soap:Envelope", attributes: attributes)
        envelope.addChild(name: "soap:Header")
        let body = envelope.addChild(name: "soap:Body")
        body.addChild(name: "token", value: "\(token)")
        let bookItem = body.addChild(name: "book")
        bookItem.addChild(name: "bookId", value: "\(bookId)")
        bookItem.addChild(name: "newValue", value: "\(newValue)")
        
        
        return soapRequest.xml
    }
    
}
