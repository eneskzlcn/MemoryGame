import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var game : EmojiMemoryGame
    var body: some View {
//        VStack {
//            ScrollView{
//                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
//                    ForEach(game.cards) { card in
        AspectVGrid(items: game.cards, aspectRatio: 2/3, content: { card in
            if card.isMatched && !card.isFaceUp {
                Rectangle().opacity(0)
            }
            CardView(card: card)
                .padding(3)
                .onTapGesture {
                    game.choose(card)
                }
        }
        )
        .foregroundColor(.green)
        .padding(.horizontal)
    }
    
}

struct CardView : View {
    let card : EmojiMemoryGame.Card

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                let shape = RoundedRectangle(cornerRadius: 20)
                if card.isFaceUp {
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: 2)
                    Pie(
                        startAngle: Angle(degrees: -90),
                        endAngle: Angle(degrees: 20)
                    ).padding(3).foregroundColor(.red).opacity(0.5)
                    Text(card.content).font(cardFont(in: geometry.size))
                }else if card.isMatched{
                    shape.opacity(0)
                }
                else {
                    shape.fill()
                }
            }
        }
    }
    
    private func cardFont(in size : CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * CardUIConstants.fontScale)
    }
    
    private struct CardUIConstants {
        static let cornerRadius : CGFloat = 10
        static let borderLineWidth : CGFloat = 3
        static let fontScale : CGFloat = 0.7
    }
}

















































struct EmojiMemoryGameView_Previews: PreviewProvider {
    static let game = EmojiMemoryGame()
    
    static var previews: some View {
        EmojiMemoryGameView(game:game)
            .preferredColorScheme(.light)
            .previewDevice("iPhone 12 mini")
.previewInterfaceOrientation(.portrait)
        EmojiMemoryGameView(game: game)
            .preferredColorScheme(.light)
            .previewDevice("iPhone 12 mini")
.previewInterfaceOrientation(.landscapeLeft)
        EmojiMemoryGameView(game: game)
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 12 mini")
    }
}
