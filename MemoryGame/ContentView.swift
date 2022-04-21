import SwiftUI

struct ContentView: View {
    let viewModel : EmojiMemoryGame
    var body: some View {
        VStack {
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }.padding()
            }
            Spacer()
            HStack {
                removeBTN
                Spacer()
                addBTN
            }.padding()
        }
    }
    
    var removeBTN: some View {
        Button(action: {
            if emojiCount > 0{
                emojiCount-=1
            }
        }, label: {
            Text("Remove")
        })
    }
    
    var addBTN: some View {
        Button(action: {
            if emojiCount < emojis.count {
                emojiCount+=1
            }
        }, label: {
            Text("Add")
        })
    }
}

struct CardView : View {
    let card : MemoryGame<String>.Card
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 2)
                Text(card.content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            card.isFaceUp = !card.isFaceUp
        }
    }
}

















































struct ContentView_Previews: PreviewProvider {
    let game = EmojiMemoryGame()
    static var previews: some View {
        ContentView(game)
            .preferredColorScheme(.light)
            .previewDevice("iPhone 12 mini")
.previewInterfaceOrientation(.portrait)
        ContentView(game)
            .preferredColorScheme(.light)
            .previewDevice("iPhone 12 mini")
.previewInterfaceOrientation(.landscapeLeft)
        ContentView(game)
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 12 mini")
    }
}
