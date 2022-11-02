//
//  RatingView.swift
//  Bibliophile
//
//  Created by Timi on 2/11/22.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Int

    var label = ""

    var maximumRating = 5

    var offImage: Image?
    var onImage = Image(systemName: "star.fill")

    var offColor = Color.gray
    var onColor = Color.yellow
    
    var body: some View { //if the label has any text use it, then use ForEach to count from 1 to the maximum rating plus 1 and call image(for:) repeatedly. We’ll also apply a foreground color depending on the rating, and add a tap gesture that adjusts the rating.
        HStack {
            if label.isEmpty == false {
                Text(label)
            }

            ForEach(1..<maximumRating + 1, id: \.self) { number in
                image(for: number)
                    .foregroundColor(number > rating ? offColor : onColor)
                    .onTapGesture {
                        rating = number
                    }
            }
        }
    }
    func image(for number: Int) -> Image {
        if number > rating {
            return offImage ?? onImage
        } else {
            return onImage
        }
    } //If the number that was passed in is greater than the current rating, return the off image if it was set, otherwise return the on image.
    //If the number that was passed in is equal to or less than the current rating, return the on image.

}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: .constant(4)) //SwiftUI has a specific and simple solution for this called constant bindings. These are bindings that have fixed values, which on the one hand means they can’t be changed in the UI, but also means we can create them trivially – they are perfect for previews.
    }
}
