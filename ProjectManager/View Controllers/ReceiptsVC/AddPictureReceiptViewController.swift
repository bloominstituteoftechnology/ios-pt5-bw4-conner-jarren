//
//  AddPictureReceiptViewController.swift
//  ProjectManager
//
//  Created by Jarren Campos on 8/20/20.
//  Copyright © 2020 LambdaStudents. All rights reserved.
//

import UIKit

class AddPictureReceiptViewController: UIViewController {

    @IBOutlet var receiptPreviewImage: UIImageView!
    @IBOutlet var addImageButton: UIButton!
    
    var locationString: String = ""
    var dateString: String = ""
    
    var originalImage: UIImage? {
        didSet {
            guard let originalImage = originalImage else {
                return
            }
            receiptPreviewImage.image = originalImage
            var scaledSize = receiptPreviewImage.bounds.size
            let scale = UIScreen.main.scale
            
            scaledSize = CGSize(width: scaledSize.width*scale,
                                height: scaledSize.height*scale)
            addImageButton.setTitle("Change Image", for: .normal)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func presentImagePickerController() {
        guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else {
            print("The photo library is not available.")
            return
        }
        
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    func presentCamera() {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.delegate = self
        present(picker, animated: true)
    }

    @IBAction func addImagePressed(_ sender: Any) {
        photoAlertChoice(on: self, with: "Add photo", message: "Choose from your library or take a photo now.")
    }
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        if receiptPreviewImage.image == nil {
            Alert.showBasicAlert(on: self, with: "Photo Missing", message: "Please add photo to continue.")
        } else{
            performSegue(withIdentifier: "toDetailVC", sender: UIButton.self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC", let destination = segue.destination as? AddDetailsReceiptViewController {
            destination.locationString = locationString
            destination.dateString = dateString
            destination.imageViewPreview = receiptPreviewImage.image
        }
    }
    
    func photoAlertChoice(on vc: UIViewController, with title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Library", style: .default, handler: {
        _ in
            self.presentImagePickerController()
        }))
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: {
            _ in
            self.presentCamera()
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        vc.present(alert, animated: true)
    }
}

extension AddPictureReceiptViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[.editedImage] as? UIImage {
            originalImage = image
        } else if let image = info[.originalImage] as? UIImage {
            originalImage = image
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
}
