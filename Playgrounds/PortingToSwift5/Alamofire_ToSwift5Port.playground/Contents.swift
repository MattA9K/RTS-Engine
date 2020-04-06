import UIKit
import Alamofire
import SwiftyJSON

let flickrURL : String = "https://api.flickr.com/services/rest/";
let paramMethod : String = "?method=" + "flickr.photos.search";
let paramApiKey : String = "&api_key=" + "f261ce01c6ef9800656fc3a611fb2eb0";
let paramTags : String = "&tags=" + "travel";
let paramLat : String = "&lat=" + "40.2745569";
let paramLng : String = "&lon=" + "-75.1801831";
let paramFormat : String = "&format=" + "json&nojsoncallback=1";
let paramAccuracy : String = "&accuracy=" + "11";
let paramTagMode : String = "&tag_mode=" + "any";
let paramInGallery : String = "&in_gallery=" + "1";
let paramContentType : String = "&content_type=" + "1";

func toImageURI(farm: Int, server: String, secret: String, imageId: String) -> String {
    let flickrURI: String = "https://farm\(farm).staticflickr.com/\(server)/\(imageId)_\(secret).jpg";
    return flickrURI;
}

let finalURI = "\(flickrURL)" + "\(paramMethod)" + "\(paramApiKey)" +
    "\(paramTags)" + "\(paramLat)" + "\(paramLng)" + "\(paramFormat)" +
    "\(paramAccuracy)" + "\(paramTagMode)" + "\(paramInGallery)" + "\(paramContentType)"

print("\(finalURI)")
print("\nMAKING API REQUEST...\n\n")


AF.request(finalURI).responseJSON(completionHandler: { response in
    if let strJson = response.value {
        let jsonObj : JSON = JSON(strJson)
        print(jsonObj["photos"]["photo"])
        
        let totalPics = jsonObj["photos"]["photo"].array!.count
        for i in 0...(totalPics - 1) {
            
            let farm = jsonObj["photos"]["photo"][i]["farm"].int!
            let server = jsonObj["photos"]["photo"][i]["server"].string!
            let secret = jsonObj["photos"]["photo"][i]["secret"].string!
            let id = jsonObj["photos"]["photo"][i]["id"].string!
            let imageURI = toImageURI(farm: farm, server: server, secret: secret, imageId: id)
            print("\n\(imageURI)")
        }
        print("\n\nDONE!")
    }
})
