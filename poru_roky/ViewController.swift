//  ViewController.swift
//  poru_roky
//
//  Created by theAngriestman on 06.12.2021.
//

import UIKit

class ViewController: UIViewController {


    var textContent = "" {
        didSet{
            textArea.text = textContent
        }
    }
    let mainUrl = "https://poryroky.pp.ua/"
    let login = "*********"
    let password = "********"
    

    
    @IBAction func openGate(_ sender: UIButton) {
        let url = URL(string: mainUrl)!

        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            DispatchQueue.main.async{
                self.textContent = String(data: data, encoding: .utf8) ?? ""
            }
            
        }

        task.resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let myColor = UIColor.blue
        textArea.layer.borderWidth = 1
        textArea.layer.borderColor = myColor.cgColor
    }
    
    @IBOutlet weak var textArea: UITextView!
}

