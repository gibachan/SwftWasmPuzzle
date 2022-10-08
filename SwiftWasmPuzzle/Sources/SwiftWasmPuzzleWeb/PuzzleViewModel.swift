//
//  PuzzleViewModel.swift
//  15puzzle
//
//  Created by Tatsuyuki Kobayashi on 2022/10/08.
//

import Foundation
import TokamakDOM
import PuzzleLibrary

final class PuzzleViewModel: ObservableObject {
    @Published var puzzle = Puzzle()
    @Published var isStarted = false
    @Published var isFinished = false
    
    private var start: Date?
    
    func onStart() {
        isStarted = true
        puzzle.randomize()
    }
    
    func onTapped(y: Int, x: Int) {
        guard isStarted, !isFinished else { return }
        puzzle.move(column: y, row: x)
        isFinished = puzzle.isFinished
    }
}
