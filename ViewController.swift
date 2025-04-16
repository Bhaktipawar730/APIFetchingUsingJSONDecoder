//
// ViewController.swift
//  APIFetchingUsingJSONDecoder
//
//  Created by Mac on 15/04/25.
//
import UIKit
import SDWebImage

class ViewController: UIViewController {

    
    @IBOutlet var productTableView: UITableView!
    var products : [Product] = []
        var url : URL?
        var urlRequest : URLRequest?
        var urlSession : URLSession?
        
        override func viewDidLoad() {
            super.viewDidLoad()
            jsonParsing()
            productTableView.dataSource = self
            
            
        }
        
        private func jsonParsing(){
            
            url = URL(string : Constants.producturl)
            
            urlRequest = URLRequest(url: url!)
            urlSession = URLSession(configuration: .default)
            
          
            let dataTask = urlSession?.dataTask(with: urlRequest!) { data, response, error in
                
                guard let data = data else { return}
                do {
                
                    self.products = try! JSONDecoder().decode([Product].self, from: data)
                    
                    DispatchQueue.main.async {
                        self.productTableView.reloadData()
                    }
            }
                catch{
                    print("Error decoding JSON: \(error)")
                }
            }
            dataTask?.resume()
        }
    }

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = productTableView.dequeueReusableCell(withIdentifier: "cell") as? ProductTableViewCell
        cell?.idLabel.text = "ID = \(products[indexPath.row].id)"
        cell?.titleLabel.text = "Title =  \(products[indexPath.row].title)"
        cell?.priceLabel.text = "Price = \(products[indexPath.row].price)"

       //cell?.categoryLabel.text = products[indexPath.row].description
       // cell?.descriptionLabel.text = products[indexPath.row].description
       // cell?.rateLabel.text = "\(products[indexPath.row].rate)"//
        cell?.imgView.sd_setImage(with:URL(string: products[indexPath.row].image))
        
        return cell!
    }
}
    

