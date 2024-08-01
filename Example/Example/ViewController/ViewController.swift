//
//  ViewController.swift
//  Example
//
//  Created by William.Weng on 2024/1/1.
//

import UIKit
import WWStringTransform

// MARK: - ViewController
final class ViewController: UIViewController {
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func hantHansConverter(_ sender: UIButton) {
        resultLabel.text = WWStringTransform.shared.convertText(messageLabel.text, type: .hantHans)
    }
    
    @IBAction func bopomofoConverter(_ sender: UIButton) {
        resultLabel.text = WWStringTransform.shared.convertText(messageLabel.text, type: .bopomofo)
    }
    
    @IBAction func englishConverter(_ sender: UIButton) {
        resultLabel.text = WWStringTransform.shared.convertText(messageLabel.text, type: .english)
    }

    @IBAction func latinConverter(_ sender: UIButton) {
        resultLabel.text = WWStringTransform.shared.convertText(messageLabel.text, type: .latin)
    }

    @IBAction func pinyinConverter(_ sender: UIButton) {
        resultLabel.text = WWStringTransform.shared.convertText(messageLabel.text, type: .pinyin)
    }
}

