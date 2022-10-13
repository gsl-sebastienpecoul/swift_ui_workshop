import Foundation

struct Classified: Identifiable {
    
    let description: String
    let id: UUID
    var isFavorite: Bool
    let isNovelty: Bool?
    let mainInformation: String
    let place: String
    let price: String
    let thumnbailPaths: [String]
    
    static var mocks: [Classified] {
        return [
            Classified(
                description: """
                    Start your new life in Paris in style with this refined 3 room apartment offered by Blueground. You'll feel right at home in this fully furnished, upscale apartment located in Champs Elysees.  With Blueground, benefit from a 24/7 customer service to assist you! An apartment designed especially for you
                """,
                id: UUID(),
                isFavorite: true,
                isNovelty: false,
                mainInformation: "3 rooms • 2 bedrooms • 69 m² • Floor 3/4",
                place: "Paris 12 ème",
                price: "159 000€",
                thumnbailPaths: ["https://v.seloger.com/s/cdn/x/visuels/1/7/8/z/178zh5cxxfa39z3fx29wb5dnuzqoyd96w403ivzzk.jpg"]
            ),
            Classified(
                description: """
20th district Rue de MENILMONTANT BEAUTIFUL AND LARGE STUDIO COMPOSED OF AN ENTRANCE, A BATHROOM WITH WC, A BEAUTIFUL MAIN ROOM WITH 3 WINDOWS AND A SEMI-FURNISHED KITCHEN AREA.
""",
                id: UUID(),
                isFavorite: true,
                isNovelty: false,
                mainInformation: "1 room • 24 m² • Floor 1/2",
                place: "Paris 20 ème",
                price: "359 000€",
                thumnbailPaths: ["https://v.seloger.com/s/cdn/x/visuels/0/v/l/9/0vl9w56dl2xea4au44d8yzlzuhosfzel2wfolvl94.jpg"]
            ),
            Classified(
                description: """
PARIS 12ème - located rue Dagorno - district Daumesnil - near Nation - SHOPS and TRANSPORTATION in the vicinity - in a modern building very well maintained - apartment in good condition on the first floor with terrace - giving on GARDENS - QUIET - very pleasant and WITHOUT VIS-A-VIS - COLLECTIVE heating and hot water - CELLAR and PARKING in the basement - guarding - Available immediately
""",
                id: UUID(),
                isFavorite: true,
                isNovelty: false,
                mainInformation: "2 rooms • 1 bedroom • 47 m² • Floor 0/8",
                place: "Paris 12 ème",
                price: "759 000€",
                thumnbailPaths: ["https://v.seloger.com/s/cdn/x/visuels/0/r/d/a/0rda42uump557qc35kx9z00gn1ghs0cnvz5d3xcrv.jpg"]
            ),
            Classified(
                description: """
Exclusivity Paris 5th in the heart of Historic Paris Rue du Petit Pont, facing the church of Saint Séverin, we propose to you on the 3rd floor (without elevator) of a well-built building of 1750, a crossing apartment of 33,27m2 with a living room of 24m2 bathed in light, exposed west and open on 3 large windows, a bathroom, and a separate kitchen.
 Exposed beams, original floor tiles and period fireplace: lots of potential for this little gem!
""",
                id: UUID(),
                isFavorite: false,
                isNovelty: false,
                mainInformation: "2 rooms • 1 bedroom • 33 m² • Floor 3/–",
                place: "Paris 5 ème",
                price: "10 199 900€",
                thumnbailPaths: ["https://v.seloger.com/s/cdn/x/visuels/1/y/a/g/1yagp6clvstv6wotx4ub81sotn1gh5wrcz1j8z4h2.jpg"]
            ),
            Classified(
                description: """
In the heart of the Canal Saint-Martin district, in a coveted condominium, in a former printing house rehabilitated into a pleasant loft apartment of 33.53 m² (26.69 m² Carrez law) located on the first floor of a pretty paved courtyard with a bamboo grove. Living room with open furnished and equipped kitchen, shower room/WC and mezzanine night area. Beautiful high ceiling and luminosity thanks to its south facing windows. A common room as well as a cinema room are also available to the co-owners. A unique location? a bubble outside of time in a lively area. Ideal pied-à-terre. Co-ownership of 16 lots (No procedure in progress). Annual charges : 859.44 euros.
""",
                id: UUID(),
                isFavorite: false,
                isNovelty: true,
                mainInformation: "1 room • 33 m² • Floor 0/2",
                place: "Paris 10 ème",
                price: "100€",
                thumnbailPaths: ["https://v.seloger.com/s/cdn/x/visuels/2/0/v/d/20vdrf6dx5f81iyf8r8g8k8l53ngbktcgdkux6e6s.jpg"]
            )
        ]
    }
    
}

