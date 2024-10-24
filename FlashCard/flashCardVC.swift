//
//  flashCardVC.swift
//  FlashCard
//
//  Created by HPro2 on 10/21/24.
//

import UIKit

class flashCardVC: UIViewController {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var words:[Word] = []
    var cardNumber = 0
    var onWord = true
    
    @IBAction func flipCard(_ sender: Any) {
        if onWord{
            onLabelTouch()
        }
        else{
            onDefinitionTouch()
        }
    }
    @IBOutlet weak var labelText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCoreData()
        loadCard()
        // Do any additional setup after loading the view.
        
    }
    
    func loadCard(){
        
        labelText.text = words[cardNumber].word
        onWord = true
        
    }
    func onLabelTouch(){
        
        labelText.text = words[cardNumber].definition
        onWord = false
    }
    
    func onDefinitionTouch(){
        cardNumber += 1
        if(cardNumber >= words.count){
            cardNumber = 0
        }
        loadCard()
    }
    
    func loadCoreData() {
        do{
            words = try context.fetch(Word.fetchRequest())
       }
        catch{
            print("Data not found")
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
