//
//  ViewController.swift
//  cocoapodspractice
//
//  Created by Natalie on 11/9/21.
//

import RealmSwift
import UIKit

class ViewController: UIViewController {

    let realm = try! Realm()
    override func viewDidLoad() {
        super.viewDidLoad()
        realm.beginWrite()
        realm.delete(realm.objects(Person.self))
        try! realm.commitWrite()
        
        save()
        render()
    }
    
    
    func render(){
        let people = realm.objects(Person.self)
        for person in people {
            let firstName = person.firstName
            let lastName = person.lastName
            let fullName = "\(firstName) \(lastName)"
            
            print("\(fullName)")
            
//            let label = UILabel(frame: view.bounds)
//            label.text = fullName
//            label.textAlignment = .center
//            label.numberOfLines = 0
//            view.addSubview(label)
//            label.font = UIFont(name: "Helvetica", size: 42)
        }
    }
    
    func save() {
        
        let harry = Person()
        harry.firstName = "Harry"
        harry.lastName = "Potter"
        let ron = Person()
        ron.firstName = "Ron"
        ron.lastName = "Weasley"
        let hermione = Person()
        hermione.firstName = "Hermione"
        hermione.lastName = "Granger"
        let draco = Person()
        draco.firstName = "Draco"
        draco.lastName = "Malfoy"
        
        realm.beginWrite()
        realm.add(draco)
        realm.add(harry)
        realm.add(hermione)
        realm.add(ron)
        try! realm.commitWrite()
    }

}

class Person: Object {
    @objc dynamic var firstName: String = ""
    @objc dynamic var lastName: String = ""
    @objc dynamic var age: Int = 0
    
}

