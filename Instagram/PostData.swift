//
//  PostData.swift
//  Instagram
//
//  Created by 上田　護 on 2018/08/17.
//  Copyright © 2018年 mamoru.ueda. All rights reserved.
// 

import UIKit
import Firebase
import FirebaseDatabase

class PostData: NSObject {
    var id: String?
    var image: UIImage?
    var imageString: String?
    var name: String?
    var caption: String?
    var date: Date?
    var likes: [String] = []
    var isLiked: Bool = false
    var comments: [String] = []
    var isCommented: Bool = false
    var tests: [String] = []
    
    init(snapshot: DataSnapshot, myId: String) {
        self.id = snapshot.key
        
        let valueDictionary = snapshot.value as! [String: Any]
        
        imageString = valueDictionary["image"] as? String
        image = UIImage(data: Data(base64Encoded: imageString!, options: .ignoreUnknownCharacters)!)
        
        self.name = valueDictionary["name"] as? String
        
        self.caption = valueDictionary["caption"] as? String
        
        let time = valueDictionary["time"] as? String
        self.date = Date(timeIntervalSinceReferenceDate: TimeInterval(time!)!)
        
        if let likes = valueDictionary["likes"] as? [String] {
            self.likes = likes
        }
        
        if let comments = valueDictionary["comments"] as? [String] {
            self.comments = comments
        }
        
        if let test = valueDictionary["test"] as? [String] {
            self.tests = test
        }

//        print("~~~~~~~~~~\(String(describing: valueDictionary["test"]))~~~~~~~~~~~~")

        //ユーザがいいねしたかどうかの判定
        for likeId in self.likes { //likes配列から自分のIDを検索
            if likeId == myId {
                print("DEBUG_PRINT: \(likeId)")
                self.isLiked = true
                break
            }
        }
        
        //ユーザがコメントしたかどうかの判定
//        for commentId in self.comments {
//            if commentId == myId {
//                print("DEBUG_PRINT: \(commentId)")
//                self.isCommented = true
//                break
//            }
//        }
    }
}
