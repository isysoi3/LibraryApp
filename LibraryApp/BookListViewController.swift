//
//  ViewController.swift
//  LibraryApp
//
//  Created by Ilya Sysoi on 12/3/18.
//  Copyright © 2018 Ilya Sysoi. All rights reserved.
//

import UIKit
import SnapKit

class BookListViewController: UIViewController {

    private var booksTableView: UITableView!
    private var books: [BookItem] = [BookItem(id: 1, name: "test 231", isAvailable: false),
                                     BookItem(id: 1, name: "test 231", isAvailable: false),
                                     BookItem(id: 1, name: "test 231", isAvailable: true)]
    
    private let presenter = BookListPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        view.backgroundColor = .white
        
        booksTableView = UITableView()
        
        booksTableView.delegate = self
        booksTableView.dataSource = self
        booksTableView.register(BookTableViewCell.self, forCellReuseIdentifier: "BookCell")
        booksTableView.rowHeight = UITableView.automaticDimension
        
        view.addSubview(booksTableView)
        
        booksTableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
        presenter.onViewDidLoad(view: self)
    }


}

extension BookListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell") as? BookTableViewCell else {
            return UITableViewCell()
        }
        let bookItem = books[indexPath.row]
        
        cell.id = bookItem.id
        cell.name = bookItem.name
        cell.isAvailebale = bookItem.isAvailable
        
        return cell
    }
    
    
}

extension BookListViewController: BookListViewProtocol {
    
}
