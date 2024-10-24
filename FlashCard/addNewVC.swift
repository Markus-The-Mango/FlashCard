//
//  addNewVC.swift
//  FlashCard
//
//  Created by HPro2 on 10/22/24.
//

import UIKit

class addNewVC: UIViewController, UITextFieldDelegate {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var wordField: UITextField!
    
    @IBOutlet weak var definitionField: UITextField!
    
    @IBAction func addWord(_ sender: Any) {
        newWord()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.wordField.delegate = self
        self.wordField.becomeFirstResponder()
        // Do any additional setup after loading the view.
    }
    func newWord() {
            if let newWord = wordField.text{
                if newWord != ""{
                        let word = Word(context: context)
                        word.word = newWord
                        word.definition = definitionField.text
                    }
                    (UIApplication.shared.delegate as! AppDelegate).saveContext()
                    navigationController!.popViewController(animated: true)
                }
            
       
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
