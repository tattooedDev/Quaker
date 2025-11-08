//
//  Feature.swift
//  Quaker
//
//  Created by Dennis Parussini on 08.11.25.
//

import Foundation
import SwiftData

@Model
final class Feature: Decodable {
    var mag: Double
    var place: String
    var time: Int
    var updated: Int
    var tz: Int?
    var url: URL
    var detail: String
    var felt: Int?
    var cdi: Double?
    var mmi: Double?
    var alert: String?
    var status: String
    var tsunami: Int
    var sig: Int
    var net: String
    @Attribute(.unique) var code: String
    var ids: String
    var sources: String
    var types: String
    var nst: Int?
    var dmin: Double?
    var rms: Double?
    var gap: Double?
    var magType: String
    var type: String
    
    enum CoddingKeys: String, CodingKey {
        case mag
        case place
        case time
        case updated
        case tz
        case url
        case detail
        case felt
        case cdi
        case mmi
        case alert
        case status
        case tsunami
        case sig
        case net
        case code
        case ids
        case sources
        case types
        case nst
        case dmin
        case rms
        case gap
        case magType
        case type
    }
    
    init(
        mag: Double,
        place: String,
        time: Int,
        updated: Int,
        tz: Int?,
        url: URL,
        detail: String,
        felt: Int?,
        cdi: Double?,
        mmi: Double?,
        alert: String?,
        status: String,
        tsunami: Int,
        sig: Int,
        net: String,
        code: String,
        ids: String,
        sources: String,
        types: String,
        nst: Int?,
        dmin: Double?,
        rms: Double?,
        gap: Double?,
        magType: String,
        type: String
    ) {
        self.mag = mag
        self.place = place
        self.time = time
        self.updated = updated
        self.tz = tz
        self.url = url
        self.detail = detail
        self.felt = felt
        self.cdi = cdi
        self.mmi = mmi
        self.alert = alert
        self.status = status
        self.tsunami = tsunami
        self.sig = sig
        self.net = net
        self.code = code
        self.ids = ids
        self.sources = sources
        self.types = types
        self.nst = nst
        self.dmin = dmin
        self.rms = rms
        self.gap = gap
        self.magType = magType
        self.type = type
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CoddingKeys.self)
        self.mag = try container.decode(Double.self, forKey: .mag)
        self.place = try container.decode(String.self, forKey: .place)
        self.time = try container.decode(Int.self, forKey: .time)
        self.updated = try container.decode(Int.self, forKey: .updated)
        self.tz = try container.decodeIfPresent(Int.self, forKey: .tz)
        self.url = try container.decode(URL.self, forKey: .url)
        self.detail = try container.decode(String.self, forKey: .detail)
        self.felt = try container.decodeIfPresent(Int.self, forKey: .felt)
        self.cdi = try container.decodeIfPresent(Double.self, forKey: .cdi)
        self.mmi = try container.decodeIfPresent(Double.self, forKey: .mmi)
        self.alert = try container.decodeIfPresent(String.self, forKey: .alert)
        self.status = try container.decode(String.self, forKey: .status)
        self.tsunami = try container.decode(Int.self, forKey: .tsunami)
        self.sig = try container.decode(Int.self, forKey: .sig)
        self.net = try container.decode(String.self, forKey: .net)
        self.code = try container.decode(String.self, forKey: .code)
        self.ids = try container.decode(String.self, forKey: .ids)
        self.sources = try container.decode(String.self, forKey: .sources)
        self.types = try container.decode(String.self, forKey: .types)
        self.nst = try container.decodeIfPresent(Int.self, forKey: .nst)
        self.dmin = try container.decodeIfPresent(Double.self, forKey: .dmin)
        self.rms = try container.decodeIfPresent(Double.self, forKey: .rms)
        self.gap = try container.decodeIfPresent(Double.self, forKey: .gap)
        self.magType = try container.decode(String.self, forKey: .magType)
        self.type = try container.decode(String.self, forKey: .type)
    }
}

struct FeatureDTO: Decodable, Sendable {
    let mag: Double
    let place: String
    let time: Int
    let updated: Int
    let tz: Int?
    let url: URL
    let detail: String
    let felt: Int?
    let cdi: Double?
    let mmi: Double?
    let alert: String?
    let status: String
    let tsunami: Int
    let sig: Int
    let net: String
    let code: String
    let ids: String
    let sources: String
    let types: String
    let nst: Int?
    let dmin: Double?
    let rms: Double?
    let gap: Double?
    let magType: String
    let type: String
}

struct FeatureCollection: Decodable, Sendable {
    struct FeatureWrapper: Decodable {
        let type: String
        let properties: FeatureDTO
    }
    
    let features: [FeatureWrapper]
}
