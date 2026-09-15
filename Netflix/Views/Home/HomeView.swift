import SwiftUI
import SDWebImageSwiftUI


struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()

    var body: some View {
        NavigationStack {
          ScrollView(showsIndicators: false) {
                if viewModel.isLoading {
                    ProgressView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    VStack {
                        if let featured = viewModel.featuredMovie {
                            HeroSection(movie: featured)
                        }

                        Spacer().frame(height: 50)

                        MoviesAndShowsView(viewModel: viewModel)
                            .padding(.all, 10)
                    }
                }
            }
            .refreshable {
                Task {
                    await viewModel.fetchAllContent()
                    await viewModel.fetchAllTVShows()
                }
            }

            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Image("LetterLogo")
                        .resizable()
                        .frame(width: 20, height: 32)
                }

                ToolbarItem(placement: .topBarTrailing) {
                    HStack(spacing: 20) {
                        Image(systemName: "airplayvideo")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.white)

                        Image("ProfileIcon")
                            .resizable()
                            .frame(width: 24, height: 24)
                    }
                }
            }
            .alert("Error", isPresented: $viewModel.showError) {
                Button("OK", role: .cancel) { }
            } message: {
                Text(viewModel.error?.localizedDescription ?? "An unknown error occurred")
            }
        }
    }
}


#Preview {
  HomeView()
    .preferredColorScheme(.dark)
}


// MARK: HERO Section





// MARK: - Updated Movies And Shows View


