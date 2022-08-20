//
//  ScrumsView.swift
//  wordpress-ios
//
//  Created by cafehaus on 2022/8/20.
//

import SwiftUI

struct ScrumsView: View {
    let scrums: [DailyScrum]
    
    var body: some View {
        List {
            ForEach(scrums, id: \.title) { scrum in CardView(scrum: scrum)
                    .listRowBackground(scrum.theme.mainColor)
                
            }
        }
    }
}

struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ScrumsView(scrums: DailyScrum.sampleData)
        }
    }
}
