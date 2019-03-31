import SwiftyJSON
import Alamofire

Alamofire.request("http://api.wimbo.me", method: .get).validate().responseJSON { response in
    switch response.result {
    case .success(let value):
        let json = JSON(value)
        print("JSON: \(json)")
    case .failure(let error):
        print(error)
    }
}
Alamofire.request("http://api.thewimbo.me/")

Alamofire.request("https://httpbin.org/get")

/*
{
    'genre': string,
    'tempo': string (slow, medium, or fast)
    'duration': string (for now) (short, medium, long)
} */

let parameters: Parameters = ["genre" : "jazz", "tempo" : "slow", "duration" : "short"]

    //hit the API
    Alamofire.request("http://api.thewimbo.me/").responseJSON { response in
    print("Request: \(String(describing: response.request))")   // original url request
    print("Response: \(String(describing: response.response))") // http url response
    print("Result: \(response.result)")                         // response serialization result
    
    if let json = response.result.value {
        print("JSON: \(json)") // serialized json response
    }
    
    if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
        print("Data: \(utf8Text)") // original server data as UTF8 string
    }
}




    //POST

Alamofire.request("http://api.thewimbo.me/generate_song", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
    print("Request: \(String(describing: response.request))")   // original url request
    print("Response: \(String(describing: response.response))") // http url response
    print("Result: \(response.result)")                         // response serialization result
    
    if let json = response.result.value {
        print("JSON: \(json)") // serialized json response
        print(JSON(json)["location"])//print link
    }
    
    if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
        print("Data: \(utf8Text)") // original server data as UTF8 string
    }
}


