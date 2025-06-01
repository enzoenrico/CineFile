import SwiftUI

struct Background: View {
    let size: (width: CGFloat?, height: CGFloat?) 

    init(size: (width: CGFloat?, height: CGFloat?) = (width: nil, height: nil)) {
        if let newWidth = size.width, let newHeight = size.height {
            self.size = (width: newWidth, height: newHeight)
        } else if let newWidth = size.width {
            self.size = (width: newWidth, height: UIScreen.main.bounds.height)
        } else if let newHeight = size.height {
            self.size = (width: UIScreen.main.bounds.width, height: newHeight)
        } else {
            self.size = (width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 2 )
        }
    }

    var body: some View {
        VStack {
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .background(
            LinearGradient(
                colors: [.background, .bgGradientAccent], startPoint: .center, endPoint: .bottomTrailing
            )
            .overlay {
                TimelineView(.animation(minimumInterval: 0.016, paused: false)) { timelineContext in
                    Canvas { context, size in
                        let gridSize: CGFloat = 30  
                        let width = size.width
                        let height = size.height

                        let animationDuration: Double =  1.5
                        let currentTime = timelineContext.date.timeIntervalSinceReferenceDate
                        
                        let cycleProgress = (currentTime.truncatingRemainder(dividingBy: animationDuration)) / animationDuration
                        
                        let currentOffset = cycleProgress * gridSize

                        // Draw vertical lines
                        // Iterate from 0 up to width + gridSize to ensure the canvas is always covered
                        // as lines shift due to the offset.
                        for xBase in stride(from: CGFloat(0), to: width + gridSize, by: gridSize) {
                            // Apply the offset to move lines left
                            let x = xBase - currentOffset
                            var path = Path()
                            path.move(to: CGPoint(x: x, y: 0))
                            path.addLine(to: CGPoint(x: x, y: height))
                            context.stroke(path, with: .color(.grid), lineWidth: 0.4)
                        }

                        // Draw horizontal lines
                        // Iterate from 0 up to height + gridSize for similar reasons.
                        for yBase in stride(from: CGFloat(0), to: height + gridSize, by: gridSize) {
                            // Apply the offset to move lines up
                            let y = yBase - currentOffset
                            var path = Path()
                            path.move(to: CGPoint(x: 0, y: y))
                            path.addLine(to: CGPoint(x: width, y: y))
                            context.stroke(path, with: .color(.grid), lineWidth: 0.4)
                        }
                    }
                }
            }

        )
        .enableInjection()

    }
}
