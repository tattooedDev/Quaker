//
//  FeatureDB.swift
//  Quaker
//
//  Created by Dennis Parussini on 08.11.25.
//

import SwiftData

@ModelActor
actor FeatureDB {
    func saveFeatures(_ features: [FeatureDTO]) throws {
        for dto in features {
            let feature = Feature(
                mag: dto.mag,
                place: dto.place,
                time: dto.time,
                updated: dto.updated,
                tz: dto.tz,
                url: dto.url,
                detail: dto.detail,
                felt: dto.felt,
                cdi: dto.cdi,
                mmi: dto.mmi,
                alert: dto.alert,
                status: dto.status,
                tsunami: dto.tsunami,
                sig: dto.sig,
                net: dto.net,
                code: dto.code,
                ids: dto.ids,
                sources: dto.sources,
                types: dto.type,
                nst: dto.nst,
                dmin: dto.dmin,
                rms: dto.rms,
                gap: dto.gap,
                magType: dto.magType,
                type: dto.type
            )
            
            modelContext.insert(feature)
        }
        
        try modelContext.save()
    }
}
