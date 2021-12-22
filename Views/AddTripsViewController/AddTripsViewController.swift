//
//  AddTripsViewController.swift
//  ItineraryApp
//
//  Created by Nguyễn Đình Trung Đức on 20/12/2021.
//

import Photos
import UIKit

class AddTripsViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tripTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    var doneSaving: (() -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.font = UIFont(name: Theme.mainFontName, size: 24)
        imageView.layer.cornerRadius = 20
        
        // button color
        saveButton.tintColor = Theme.background
        cancelButton.tintColor = Theme.background
        
        // dropshadow on title
        titleLabel.layer.shadowOpacity = 1
        titleLabel.layer.shadowColor = UIColor.white.cgColor
        titleLabel.layer.shadowOffset = CGSize.zero
        titleLabel.layer.shadowRadius = 5
    }

    
    @IBAction func cancel(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func save(_ sender: UIButton) {
        tripTextField.rightViewMode = .never
        
        guard tripTextField.text != "", let newTripName = tripTextField.text else {
//            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 20))
//            imageView.image = UIImage(named: "warn")
//            imageView.contentMode = .scaleAspectFit
//
//            tripTextField.rightView = imageView
            // alternatives
            
            tripTextField.layer.borderColor = UIColor.red.cgColor
            tripTextField.layer.borderWidth = 1
            tripTextField.layer.cornerRadius = 5
            
            tripTextField.placeholder = "Trip name required"
            
            tripTextField.rightViewMode = .always
            return
        }
        
        TripFunction.createTrip(tripModel: TripModel(title: newTripName, image: imageView.image))
        
        if let doneSaving = doneSaving {
            doneSaving()
        }
        dismiss(animated: true)
    }
    
    fileprivate func extractedFunc() {
        DispatchQueue.main.async {
            let myPickerController = UIImagePickerController()
            myPickerController.delegate = self
            myPickerController.sourceType = .photoLibrary
            self.present(myPickerController, animated: true)
        }
    }
    
    @IBAction func addButton(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            PHPhotoLibrary.requestAuthorization { (status) in
                switch status {
                case .authorized:
                    self.extractedFunc()
//                    self.present(myPickerController, animated: true)
                case .notDetermined:
                    if status == PHAuthorizationStatus.authorized {
                        self.extractedFunc()
                    }
                case .restricted:
                    if status == PHAuthorizationStatus.restricted {
                        let alert = UIAlertController(title: "Photo Library Restricted", message: "Photo Library access is restricted", preferredStyle: .alert)
                        let okAction = UIAlertAction(title: "OK", style: .default)
                        alert.addAction(okAction)
                        DispatchQueue.main.async {
                            self.present(alert, animated: true)
                        }
                    }
                case .denied:
                    if status == PHAuthorizationStatus.denied {
                        let alert = UIAlertController(title: "Photo Library Denied", message: "Photo Library access is denied", preferredStyle: .alert)
                        let goToSettingsAction = UIAlertAction(title: "Go to settings", style: .default) { (action) in
                            DispatchQueue.main.async {
                                let url = URL(string: UIApplication.openSettingsURLString)!
                                UIApplication.shared.open(url, options: [:])
                            }
                        }
                        
                        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
                        
                        alert.addAction(goToSettingsAction)
                        alert.addAction(cancelAction)
                        DispatchQueue.main.async {
                            self.present(alert, animated: true)
                        }
                    }
                default:
                    break
                }
            }
        }
    }
    
    
}

extension AddTripsViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            self.imageView.image = image
            
            // aspect to fill the image
        }

        dismiss(animated: true, completion: nil)
    }
}
