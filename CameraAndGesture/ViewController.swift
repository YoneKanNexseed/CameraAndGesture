//
//  ViewController.swift
//  CameraAndGesture
//
//  Created by yonekan on 2019/03/05.
//  Copyright © 2019 yonekan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    var angle: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        // ImageViewにタップなどのジェスチャーイベントを許可する
        imageView.isUserInteractionEnabled = imageView.image != nil
    }
    
    // アルバムボタンがクリックされたときの処理
    @IBAction func didClickAlbumButton(_ sender: UIButton) {
        // アルバムのタイプ取得
        let sourceType = UIImagePickerController.SourceType.photoLibrary
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            // アルバムが使用可能の場合実行される
            
            // アルバムを選択する画面を作成
            let albumPicker = UIImagePickerController()
            
            // 作成した画面のカメラの種類にアルバムを設定
            albumPicker.sourceType = sourceType
            albumPicker.delegate = self
            
            // アルバムを選択する画面をモーダルで表示する
            self.present(albumPicker, animated: true, completion: nil)
        }
        
    }
    
    // アルバム選択、または写真撮影が終わったときの処理
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let tookImage = info[.originalImage] as? UIImage {
            // 撮影または選択された写真を取得
            // 画面のImageViewに写真を設定する
            imageView.contentMode = .scaleToFill
            imageView.image = tookImage
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    // 写真ボタンが押されたときのす処理
    @IBAction func didClickPhotoButton(_ sender: UIButton) {
        
        let sourceType = UIImagePickerController.SourceType.camera
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let cameraPicker = UIImagePickerController()
            cameraPicker.sourceType = sourceType
            cameraPicker.delegate = self
            self.present(cameraPicker, animated: true, completion: nil)
        } else {
            print("カメラを使用する権限がありません")
        }
        
    }
    
    @IBAction func tapGesture(_ sender: UITapGestureRecognizer) {
        print("タップされましたよ")
        
        // 画像を消す
        imageView.image = nil
    }
    
    
    @IBAction func rightSwipe(_ sender: UISwipeGestureRecognizer) {
        print("右にスワイプされました")
        
//        angle += 90
//        print(angle)
//        let angleResult = angle * CGFloat.pi / 180
//        let transRotate = CGAffineTransform(rotationAngle: CGFloat(angleResult))
//        imageView.transform = transRotate
//        imageView.transfo
//        imageView.isUserInteractionEnabled = true
    }
    
    
    @IBAction func leftSwipe(_ sender: UISwipeGestureRecognizer) {
        print("左にスワイプされました")
    }
    
}
