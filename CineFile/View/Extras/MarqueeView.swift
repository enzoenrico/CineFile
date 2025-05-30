import SwiftUI

struct WidthPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = max(value, nextValue())
    }
}

struct BannerView<Content: View>: View {
    let content: Content // conteudo da view que vai ficar em loop
    let animationDuration: Double // duração de 1 'volta' inteira

    @State private var contentWidth: CGFloat = 0
    @State private var isContentMeasured: Bool = false

		// 																			↓ passar componentes em props
    init(animationDuration: Double = 20.0, @ViewBuilder content: () -> Content) {
        self.animationDuration = animationDuration
        self.content = content()
    }

    var body: some View {
        let measurementView = self.content
            .background(
                GeometryReader { geo in
                    Color.clear.preference(key: WidthPreferenceKey.self, value: geo.size.width)
                }
            )

        VStack { 
            if isContentMeasured && contentWidth > 0 {
                TimelineView(.animation(minimumInterval: 0.016, paused: false)) { timelineContext in
                    let time = timelineContext.date.timeIntervalSinceReferenceDate
                    // Calculate progress from 0.0 to 1.0 over the animationDuration
                    let progress = (time.truncatingRemainder(dividingBy: animationDuration)) / animationDuration
                    // Calculate the offset to move the content to the left
                    let currentOffsetX = -progress * contentWidth

                    HStack(spacing: 0) { // No spacing between the two content blocks
                        self.content // First instance of the content
                        self.content // Second instance for seamless scroll
                    }
                    .offset(x: currentOffsetX)
                    // The total width of the two instances of content, aligned to the leading edge
                    .frame(width: contentWidth * 2, alignment: .leading)
                }
            } else {
                // Render the content once, hidden, purely for measurement.
                // It needs to be in the view hierarchy for GeometryReader to work.
                measurementView
                    .fixedSize(horizontal: true, vertical: false) // Ensure it takes its intrinsic width for measurement
                    .hidden() // Keep in layout tree but not visible
                    .frame(height: 0) // Collapse its height so it doesn't take up space while hidden
            }
        }
        .onPreferenceChange(WidthPreferenceKey.self) { width in
            if width > 0 && !self.isContentMeasured {
                self.contentWidth = width
                self.isContentMeasured = true // Mark as measured
            }
        }
        .enableInjection()
    }

    #if DEBUG
    @ObserveInjection var forceRedraw
    #endif
}