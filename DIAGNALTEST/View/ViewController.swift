//
//  ViewController.swift
//  DIAGNALTEST
//
//  Created by tejas chaudhari on 18/05/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var lbltitle: UILabel!
    
    var objVM: ViewModel?
    var pageNo : Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        objVM = ViewModel()
        objVM?.getdata(1)
        lbltitle.text = objVM?.titleLbl
        // Do any additional setup after loading the view.
    }

}

extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return objVM?.dispArr?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ViewControllerCVC
        cell.populateData(objVM?.dispArr?[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let wd = ((collectionView.frame.width / 3) - 10)
        let ht = ((wd * 7)/4)

        return CGSize(width: wd, height: ht)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == ((objVM?.dispArr?.count ?? 0) - 1){
            pageNo += 1
            objVM?.getdata(pageNo)
            collectionView.reloadData()
        }
    }

    
}

