//
//  ViewControllerCVC.swift
//  DIAGNALTEST
//
//  Created by tejas chaudhari on 19/05/22.
//

import UIKit

class ViewControllerCVC: UICollectionViewCell {
    @IBOutlet weak var imgPoster: UIImageView!
    @IBOutlet weak var lblPoster: UILabel!
    
    func populateData(_ data: Content?) {
        let img = data?.posterimage
        imgPoster.image = UIImage(named: img ?? "")
        lblPoster.text = data?.name
    }
}
