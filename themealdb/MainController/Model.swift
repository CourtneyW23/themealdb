import Foundation

struct APIResource: Codable {
    let common: String
    let official: String
}

struct NativeName: Codable {
    let eng: APIResource
    let mlt: APIResource
}

struct Name: Codable {
    let common: String
    let official: String
    let nativeName: NativeName
}


struct Category: Codable {
    // let name: Name
    let categories: [Categories]

}

struct Categories: Codable {
    let idCategory: String
    let strCategory: String?
    let strCategoryDescription: String?
    let strCategoryThumb: URL?
    
}
