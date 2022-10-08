//
//  Puzzle.swift
//  Puzzle
//
//  Created by Tatsuyuki Kobayashi on 2022/10/08.
//

import Foundation

public struct Puzzle {
    public static let rowCount = 4
    public static let columnCount = 4
    
    private var cells: [[Int?]]
    private var emptyCellPosition = (column: Self.columnCount - 1, row: Self.rowCount - 1)
    
    public var isFinished: Bool {
        var isFinished = true
        (0..<Self.columnCount).forEach { column in
            (0..<Self.rowCount).forEach { row in
                if column != (Self.columnCount - 1) || row != (Self.rowCount - 1) {
                    if cells[column][row] != column * Self.rowCount + row + 1 {
                        isFinished = false
                    }
                }
            }
        }
        return isFinished
    }
    
    public init() {
        cells = (0..<Self.columnCount).map { y in (0..<Self.rowCount).map { x in y * Self.rowCount + x + 1 } }
        cells[emptyCellPosition.column][emptyCellPosition.row] = nil
    }
    
    public mutating func randomize() {
        (0..<1000).forEach { _ in
            var fromColumn = 0
            var fromRow = 0
            var toColumn = 0
            var toRow = 0
            while fromColumn == toColumn && fromRow == toRow {
                fromColumn = Int.random(in: 0..<Self.columnCount)
                toColumn = Int.random(in: 0..<Self.columnCount)
                fromRow = Int.random(in: 0..<Self.rowCount)
                toRow = Int.random(in: 0..<Self.rowCount)
            }
            let temp = cells[fromColumn][fromRow]
            cells[fromColumn][fromRow] = cells[toColumn][toRow]
            cells[toColumn][toRow] = temp
        }
        (0..<Self.columnCount).forEach { column in
            (0..<Self.rowCount).forEach { row in
                if cells[column][row] == nil {
                    emptyCellPosition = (column: column, row: row)
                }
            }
        }
    }
    
    public mutating func move(column: Int, row: Int) {
        guard abs(emptyCellPosition.column - column) + abs(emptyCellPosition.row - row) == 1 else {
            return
        }
        cells[emptyCellPosition.column][emptyCellPosition.row] = cells[column][row]
        cells[column][row] = nil
        emptyCellPosition = (column: column, row: row)
    }
    
    public subscript(column: Int, row: Int) -> Int? {
        get {
            return cells[column][row]
        }
    }
}
