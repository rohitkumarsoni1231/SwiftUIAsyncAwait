//
//  File.swift
//  SwiftUIAsyncAwait
//
//  Created by Rohit Kumar on 19/07/2024.
//

import Foundation

struct UserModel : Codable, Identifiable {
    let id : Int?
    let name : String?
    let username : String?
    let email : String?
    let address : Address?
    let phone : String?
    let website : String?
    let company : Company?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
        case username = "username"
        case email = "email"
        case address = "address"
        case phone = "phone"
        case website = "website"
        case company = "company"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        username = try values.decodeIfPresent(String.self, forKey: .username)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        address = try values.decodeIfPresent(Address.self, forKey: .address)
        phone = try values.decodeIfPresent(String.self, forKey: .phone)
        website = try values.decodeIfPresent(String.self, forKey: .website)
        company = try values.decodeIfPresent(Company.self, forKey: .company)
    }
    
    init(id: Int, name: String, username: String, email: String, address: Address, phone: String, website: String, company: Company) {
        self.id = id
        self.name = name
        self.username = username
        self.email = email
        self.address = address
        self.phone = phone
        self.website = website
        self.company = company
    }
}

struct Address : Codable {
    var street : String?
    let suite : String?
    let city : String?
    let zipcode : String?
    let geo : Geo?
    
    enum CodingKeys: String, CodingKey {
        
        case street = "street"
        case suite = "suite"
        case city = "city"
        case zipcode = "zipcode"
        case geo = "geo"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        street = try values.decodeIfPresent(String.self, forKey: .street)
        suite = try values.decodeIfPresent(String.self, forKey: .suite)
        city = try values.decodeIfPresent(String.self, forKey: .city)
        zipcode = try values.decodeIfPresent(String.self, forKey: .zipcode)
        geo = try values.decodeIfPresent(Geo.self, forKey: .geo)
    }
    
    init(street: String, suite: String, city: String, zipcode: String, geo: Geo) {
        self.street = street
        self.suite = suite
        self.city = city
        self.zipcode = zipcode
        self.geo = geo
    }
}

struct Company : Codable {
    let name : String?
    let catchPhrase : String?
    let bs : String?

    enum CodingKeys: String, CodingKey {

        case name = "name"
        case catchPhrase = "catchPhrase"
        case bs = "bs"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        catchPhrase = try values.decodeIfPresent(String.self, forKey: .catchPhrase)
        bs = try values.decodeIfPresent(String.self, forKey: .bs)
    }
    
    init(name: String, catchPhrase: String, bs: String) {
        self.name = name
        self.catchPhrase = catchPhrase
        self.bs = bs
    }
    
}

struct Geo : Codable {
    let lat : String?
    let lng : String?

    enum CodingKeys: String, CodingKey {

        case lat = "lat"
        case lng = "lng"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        lat = try values.decodeIfPresent(String.self, forKey: .lat)
        lng = try values.decodeIfPresent(String.self, forKey: .lng)
    }
    
    init(lat: String, lng: String) {
        self.lat = lat
        self.lng = lng
    }

}
