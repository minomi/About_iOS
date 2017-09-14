//
//  HeapTests.swift
//  HeapTests
//
//  Created by 오민호 on 2017. 9. 12..
//  Copyright © 2017년 Minomi. All rights reserved.
//

import XCTest
@testable import SwiftAlgorithm

class HeapTests: XCTestCase {
    
    fileprivate func verifyMaxHeap(_ h: Heap<Int>) -> Bool {
        
        for i in 0 ..< h.count {
            
            let left = h.leftChildIndex(of: i)
            let right = h.rightChildIndex(of: i)
            let parent = h.parentIndex(of: i)
            
            if left < h.count && h.elements[i] < h.elements[left] { return false }
            if right < h.count && h.elements[i] < h.elements[right] { return false }
            if i > 0 && h.elements[parent] < h.elements[i] { return false }
            
        }
        
        return true
        
    }
    
    func testCreate() {
        
        let maxHeap = Heap<Int>(array: [27, 17, 3, 16, 13, 10, 1, 5, 7, 12, 4, 8, 9, 0], sort: >)
        XCTAssertEqual(maxHeap.elements, [27, 17, 10, 16, 13, 9, 1, 5, 7, 12, 4, 8, 3, 0])
        
        let minHeap = Heap<Int>(array: [27, 17, 3, 16, 13, 10, 1, 5, 7, 12, 4, 8, 9, 0], sort: <)
        XCTAssertEqual(minHeap.elements, [0, 4, 1, 5, 12, 8, 3, 16, 7, 17, 13, 10, 9, 27])
        
    }
    
    func testReplace() {
        
        var maxHeap = Heap<Int>(array: [27, 17, 3, 16, 13, 10, 1, 5, 7, 12, 4, 8, 9, 0], sort: >)
        XCTAssertTrue(verifyMaxHeap(maxHeap))
        XCTAssertEqual(maxHeap.elements, [27, 17, 10, 16, 13, 9, 1, 5, 7, 12, 4, 8, 3, 0])
        
        maxHeap.replace(0, value: 25)
        XCTAssertEqual(maxHeap.elements, [25, 17, 10, 16, 13, 9, 1, 5, 7, 12, 4, 8, 3, 0])
        
        maxHeap.replace(1, value: 27)
        XCTAssertEqual(maxHeap.elements, [27, 25, 10, 16, 13, 9, 1, 5, 7, 12, 4, 8, 3, 0])
        
        maxHeap.replace(5, value: 8)
        XCTAssertEqual(maxHeap.elements, [27, 25, 10, 16, 13, 8, 1, 5, 7, 12, 4, 8, 3, 0])
        
        maxHeap.replace(5, value: 2)
        XCTAssertEqual(maxHeap.elements, [27, 25, 10, 16, 13, 8, 1, 5, 7, 12, 4, 2, 3, 0])

        
    }
    
}
