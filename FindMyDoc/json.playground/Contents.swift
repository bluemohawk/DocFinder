import UIKit

func someDocumentJSONBasedFunction() {
    
    guard let url = Bundle.main.url(forResource: "HCPS", withExtension: "json") else {
        return }
    
    do {
        
        let data = try Data(contentsOf: url)
        guard let doctors = try JSONSerialization.jsonObject(with: data, options:[]) as? [Any] else {
            return }
        
//        print(doctors)
        
        for doctor in  doctors {
        guard let aDoc = doctor as? [String: Any] else {return}
        guard let firstName = aDoc["City"] as? String else {return}
        print(firstName)
        }
 
    } catch {
        print("hello")
    }

}

someDocumentJSONBasedFunction()
