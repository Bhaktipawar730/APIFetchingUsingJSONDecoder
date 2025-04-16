# APIFetchingUsingJSONDecoder

The **APIFetchingUsingJSONDecoder** iOS App is a simple and effective project built using Swift and UIKit to demonstrate how to fetch and display product data from an API using `URLSession` and the `JSONDecoder`. It uses a single view controller that sends a GET request to a fake store API and presents the parsed data in a table view. Each row in the table view displays a product's ID, title, price, and image using a custom table view cell. The images are loaded asynchronously with the help of the SDWebImage library.

This project is helpful for understanding how to perform API calls, decode JSON into model objects using the `Decodable` protocol, and display data in a clean, scrollable list using `UITableView`. It also shows how to work with nested JSON structures and integrate external libraries using CocoaPods.

## Features

- Sends a GET request to a public API: `https://fakestoreapi.com/products`
- Uses `URLSession` for asynchronous API calls
- Parses JSON data into a custom model using `JSONDecoder` and `Decodable`
- Handles nested JSON (rating details) with a custom initializer
- Displays data in a scrollable `UITableView`
- Loads images asynchronously using **SDWebImage**
- Uses a custom `UITableViewCell` to display product ID, title, price, and image
- Manages API URL through a dedicated `Constants` file
- Follows MVC architecture for better code separation

## Dependencies

- [SDWebImage](https://github.com/SDWebImage/SDWebImage) – Used for downloading and caching images asynchronously.


## Screenshots
![1 (1) copy](https://github.com/user-attachments/assets/e74fb5aa-fa4c-4390-b125-f0a849635f14)













