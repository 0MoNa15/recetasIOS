//
//  URLImageView.swift
//  recetasIOS
//
//  Created by Zorayda Yadira Gutierrez Montes - Ceiba Software on 21/12/23.
//

import SwiftUI

struct URLImageView: View {
    private var imageUrl: String
    
    init(imageUrl: String) {
        self.imageUrl = imageUrl
    }
    
    var body: some View {
        AsyncImage(url: URL(string: "\(imageUrl)")) { phase  in
            switch phase {
            case .success(let image):
                image
                    .imageModifier()
            case .failure(_):
                Image(systemName: "fork.knife.fill")
                    .iconModifier()
            case .empty:
                ProgressView()
                    .background(.white)
            @unknown default:
                ProgressView()
                    .background(.white)
            }
        }
    }
}

#if DEBUG
struct URLImageView_Previews: PreviewProvider {
    static var previews: some View {
        URLImageView(imageUrl: "")
    }
}
#endif
