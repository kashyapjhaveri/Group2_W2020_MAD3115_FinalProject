//
//  dependentDetailsViewController.swift
//  Group2_W2020_MAD3115_FinalProject
//
//  Created by Kashyap Jhaveri on 2020-03-19.
//  Copyright © 2020 Kashyap Jhaveri. All rights reserved.
//

import UIKit

class dependentDetailsViewController: UIViewController {
    
    var nextVcTitle:String?;
    var contentTitle:[[String]]?;
    var contentHeaderTitle:[String]?;
    var contentToDisplay:[[String]]?;
        
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = nextVcTitle!;
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

extension dependentDetailsViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return contentHeaderTitle!.count;
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return contentHeaderTitle![section];
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentTitle![section].count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dependentDetailsTableViewCell", for: indexPath);
        
        cell.textLabel?.text = contentTitle![indexPath.section][indexPath.row];
        cell.detailTextLabel?.text = contentToDisplay![indexPath.section][indexPath.row];
        
        return cell;
    }
    
    
}
