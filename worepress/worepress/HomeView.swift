//
//  HomeView.swift
//  worepress
//
//  Created by cafehaus on 2022/8/21.
//

import SwiftUI


struct Joke: Codable,Identifiable{
    var id = UUID()
    var joke: String
    var status: Int
}

struct HomeView: View {
    @State private var jokes: [Joke] = []
    
    func getListData() {
//        let url = URL(string: "https://icanhazdadjoke.com/")!
//        var urlRequest = URLRequest(url:url)
//        urlRequest.addValue("text/plain",forHTTPHeaderField: "Accept")
//        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
//            if let data = data,
//                let httpResponse = response as? HTTPURLResponse, (200..<300) ~= httpResponse.statusCode,
//                let strData = String(bytes: data, encoding: .utf8)
//            {
//                print(strData)
//                self.jokes.insert(Joke(joke: strData, status: 20), at: 0)
//            } }.resume()

        let url = URL(string: "http://192.168.2.5:8088/wp-json/cafe/v1/articles")!
        var urlRequest = URLRequest(url:url)
//        urlRequest.addValue("text/plain",forHTTPHeaderField: "Accept")
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let data = data,
                let httpResponse = response as? HTTPURLResponse, (200..<300) ~= httpResponse.statusCode,
               let strData = data
            {
                print(strData)
                self.jokes.insert(Joke(joke: strData, status: 20), at: 0)
            } }.resume()
    }
            

    var body: some View {
//        Text("我是首页")
        
        NavigationView {
            VStack {
                Button(action: {self.getListData()},
                       label: {Text("Get Another Joke")})
                List {
                    ForEach(jokes) { joke in
                        Text(joke.joke)
                    }
                }
                .navigationBarTitle(Text("WORDPRESS"))
            }
            
        }
        .onAppear(perform: { self.getListData() })
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
