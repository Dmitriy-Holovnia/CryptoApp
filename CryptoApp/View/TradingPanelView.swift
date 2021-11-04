//
//  TradingPanelView.swift
//  CryptoApp
//
//  Created by Dmitriy Holovnia on 10/22/21.
//

import SwiftUI

struct TradingPanelView: View {
    
    @Binding var isPressented: Bool
    @GestureState private var dragState: DragState = .inactive
    @State private var positionOffset: CGFloat = 0.0
    @State private var viewState: ViewState = .half
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                
                Text("Some title")
                    .frame(maxWidth: .infinity)
                    .font(.headline)
                    .foregroundColor(.primary)
                
                ScrollView(.vertical, showsIndicators: false) {
                    Text("Header")
                    ForEach(0..<20) { index in
                        Text("Index \(index)")
                            .background(Color.red)
                            .padding(10)
                    }
                }
                .animation(nil)
                //                .disabled(viewState == .half || dragState.isDragging)
            }
            .background(Color.blue)
            .cornerRadius(10, antialiased: true)
            .offset(y: geometry.size.height / 2 +
                    dragState.translation.height +
                    positionOffset)
            .animation(.interpolatingSpring(stiffness: 200.0, damping: 25.0, initialVelocity: 10.0))
            .edgesIgnoringSafeArea(.all)
            .gesture(DragGesture()
                        .updating($dragState) { value, state, transaction in
                state = .dragging(translation: value.translation)
            }
                        .onEnded { (value) in
                switch viewState {
                case .half:
                    if value.translation.height < -geometry.size.height * 0.25 {
                        positionOffset = -geometry.size.height/2 + 50
                        viewState = .full
                    }
                    if value.translation.height > geometry.size.height * 0.3 {
                        isPressented = false
                    }
                case .full:
                    if value.translation.height > geometry.size.height * 0.25 {
                        positionOffset = 0
                        viewState = .half
                    }
                    if value.translation.height > geometry.size.height * 0.75 {
                        isPressented = false
                    }
                }
            }
            )
        }
    }
}

struct TradingPanelView_Previews: PreviewProvider {
    static var previews: some View {
        TradingPanelView(isPressented: .constant(true))
    }
}

enum ViewState {
    case full
    case half
}

enum DragState {
    
    case inactive
    case pressing
    case dragging(translation: CGSize)
    
    var translation: CGSize {
        switch self {
        case .inactive, .pressing:
            return .zero
        case .dragging(let translation):
            return translation
        }
    }
    
    var isDragging: Bool {
        switch self {
        case .pressing, .dragging:
            return true
        case .inactive:
            return false
        }
    }
}
