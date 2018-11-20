//
//  UEFATeamDetailViewController.swift
//  UEFAProject
//
//  Created by Marcos Garcia on 11/18/18.
//  Copyright © 2018 Marcos Garcia. All rights reserved.
//

import UIKit

class UEFATeamDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    
    @IBAction func dismissVC(_ sender: Any) {
        
        //self.navigationController?.popViewController(animated: true)
        
        //self.presentedViewController?.dismiss(animated: true, completion: nil)
        
        self.dismiss(animated: true, completion: nil)
        
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
