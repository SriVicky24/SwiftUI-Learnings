//
//  ArticleImageView.swift
//  NewsFeed
//
//  Created by Sri Badrinath on 8/11/21.
//

import SwiftUI

struct ArticleImageView: View {
  @StateObject var viewModel: ArticleImageViewModel
  
  init(withId id: UUID, andImageUrl urlString: String) {
    _viewModel = StateObject(wrappedValue: ArticleImageViewModel(withImageId: id,
                                                                 andImageUrl: urlString))
  }
  
  var body: some View {
    ZStack {
      if let image = viewModel.image {
        Image(uiImage: image)
          .resizable()
          .aspectRatio(CGSize.init(width: UIScreen.main.bounds.width,
                                   height: 260),
                contentMode: .fit)
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
                     andImageUrl: "https://live-production.wcms.abc-cdn.net.au/a617c545b388ce386c8c25be45b47075")
      .previewLayout(.sizeThatFits)
  }
}
