import Foundation

// Структура для валюты
struct Currency: Decodable {
    let code: String?
    let name: String?
    let symbol: String?
}

// Структура для информации о DST (летнем времени)
struct DST: Decodable {
    let utcTime: String?
    let duration: String?
    let gap: Bool?
    let dateTimeAfter: String?
    let dateTimeBefore: String?
    let overlap: Bool?
    
    enum CodingKeys: String, CodingKey {
        case utcTime = "utc_time"
        case duration
        case gap
        case dateTimeAfter = "date_time_after"
        case dateTimeBefore = "date_time_before"
        case overlap
    }
}

// Структура для информации о часовом поясе
struct TimeZone: Decodable {
    let name: String?
    let offset: Int?
    let offsetWithDst: Int?
    let currentTime: String?
    let currentTimeUnix: Double?
    let isDst: Bool?
    let dstSavings: Int?
    let dstExists: Bool?
}

enum CodingKeys: String, CodingKey {
    case name
    case offset
    case offsetWithDst = "offset_with_dst"
    case currentTime = "current_time"
    case currentTimeUnix = "current_time_unix"
    case isDst = "is_dst"
    case dstSavings = "dst_savings"
    case dstExists = "dst_exists"
}

// Основная структура для данных IP
struct IPGeolocation: Decodable {
    let ip: String?
    let continentCode: String?
    let continentName: String?
    let countryCode2: String?
    let countryCode3: String?
    let countryName: String?
    let countryNameOfficial: String?
    let countryCapital: String?
    let stateProv: String?
    let stateCode: String?
    let district: String?
    let city: String?
    let zipcode: String?
    let latitude: String?
    let longitude: String?
    let isEU: Bool?
    let callingCode: String?
    let countryTLD: String?
    let languages: String?
    let countryFlag: String?
    let geonameID: String?
    let isp: String?
    let connectionType: String?
    let organization: String?
    let countryEmoji: String?
    let currency: Currency?
    let timeZone: TimeZone?
    
    enum CodingKeys: String, CodingKey {
        case ip
        case continentCode = "continent_code"
        case continentName = "continent_name"
        case countryCode2 = "country_code2"
        case countryCode3 = "country_code3"
        case countryName = "country_name"
        case countryNameOfficial = "country_name_official"
        case countryCapital = "country_capital"
        case stateProv = "state_prov"
        case stateCode = "state_code"
        case district
        case city
        case zipcode
        case latitude
        case longitude
        case isEU = "is_eu"
        case callingCode = "calling_code"
        case countryTLD = "country_tld"
        case languages
        case countryFlag = "country_flag"
        case geonameID = "geoname_id"
        case isp
        case connectionType = "connection_type"
        case organization
        case countryEmoji = "country_emoji"
        case currency
        case timeZone = "time_zone"
    }
}
