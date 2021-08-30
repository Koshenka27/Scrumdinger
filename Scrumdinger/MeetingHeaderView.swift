//
//  MeetingHeaderView.swift
//  Scrumdinger
//
//  Created by Logan Koshenka on 8/30/21.
//

import SwiftUI

struct MeetingHeaderView: View {
    let secondsElapsed: Double
    let secondsRemaining: Double
    
    private var progress: Double {
        guard secondsRemaining > 0 else { return 1 }
        let totalSeconds = Double(secondsElapsed + secondsRemaining)
        return Double(secondsElapsed) / totalSeconds
    }
    
    private var minutesRemaining: Int {
        Int(secondsRemaining / 60)
    }
    
    private var minutesRemainingMetric: String {
            minutesRemaining == 1 ? "minute" : "minutes"
    }
    
    let scrumColor: Color
    
    var body: some View {
        VStack {
            ProgressView(value: progress, total: 15.0)
                .progressViewStyle(ScrumProgressViewStyle(scrumColor: scrumColor))
            
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Seconds Elapsed")
                        .font(.caption)
                    Label("\(Int(secondsElapsed))", systemImage: "hourglass.bottomhalf.fill")
                }
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text("Seconds Remaining")
                        .font(.caption)
                    
                    HStack {
                        Text("\(Int(secondsRemaining))")
                        
                        Image(systemName: "hourglass.tophalf.fill")
                    }
                }
            }
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(Text("Time remaining"))
        .accessibilityValue(Text("\(minutesRemaining) \(minutesRemainingMetric)"))
        .padding([.top, .horizontal])
    }
}

struct MeetingHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingHeaderView(secondsElapsed: 60.0, secondsRemaining: 180.0, scrumColor: DailyScrum.data[0].color)
            .previewLayout(.sizeThatFits)
    }
}
