//
//  ViewController.swift
//  ZestySwiftContentEndpointWrapper
//
//  Created by ronakdev on 07/19/2018.
//  Copyright (c) 2018 ronakdev. All rights reserved.
//

import UIKit
import ZestySwiftContentEndpointWrapper

class ViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    var api: ZestySwiftContentEndpointWrapper!
    var testsPassed = 0
    var totalTests = 14
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textView.text = "Initializing Tests..."
        
        api = ZestySwiftContentEndpointWrapper(url: "http://burger.zesty.site")
        
        // MARK: getItem tests
        // test 1
        api.getItem(for: "doesn't exist") { (data, error) in
            let text = "Testing getItem with zuid: doesn't exist"
            if error != nil {
                self.passTest() //supposed to be an error
            }
            else {
                self.appendToTextView([text, data])
            }
        }
        // test 2
        api.getItem(for: "7-6a1ece9-8bn013") { (data, error) in
            let text = "Testing getItem with zuid: 7-6a1ece9-8bn013"
            if error != nil {
                self.appendToTextView([text, error!])
            }
            else {
                self.passTest()
            }
        }
        // test 3
        api.getItem(for: "6-ca7ed0-bx3vpj") { (data, error) in
            let text = "Testing getItem with zuid: 6-ca7ed0-bx3vpj"
            if error != nil {
                self.appendToTextView([text, error!])
            }
            else {
                self.passTest()
            }
        }
        
        // MARK: getArray tests
        // test 1
        api.getArray(for: "doesn't exist") { (data, error) in
            let text = "Testing getArray with zuid: doesn't exist"
            if error != nil {
                // success, supposed to error
            }
            else {
                self.appendToTextView([text, data])
            }
        }
        // test 2
        api.getArray(for: "7-6a1ece9-8bn013") { (data, error) in
            let text = "Testing getArray with zuid: 7-6a1ece9-8bn013"
            if error != nil {
                self.appendToTextView([text, error!])
            }
            else {
                self.passTest()
            }
        }
        // test 3
        api.getArray(for: "6-ca7ed0-bx3vpj") { (data, error) in
            let text = "Testing getArray with zuid: 6-ca7ed0-bx3vpj"
            if error != nil {
                self.appendToTextView([text, error!])
            }
            else {
                self.passTest()
            }
        }
        // test 4
        api.getArray(for: "6-4ea27c-45qz75") { (data, error) in
            let text = "Testing getARray with zuid: 6-4ea27c-45qz75"
            if error != nil {
                self.appendToTextView([text, error!])
            }
            else {
                self.passTest()
            }
            
        }
        // MARK: getCustomJSONData tests
        // test 1
        var endpoint = "/-/custom/menulist"
        var params: [String:String]! = nil
        api.getCustomJSONData(from: endpoint, params: params) { (data, error) in
            let text = "Testing getCustomData with endpoint \(endpoint) and params \(params)"
            if error != nil {
                self.appendToTextView([text, error!])
            }
            else {
                self.passTest()
            }
        }
        // test 2
        endpoint = "/-/custom/menulist"
        params = ["location" : "San Diego"]
        api.getCustomJSONData(from: endpoint, params: params) { (data, error) in
            let text = "Testing getCustomData with endpoint \(endpoint) and params \(params)"
            if error != nil {
                self.appendToTextView([text, error!])
            }
            else {
                self.passTest()
            }
        }
        // test 3
        endpoint = "/-/custom/menulist"
        params = ["id" : "San Diego"]
        api.getCustomJSONData(from: endpoint, params: params) { (data, error) in
            let text = "Testing getCustomData with endpoint \(endpoint) and params \(params)"
            if error != nil {
                self.appendToTextView([text, error!])
            }
            else {
                self.passTest()
            }
        }
        // test 4
        endpoint = "/-/custom/sjfkldsjfsd"
        params = ["location" : "San Diego"]
        api.getCustomJSONData(from: endpoint, params: params) { (data, error) in
            let text = "Testing getCustomData with endpoint \(endpoint) and params \(params)"
            if error != nil {
                self.appendToTextView([text, error!])
            }
            else {
                self.passTest()
            }
        }
        
        // MARK: getCustomData tests
        // test 1
        endpoint = "/-/custom/event.ics"
        params = ["id" : "7-6a0c3ae-dz5cmr"]
        api.getCustomData(from: endpoint, params: params) { (data, error) in
            let text = "Testing getCustomData with endpoint event.ics and params \(params)"
            if error != nil {
                self.appendToTextView([text, error!])
            }
            else {
                self.passTest()
            }
        }
        // test 2 (uses getImage as well)
        endpoint = "/-/custom/image" // created to look as the above code details
        let parameters = ["id" : "3-6a1c0cb-cgo7w"]
        api.getCustomJSONData(from: endpoint, params: parameters) { (json, error) in
            if (error != nil) {
                // error handling
                return
            }
            let imageURLString = json["url"].stringValue
            self.api.getImage(for: imageURLString) { (image, error) in
                if (error == nil) {
                    //let imageView = UIImageView(image: image!)
                    //self.view.addSubview(imageView)
                }
            }
        }
    }
    
    func passTest() {
        self.testsPassed += 1
        self.appendToTextView(["Passed Test, Total Tests Passed: \(self.testsPassed)"])
        if self.testsPassed >= self.totalTests {
            self.appendToTextView(["All Tests Passed!"])
        }
    }
    func appendToTextView(_ string: [Any]) {
        var text = ""
        string.forEach { (thing) in
            text = ("\n" + "\(string)")
        }
        self.textView.text = self.textView.text + text
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
