//
//  ViewModel.swift
//  DIAGNALTEST
//
//  Created by tejas chaudhari on 19/05/22.
//

import Foundation

class ViewModel {
    
    var dispArr: [Content]? = []
    var titleLbl : String?
    
    func getdata (_ pgNo : Int) {
        let text = "CONTENTLISTINGPAGE-PAGE\(pgNo)"
        if let localData = self.readLocalFile(forName: text) {
            self.parse(jsonData: localData)
        }
    }
    
    private func readLocalFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name, ofType: "json"),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }
        
        return nil
    }
    
    private func parse(jsonData: Data) {
        do {
            let resp = try JSONDecoder().decode(Model_Data.self, from: jsonData)
            let arr = resp.page?.contentitems?.content ?? []
            self.dispArr?.append(contentsOf: arr)
            self.titleLbl = resp.page?.title
        } catch {
            print("decode error")
        }
    }
    
}
