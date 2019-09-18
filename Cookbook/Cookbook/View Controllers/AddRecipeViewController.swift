//
//  AddRecipeViewController.swift
//  Cookbook
//
//  Created by Mitchell Budge on 9/17/19.
//  Copyright © 2019 Mitchell Budge. All rights reserved.
//

import UIKit

class AddRecipeViewController: UIViewController {

    //MARK: - Properties & Outlets
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var directionsTextView: UITextView!
    
    var pickerData: [String] = []
    var pickerSelection: String?
    var recipeController: RecipeController?
    
    //MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.dataSource = self
        pickerView.delegate = self
        pickerData = ["Thai", "Italian", "Mexican", "Japanese", "Chinese", "American", "Greek"]
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        guard let title = titleTextField.text,
            !title.isEmpty,
            let cuisine = pickerSelection,
            let directions = directionsTextView.text,
            !directions.isEmpty else { return }
        recipeController?.createRecipe(title: title, cuisine: cuisine, directions: directions)
        navigationController?.popViewController(animated: true)
    }

}

extension AddRecipeViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerSelection = pickerData[row]
    }
    
}
