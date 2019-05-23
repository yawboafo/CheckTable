//
//  ViewController.swift
//  CheckTable
//
//  Created by Engineer 144 on 23/05/2019.
//  Copyright © 2019 Engineer 144. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    

    
    
    @IBOutlet weak var SampleTableview: UITableView!
    
    
    let colors =  ["HUBTEK","LIST","SIR","MOKO","TANOS","MESSI","KAKA","POPP","Red","Green","Yellow","White","Black","PINK","ASH","GOLD","BLUE","GRAY","PURPLE","ROTTEN","MAGGOT","LOG"]

    
    //TRACK SELECTED ITEMS MAKE SURE ITEMS STORED HERE ARE UNIQUE EXAMPLE USE AN ID
    var selectedItems : [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        
        
        SampleTableview.delegate = self
        SampleTableview.dataSource = self
        
        SampleTableview.reloadData()
        
    }

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SampleTableViewCell", for: indexPath) as! SampleTableViewCell
        
        
        
       /// This is very important
        
        //Check accessoryType if its not in selected items
       
        if selectedItems.contains(colors[indexPath.item]) {
            
            cell.accessoryType = .checkmark
            
        }else{
            
            
            //UnCheck accessoryType if its  in selected items
            
            cell.accessoryType = .none
        }
         cell.TitleLabel.text = colors[indexPath.item]
        
        
       
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectCell = tableView.cellForRow(at: indexPath) as! SampleTableViewCell
        let selectedCellValue = selectCell.TitleLabel.text
        
        
        //Track item to selectedItems ie append it
        self.selectedItems.append(selectedCellValue ?? "")
        
        
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        
        
        print(selectedItems)
        print(indexPath.item)
      
        
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
      
        
        let selectCell = tableView.cellForRow(at: indexPath) as! SampleTableViewCell
        let selectedCellValue = selectCell.TitleLabel.text
        
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
        
         //UnTrack item to selectedItems ie remove it
       if let index = selectedItems.index(of: selectedCellValue!) {
            selectedItems.remove(at: index)
        }
        
        
        print(selectedItems)
        print(indexPath.item)
    }
    
    
    
    @IBAction func printselected(_ sender: Any) {
        
        showAlertWithSelectedItems(items: selectedItems)
    }
    
    
    func showAlertWithSelectedItems(items : [String]){
        
        let alert = UIAlertController(title: "Alert", message: "\(items) \n and Count is \n \(items.count)", preferredStyle: .alert)
         alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

}

