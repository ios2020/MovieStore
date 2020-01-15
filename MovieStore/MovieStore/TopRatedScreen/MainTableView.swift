//
//  MainTableView.swift
//  MovieStore
//
//  Created by Brahmastra on 15/01/20.
//  Copyright © 2020 Brahmastra. All rights reserved.
//

import UIKit

class MainTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
   var setHeight = Bool()
    override func awakeFromNib() {
        self.delegate = self
        self.dataSource = self
    }
    
    override func numberOfRows(inSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        if row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell", for: indexPath) as! MainTableViewCell
            return  cell
            
        }
        else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PopularCell", for: indexPath) as! PopularCell
            if row == 1 {
                setHeight = true
            }
            return  cell
        }
    }
    

}
