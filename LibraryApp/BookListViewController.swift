//
//  ViewController.swift
//  LibraryApp
//
//  Created by Ilya Sysoi on 12/3/18.
//  Copyright © 2018 Ilya Sysoi. All rights reserved.
//

import UIKit

class BookListViewController: UIViewController {

    private var booksTableView: UITableView!
    private var books: [BookItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

extension BookListViewController: BookListViewProtocol {
    
}
