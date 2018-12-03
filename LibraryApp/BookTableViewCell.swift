//
//  BookTableViewCell.swift
//  LibraryApp
//
//  Created by Ilya Sysoi on 12/3/18.
//  Copyright © 2018 Ilya Sysoi. All rights reserved.
//

import UIKit

class BookTableViewCell: UITableViewCell {

    private var idLable: UILabel!
    private var nameLable: UILabel!
    private var orderOrReserveButton: UIButton!
    
    var id: Int {
        set {
            idLable.text = "\(newValue)"
        }
        get {
            return Int(idLable.text ?? "-1") ?? -1
        }
    }
    
    var name: String {
        set {
            nameLable.text = newValue
        }
        get {
            return nameLable.text!
        }
    }
    
    var isAvailebale: Bool {
        set {
            orderOrReserveButton.setTitle(newValue ? "Order" : "Return", for: .normal)
        }
        get {
            return orderOrReserveButton.titleLabel?.text == "Order"
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        idLable = UILabel()
        nameLable = UILabel()
        orderOrReserveButton = UIButton(type: .system)
        
        idLable.backgroundColor = .white
        idLable.textColor = .black
        
        nameLable.backgroundColor = .white
        nameLable.textColor = .black
        
        [idLable, nameLable, orderOrReserveButton].forEach {
            contentView.addSubview($0)
        }
        
        idLable.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(10)
        }
        
        nameLable.snp.makeConstraints { make in
            make.top.equalTo(idLable)
            make.left.equalTo(idLable.snp.right).offset(10)
            make.right.equalToSuperview().inset(10)
        }
        
        orderOrReserveButton.snp.makeConstraints { make in
            make.top.equalTo(nameLable.snp.bottom).offset(5)
            make.right.equalToSuperview().inset(10)
             make.height.equalTo(40)
            make.bottom.equalToSuperview().inset(10)
        }
        
    }
    
    
    
}