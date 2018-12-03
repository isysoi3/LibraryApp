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
    
    func onViewDidLoad(view: BookListViewProtocol) {
        self.view = view
    }
    
}
