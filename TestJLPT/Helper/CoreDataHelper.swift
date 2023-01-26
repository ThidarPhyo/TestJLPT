//
//  CoreDataHelper.swift
//  TestJLPT
//
//  Created by cmStudent on 12/01/2023.
//

import UIKit

class CoreDataHelper {
    static let shared = CoreDataHelper()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func fetchData() -> [List]? {
        do {
            return try self.context.fetch(List.fetchRequest())
        }catch {
            print("error \(error.localizedDescription)")
        }
        return nil
    }
    
    func saveData(title: String){
        let list = List(context: context)
        list.title = title
        do {
            try self.context.save()
        }catch {
            print("error \(error.localizedDescription)")
        }
    }
    func deleteData(index: Int){
        if let dataArray = fetchData() {
            context.delete(dataArray[index])
            do {
                try self.context.save()
            }catch {
                print("error \(error.localizedDescription)")
            }
        }
    }
}
