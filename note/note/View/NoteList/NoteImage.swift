//
//  NoteImage.swift
//  note
//
//  Created by James on 2022/7/28.
//
import SwiftUI
import PencilKit

struct NoteImage: View {
    var document: NoteDocument
    @State var showCanvas = false
    @Environment(\.colorScheme) private var colorScheme: ColorScheme
    private var image: UIImage {
        document.entity.drawing.image(from: document.entity.drawing.bounds, scale: 1.0)
    }

    var body: some View {
        Button(action: { showCanvas = true },
               label: {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 190, height: 250)
                    .background(Color(UIColor.secondarySystemBackground))
                    
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .shadow(radius: 5.0)
        })
        .fullScreenCover(isPresented: $showCanvas) {
            NavigationView {
                Canvas(viewModel: CanvasViewModel(noteDocument: document))
            }
        }
        
    }
}

 struct NoteImage_Previews: PreviewProvider {
     static var previews: some View {
         NoteImage(document: NoteDocument.createTestData())
    }
 }
