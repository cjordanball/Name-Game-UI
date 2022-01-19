//
//  helpers.swift
//  NameGameUI
//
//  Created by Jordan Ball on 1/13/22.
//

import Foundation

extension Array {
    func pickSelection(count: Int) -> Array<Element> {
        var chosenArray = Array<Int>()
        var returnArray = Array<Element>()
        while chosenArray.count < 4 {
            let hotNumber = Int.random(in: 0...self.count-1)
            if chosenArray.contains(hotNumber) {
                continue
            }
            chosenArray.append(hotNumber)
        }
        for val in chosenArray {
            returnArray.append(self[val])
        }

        return returnArray
    }
}
