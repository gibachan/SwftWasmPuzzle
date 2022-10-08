//
//  PuzzleViewModel.swift
//  SwftWasmPuzzleApp
//
//  Created by Tatsuyuki Kobayashi on 2022/10/08.
//

import Foundation
import PuzzleLibrary

final class PuzzleViewModel: ObservableObject {
    @Published var puzzle = Puzzle()
    @Published var isStarted = false
    @Published var isFinished = false
    @Published var timer = 0
    
    private var start: Date?
    
    func onStart() {
        isStarted = true
        puzzle.randomize()
        start = Date()
    }
    
    func onTick() {
        guard isStarted, let start else { return }
        timer = Int(Date().timeIntervalSince(start))
    }
    
    func onTapped(y: Int, x: Int) {
        guard isStarted, !isFinished else { return }
        puzzle.move(column: y, row: x)
        isFinished = puzzle.isFinished
    }
}
