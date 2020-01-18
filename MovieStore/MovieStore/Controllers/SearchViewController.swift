//
//  SearchViewController.swift
//  MovieStore
//
//  Created by Brahmastra on 13/01/20.
//  Copyright © 2020 Brahmastra. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchTable: UITableView!
        var selectedindexPath:Int = 0
        let myImg = UIImageView()
        var movies = [MovieInfo]()
        var tempArray:[String] = []
         var searchActive : Bool = false
         var filtered:[String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTable.delegate = self
        searchTable.dataSource = self
         searchBar.delegate = self
        JsonData.shareJson.jsonString(category: "search", page: 1)
        movies = JsonData.shareJson.movies
        print(tempArray)
        // Do any additional setup after loading the view.
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActive = true;
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false;
    }

    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

        filtered = tempArray.filter({ (text) -> Bool in
            let temporary: NSString = text as NSString
            let range = temporary.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
            return range.location != NSNotFound
        })
        if(filtered.count == 0){
            searchActive = false;
        } else {
            searchActive = true;
        }
        self.searchTable.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(searchActive) {
            return filtered.count
        }
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTablViewCell", for: indexPath) as! SearchTablViewCell
        tempArray.append(movies[indexPath.row].title)
        if(searchActive){
                   cell.searchResults?.text = filtered[indexPath.row]
               } else {
            
            cell.searchResults.text = movies[indexPath.row].title
            }

            return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           performSegue(withIdentifier: "SearchDetailsViewController", sender: self) 
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let nextTag = textField.tag + 1

        if let nextResponder = textField.superview?.viewWithTag(nextTag) {
            nextResponder.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }

        return true
    }
}

