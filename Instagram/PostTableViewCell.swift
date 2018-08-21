//
//  PostTableViewCell.swift
//  Instagram
//
//  Created by 上田　護 on 2018/08/17.
//  Copyright © 2018年 mamoru.ueda. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var testLabel: UILabel!
    let homeViewController = HomeViewController()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setPostData(_ postData: PostData) {
        self.postImageView.image = postData.image
        
        self.captionLabel.text = "\(postData.name!) : \(postData.caption!)"
        let likeNumber = postData.likes.count
        likeLabel.text = "\(likeNumber)"
        
        let commentNumber = postData.comments.count
        commentLabel.text = "\(commentNumber)"

//        let tests = postData.tests
//        let name =  postData.name
//        print(postData.comments)
        testLabel.text?.removeAll()
        for commentText in postData.comments {
//            myLabel.text = myLabel.text?.stringByAppendingString("Swift!")
            testLabel.text = testLabel.text?.appendingFormat("\(String(describing: commentText))\n")
        }

//        testLabel.text = "\(String(describing: comments))"
        
//        testLabel.text = "\(String(describing: name)):\(comments)"

//        let homeViewController = HomeViewController()
//        let test = homeViewController.comments["test"]//comments["test"] as? String
//        print("--\(String(describing: test))--")
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        let dateString = formatter.string(from: postData.date!)
        self.dateLabel.text = dateString
        
        if postData.isLiked {
            let buttonImage = UIImage(named: "like_exist")
            self.likeButton.setImage(buttonImage, for: .normal)
        } else {
            let buttonImage = UIImage(named: "like_none")
            self.likeButton.setImage(buttonImage, for: .normal)
        }
        
//        if postData.isCommented {
//            let buttonImage = UIImage(named: "comment")
//            self.commentButton.setImage(buttonImage, for: .normal)
//        } else {
//            print("-------------------")
//            let buttonImage = UIImage(named: "like_none")
//            self.commentButton.setImage(buttonImage, for: .normal)
//        }
    }
}
