//
//  ArticlesTableViewController.swift
//  SpaceNews
//
//  Created by Rana Mustafa on 25/06/2025.
//

import UIKit
import Kingfisher
class ArticlesTableViewController: UITableViewController  {
   
    let searchController = UISearchController(searchResultsController: nil)
    let api: ArticleAPIProtocol = ArticlesAPI()
    var articles : [Article] = []
    //pagination
    var currentOffset = 0
    let limit = 5
    var isFetching = false
    var reachedEnd = false
    
    var isSearching = false
    var searchQuery = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let downloader = KingfisherManager.shared.downloader
        downloader.downloadTimeout = 10
        fetchArticles()
        setUpSearchController()
        setUpTableViewCell()
        fetchArticles()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        searchController.searchBar.showsCancelButton = false

    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as! ArticleTableViewCell
        let article = articles[indexPath.row]
        cell.configure(with: article)
        return cell
    }
   

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - Article Service
    func fetchArticles(append : Bool = false) {
        guard !isFetching else { return
        }
        isFetching = true
        api.getArticles(limit: limit, offset: currentOffset, orderBy: "-published_at") { result in
            DispatchQueue.main.async {
                self.handleArticleResponse(result, append: append)
            }
        }
    }
    
    func searchArticles(query : String , append : Bool = false) {
        guard !isFetching else {
            return
        }
        isSearching = true
        isFetching = true
        api.searchArticles(by: query , offset: currentOffset) { (result) in
            DispatchQueue.main.async {
                self.handleArticleResponse(result, append: append)
            }
        }
    }
    
    
    func handleArticleResponse (_ result : Result<ArticleResponse, Error> , append : Bool ) {
        isFetching = false
        switch result {
        case.success(let response) :
            if response.results.isEmpty {
                self.reachedEnd = true
                return
            }
            if response.results.count < self.limit {
                self.reachedEnd = true
            }else {
            }
            if append {
                self.articles += response.results
            } else {
                self.articles = response.results
            }
            self.tableView.reloadData()
        case.failure(let error) :
            print(error.localizedDescription)
        }
        
    }
    // MARK: - ScrollView Pagination
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y // scroll vertical
        let contentHeight = scrollView.contentSize.height //total height of everything inside tableView
        let frameHeight = scrollView.frame.size.height // visible screen area(viewport)
        // if user has scrolled close to buttom (visible * 1.5 to loading early) && we ready to fetching data (false)
        let shouldLoadMore = position > (contentHeight - frameHeight * 1.5) && !isFetching && !reachedEnd
            if shouldLoadMore {
                currentOffset += limit
                if isSearching, !searchQuery.isEmpty {
                    searchArticles(query: searchQuery, append: true)
                } else {
                    fetchArticles(append: true)
                }
            }
        }
    
   private func setUpSearchController(){
       searchController.searchBar.delegate = self
       searchController.searchBar.searchBarStyle = .minimal
       searchController.searchBar.layer.cornerRadius = 10
       searchController.obscuresBackgroundDuringPresentation = false
       self.navigationItem.searchController = searchController
    }
    private func setUpTableViewCell() {
        tableView.register(UINib(nibName: "ArticleTableViewCell", bundle: nil), forCellReuseIdentifier: "ArticleCell")
    }
}
// MARK: - UISearchBarDelegate
extension ArticlesTableViewController : UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(true, animated: true)
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
            searchBar.setShowsCancelButton(false, animated: true)
        }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let query = searchBar.text , !query.trimmingCharacters(in: .whitespaces).isEmpty else {
            resetSearch()
            return
        }
        performSearch(with: query)
        DispatchQueue.main.async {
            searchBar.resignFirstResponder()
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        resetSearch()
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            resetSearch()
           dismissSearch()
        }
    }
}
// MARK: - Private Search Methods

private extension ArticlesTableViewController {
    func performSearch (with query : String) {
        currentOffset = 0
        reachedEnd = false
        searchQuery =  query
        searchArticles(query: query)
    }
    func resetSearch() {
        print("reset to home")
        isSearching = false
        searchQuery = ""
        currentOffset = 0
        reachedEnd = false
        articles = []
        tableView.reloadData()
        fetchArticles()
    }
    func dismissSearch () {
        DispatchQueue.main.async { [weak self] in
                   self?.searchController.isActive = false
               }
    }
}
