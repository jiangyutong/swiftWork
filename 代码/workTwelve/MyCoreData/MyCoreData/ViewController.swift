//
//  ViewController.swift
//  MyCoreData
//
//  Created by jiang on 2018/12/15.
//  Copyright © 2018年 蒋宇童. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    
    @IBOutlet weak var tfPhone: UITextField!
    @IBOutlet weak var tfName: UITextField!
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
 let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        
    override func viewDidLoad() {
    
        super.viewDidLoad()
        print(NSHomeDirectory())
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func add(_ sender: Any) {
        let person = Person(context:context)
        person.name=tfName.text
        person.phone=tfPhone.text
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func del(_ sender: Any) {
        let fetch:NSFetchRequest<Person> = Person.fetchRequest()
        fetch.predicate = NSPredicate(format: "name=%@", tfName.text!)
        let persons = try? context.fetch(fetch)
        if let p = persons?.first
        {
            context.delete(p)
            appDelegate.saveContext()
            
        }
    }
    
    @IBAction func update(_ sender: Any) {
        let fetch:NSFetchRequest<Person> = Person.fetchRequest()
        fetch.predicate = NSPredicate(format: "name=%@", tfName.text!)
        let persons = try? context.fetch(fetch)
        if let p = persons?.first
        {
            p.phone=tfPhone.text
            
        }
    }
    @IBAction func query(_ sender: Any) {
        let fetch:NSFetchRequest<Person> = Person.fetchRequest()
        fetch.predicate = NSPredicate(format: "name=%@", tfName.text!)
        let persons = try? context.fetch(fetch)
        if let p = persons?.first
        {
            tfPhone.text=p.phone
        }
        print("yes")
    }
}

