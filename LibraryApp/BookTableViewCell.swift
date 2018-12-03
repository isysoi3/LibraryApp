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
    
    var onActionHandler: (() -> ())?
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        idLable = UILabel()
        nameLable = UILabel()
        orderOrReserveButton = UIButton(type: .system)
        
        orderOrReserveButton.addTarget(self,
                                       action: #selector(orderOrReserveButtonOnTouch),
                                       for: .touchUpInside)
        
        idLable.backgroundColor = .white
        idLable.textColor = .black
        idLable.font = UIFont.boldSystemFont(ofSize: 40)
        
        nameLable.backgroundColor = .white
        nameLable.textColor = .black
        nameLable.textAlignment = .left
        nameLable.numberOfLines = 0
        idLable.font = UIFont.systemFont(ofSize: 22)
        
        [idLable, nameLable, orderOrReserveButton].forEach {
            contentView.addSubview($0)
        }
        
        nameLable.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.left.equalTo(idLable.snp.right).offset(15)
            make.right.equalToSuperview().offset(-20)
        }
        
        idLable.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(10)
        }
        
        orderOrReserveButton.snp.makeConstraints { make in
            make.top.equalTo(nameLable.snp.bottom).offset(5)
            make.right.equalToSuperview().inset(10)
             make.height.equalTo(40)
            make.bottom.equalToSuperview().inset(10)
        }
        
    }
    
    
    @objc private func orderOrReserveButtonOnTouch(sender: UIButton) {
        onActionHandler?()
    }
    
}
