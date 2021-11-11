//
//  ArticleImageView.swift
//  TranspireCodingChallenge
//
//  Created by Sri Badrinath on 7/11/21.
//

import SwiftUI

struct ArticleImageView: View {
  
  @StateObject var viewModel: ArticleImageViewModel
  
  init(withId id: UUID, andUrl imageUrl: String) {
    _viewModel = StateObject(wrappedValue: ArticleImageViewModel(withImageId: id,
                                                                 andURL: imageUrl))
  }
  
  var body: some View {
    ZStack {
      if let image = viewModel.image {
        Image(uiImage: image)
          .resizable()
          .scaledToFit()
      }
      else if viewModel.isLoading {
        ProgressView()
      }
      else {
        Image(systemName: "questionmark")
          .foregroundColor(Color.gray)
      }
    }
  }
}

struct ArticleImageView_Previews: PreviewProvider {
    static var previews: some View {
      ArticleImageView(withId: UUID.init(),
                       andUrl: "https://live-production.wcms.abc-cdn.net.au/a617c545b388ce386c8c25be45b47075")
        .previewLayout(.sizeThatFits)
    }
}
