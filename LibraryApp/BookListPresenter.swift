//
//  BookListPresenter.swift
//  LibraryApp
//
//  Created by Ilya Sysoi on 12/3/18.
//  Copyright © 2018 Ilya Sysoi. All rights reserved.
//

import Foundation

class BookListPresenter {
    
    private weak var view: BookListViewProtocol!
    private let service: LibraryService = LibraryService()
    
    func onViewDidLoad(view: BookListViewProtocol) {
        self.view = view
        getAllBooks()
    }
    
    func updateBookAvailebility(id: Int, newValue: Bool) {
        view.setActivityIndicatorVisibility(true)
        service.updateBookAvailebility(
            token: "fds",
            id: id,
            newValue: newValue) { [weak self] result in
                
                self?.view.setActivityIndicatorVisibility(false)
                guard let `self` = self else {
                    return
                }
                
                guard let value = result else {
                    self.view.showError()
                    return
                }
                
                if value {
                    self.view.showBooks([])
                    self.getAllBooks()
                } else {
                    self.view.showError()
                }
        }
    }
    
    func getAllBooks() {
        view.setActivityIndicatorVisibility(true)
        service.getAllBooks(token: "fs") { [weak self] result in
            self?.view.setActivityIndicatorVisibility(false)
            guard let `self` = self else {
                return
            }
            
            guard let value = result else {
                self.view.showError()
                return
            }
            
            self.view.showBooks(value)
            
        }
    }
    
}
