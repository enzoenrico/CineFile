import SwiftUI

struct LandingView: View {
    var body: some View {
        ZStack {
            Background()
                .ignoresSafeArea()
            ScrollView {
                VStack {
                    Image("filme1")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width, height: 550)
                        .scaledToFit()
                    ZStack {
                        ZStack {
                            Color.pink  //isso é uma view
                            // :O
                            BannerView(animationDuration: 11.0) {  // Adjust animationDuration for speed
                                HStack {  // Spacing between items is handled by padding below
                                    ForEach(1...5, id: \.self) { _ in  // i is not used, so _
                                        Image(systemName: "staroflife.fill")
                                            .foregroundColor(.lightPink)
                                            .bold()
                                            .padding(.leading)  // Padding for spacing within the marquee item
                                            .padding(.trailing)  // Padding for spacing
                                        Text("filézinho em destaque")
                                            .foregroundColor(.lightPink)
                                            .font(.title)
                                            .bold()
                                            .fixedSize(horizontal: true, vertical: false)
                                            .padding(.trailing)  // Padding for spacing
                                            .padding(.leading)  // Padding for spacing within the marquee item
                                    }
                                }
                                // não colocar .frame!!
                            }
                        }
                        .frame(width: UIScreen.main.bounds.width * 2)
                        .background(.pink)
                        .rotationEffect(.degrees(354))
                        .offset(y: -35)

                        // This is the container for the infinitely scrolling banner
                        ZStack {
                            Color.lightPink  //isso é uma view
                            // :O

                            // Use MarqueeView for the scrolling content
                            BannerView(animationDuration: 15.0) {  // Adjust animationDuration for speed
                                // This HStack is the content that will scroll infinitely
                                HStack {  // Spacing between items is handled by padding below
                                    ForEach(1...5, id: \.self) { _ in  // i is not used, so _
                                        Image(systemName: "staroflife.fill")
                                            .foregroundColor(.pink)
                                            .bold()
                                            .padding(.leading)  // Padding for spacing within the marquee item
                                            .padding(.trailing)  // Padding for spacing
                                        Text("filézinho em destaque")
                                            .foregroundColor(.pink)
                                            .font(.title)
                                            .bold()
                                            .fixedSize(horizontal: true, vertical: false)
                                            .padding(.trailing)  // Padding for spacing
                                            .padding(.leading)  // Padding for spacing within the marquee item
                                    }
                                }
                                // não colocar .frame!!
                            }
                        }
                        .frame(width: UIScreen.main.bounds.width * 2)
                        // .clipped()  // Essential: clips the scrolling content to the frame
                        .rotationEffect(.degrees(6))  // Apply rotation to the whole marquee container
                        .offset(y: -35)  // Apply offset to the whole marquee container
                    }  // zstack do banner em movimento

                    //MARK: abaixo da imagem

                    VStack {
                        HStack {
                            Text("Os Incríveis")
                                .font(.title)
                                .bold()
                            Image(systemName: "star.fill")
                                .foregroundColor(.cta)
                                .font(.title2)
                        }
                        Text("2004 | Direção: Brad Bird | Roteiro: Brad Bird")
                            .font(.body)
                            .fontWeight(.light)

                        HStack(alignment: .center, spacing: 0) {
                            HStack {
                                Image(systemName: "person.circle.fill")
                                Image(systemName: "person.circle.fill")
                                    .offset(x: -17, y: 0)
                                    .foregroundColor(.blue)
                                Image(systemName: "person.circle.fill")
                                    .offset(x: -32, y: 0)
                                    .foregroundColor(.cta)
                            }
                            .border(.tint)
                            Text("Nat e 10 outros amigos recomendam esse filme")
                            .font(.caption2)
                            .foregroundColor(.cta)
                        }
                        
                        Button{

                        }label:{
                            HStack{
                                Image(systemName: "info.circle")

                            }
                            .font(.body)
                        }
                    }

                }
                .frame(height: UIScreen.main.bounds.height / 2)  // This might need adjustment based on content
                .padding(.top)
            }
        }
        .padding()
        .enableInjection()
    }

    #if DEBUG
        @ObserveInjection var forceRedraw
    #endif
}

#Preview {
    LandingView()
}
