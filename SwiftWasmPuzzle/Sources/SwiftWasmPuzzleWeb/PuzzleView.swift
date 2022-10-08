//
//  PuzzleView.swift
//  15puzzle
//
//  Created by Tatsuyuki Kobayashi on 2022/10/08.
//

import Foundation
import TokamakShim
import PuzzleLibrary

struct PuzzleView: View {
    @StateObject private var viewModel = PuzzleViewModel()
    
    var body: some View {
        VStack(spacing: 16) {
            Text("15 Puzzle")
                .foregroundColor(.black)
                .font(.title)
                .fontWeight(.bold)
            VStack(spacing: 0) {
                ForEach(0..<Puzzle.columnCount, id: \.self) { y in
                    HStack(spacing: 0) {
                        ForEach(0..<Puzzle.rowCount, id: \.self) { x in
                            Button(action: {
                                viewModel.onTapped(y: y, x: x)
                            }){
                                CellView(value: viewModel.puzzle[y, x])
                                    .frame(width: 60, height: 60)
                            }
                        }
                    }
                }
            }
            ZStack {
                if !viewModel.isStarted {
                    Button("Start", action: {
                        viewModel.onStart()
                    })
                } else if viewModel.isFinished {
                    Text("Finished!")
                        .foregroundColor(.red)
                } else {
                    Text("Now playing...")
                        .foregroundColor(.black)
                }
            }
            .font(.headline)
        }
        .padding()
    }
}

extension PuzzleView {
    private struct CellView: View {
        let value: Int?
        
        var body: some View {
            if let value {
                Rectangle()
                    .foregroundColor(Color.gray.opacity(0.2))
                    .border(Color.gray.opacity(0.8), width: 1)
                    .overlay(
                        Text("\(value)")
                            .font(.body)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                    )
            } else {
                Rectangle()
                    .foregroundColor(.white)
            }
        }
    }
}

//struct BoardView_Previews: PreviewProvider {
//    static var previews: some View {
//        BoardView()
//    }
//}
