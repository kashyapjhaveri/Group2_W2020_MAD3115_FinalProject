//
//  ListViewController.swift
//  Group2_W2020_MAD3115_FinalProject
//
//  Created by Kashyap Jhaveri on 2020-03-18.
//  Copyright © 2020 Kashyap Jhaveri. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    
    var contentTitle:[String]?;
    var contentToDisplay:[String]?;
    var viewControllerTitle:String?;
    
    @IBOutlet weak var lblTitle: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        lblTitle.text = viewControllerTitle;
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ListViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0{
            return "Personal Information"
        }
        return "";
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentToDisplay!.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell", for: indexPath);
        
        cell.textLabel?.text = contentTitle![indexPath.row];
        cell.detailTextLabel?.text = contentToDisplay![indexPath.row];
        return cell;
    }
    
    
    
}
