// 
//  CustomToolbar.swift
//  
//
//  Created by Yuta S. on H30/04/28.
//  Copyright © 平成30年 Yuta S. All rights reserved.
//
//

import UIKit

class CustomToolbar: UIToolbar {
    /// 完了ボタンハンドラ
    var doneButtonHaundler: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setDefault()
    }
    
    required init(doneButtonHaundler: (() -> Void)?) {
        self.init()
        self.doneButtonHaundler = doneButtonHaundler
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        setDefault()
    }
    
    private func setDefault() {
        self.sizeToFit()
        // スペーサー
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        // 閉じるボタン
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTapped))
        self.items = [spacer, doneButton]
    }
    
    @objc func doneButtonTapped() {
        if let handler = doneButtonHaundler { handler() }
    }
}
