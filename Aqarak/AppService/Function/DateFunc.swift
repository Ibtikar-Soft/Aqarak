//
//  DateFunc.swift
//  Aqarak
//
//  Created by Sandal on 28/12/1442 AH.
//

import Foundation

extension Date
{
    func toString(dateFormat format: String ) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }

}
