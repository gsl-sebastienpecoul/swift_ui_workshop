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
}

extension Classified {
    static var mocks: [Classified] = [
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
                price: "100 000€",
                thumnbailPaths: ["https://v.seloger.com/s/cdn/x/visuels/2/0/v/d/20vdrf6dx5f81iyf8r8g8k8l53ngbktcgdkux6e6s.jpg"]
            ),
        Classified(
            description: """
                LYON 3 in the Saxe/Liberté area, in a small confidential street near the Rhone quays 'Apolline' is a rare house in full ownership and quiet. Nice facade from 1900, house on 2 floors for a surface of 235 m2 (ground surface of 277 m2) with a small private courtyard of 15m2 . In very good condition. On the ground floor : a large entrance of 18 m2 leading to a double living room of 40 m2 with a sitting area and a working fireplace open on a dining room. Nice old elements from 1900 have been preserved. Beautiful separate and equipped family kitchen of 19 m2 . An access to the small landscaped courtyard of 15 m2 allows to have a quiet outside. Sanitary facilities. A large period staircase leads to the first floor with 4 bedrooms (12, 14, 15 m2), one of which is the main bedroom of 23 m2 with ensuite bathroom, an additional bathroom. Sanitary facilities. Nice brightness. On the 2nd floor : 2 bedrooms (12 m2 each), 1 shower room, 1 playroom or office/library (20m2), separate dressing room (10m2) and sanitary. 2 cellars in the basement (20 m2) including 1 vaulted cellar and boiler room with storage of 10 m2. A closed garage, in a small condominium, for a car and a motorcycle place accessible from the house valued at 40 000 euros in addition to the selling price. Services: this house has an undeniable charm (beautiful high ceilings, parquet floor, moldings, fireplace and beautiful volumes, beautiful stained glass windows, cement tiles...), very well maintained with careful decoration. A warm and family atmosphere offers a quality of life in a house in the center of Lyon near all amenities, shops, schools, 10 minutes from the station and yet quiet. Rare property in the Lyon market. BEAUX LIEUX Immobilier, specialized in character properties in Lyon - Paris and Annecy.
            """,
            id: UUID(),
            isFavorite: true,
            isNovelty: true,
            mainInformation: "5 rooms • 3 bedrooms • 169 m² • Floor 1/1",
            place: "Lyon 7e",
            price: "1 340 000 €",
            thumnbailPaths: ["https://v.seloger.com/s/height/1080/visuels/0/v/b/7/0vb7h4lg2zm4e8vqbbprpjrijp8xn57dfz3yra9t6.jpg"]
        ),
        Classified(
            description: """
LYON 03 - EXCLUSIVE 'MATHIEU FAURE IMMO' - PART DIEU EST / AVENUE FÉLIX FAURE Rare property for sale. You'll love this house built in the 30's with a lot of character. Built on a 275m² plot, this house offers 135m² of living space. In addition a veranda of 12m², attic space of 74m² and a cellar used as a bar and games area of 65m². This property is composed on the ground floor of several spaces: living room, lounge, dining room, kitchen with access to the veranda open to the outside and toilets. On the first floor, three bedrooms of 12 to 14 m², a bathroom with bath and shower, dressing room and toilet. The attic can be converted, the height allows to create an additional space with 74m² on the ground. Garage of 18m² inside the courtyard. Pleasant house close to all amenities: 12 min walk from the metro D 'Sans Soucis' and the train station 'Part-Dieu', tramways T3 'Dauphiné-Lacassagne' and T4 'Archives Départementales', buses, shops, and markets. Close to the Meynis Elementary School and the lively shopping area of Place St Anne. For more information, contact us!
""",
            id: UUID(),
            isFavorite: true,
            isNovelty: false,
            mainInformation: "6 rooms • 224 m² • Floor 1/1",
            place: "Lyon 1er",
            price: "980 000€",
            thumnbailPaths: ["https://v.seloger.com/s/width/800/visuels/0/8/q/k/08qkonf3ryye6qp9btmvnmt7nkjhju210mofxrm8k.jpg"]
        ),
        Classified(
            description: """
On the 3rd floor with elevator, quiet and bright, you will discover this beautiful apartment renovated in 2020 with a large balcony of 11.43m². Ideally located 3min walk from the Garibaldi and Saxe Gambetta metro stations (Line B and D), allowing direct access to the Part Dieu and Jean Macé train stations. 5min walk to Place Saint Louis, with its market on Fridays, Sundays and Tuesdays. A large balcony on the courtyard side, quiet and not overlooked, runs along each of the main rooms. The apartment is thus open to the outside. The entrance of the apartment leads to a spacious living room with a beautiful open kitchen, fitted and equipped. A comfortable bedroom with dressing room also opens onto the balcony. The bathroom is spacious and tastefully renovated. It has an east facing window. The toilets are separate. The charges include the maintenance of the common parts, the hot and cold water, the elevator. The heating is electric with new radiators. The condominium is very well maintained. A large cellar completes the apartment. Possibility of a parking space in supplement. For the visits thank you to contact Camille: Co-ownership of 14 lots (No procedure in progress). Annual charges : 1800.00 euros.
""",
            id: UUID(),
            isFavorite: true,
            isNovelty: false,
            mainInformation: "2 rooms • 1 bedroom • 67 m² • Floor 7/8",
            place: "Lyon 5e",
            price: "363 000€",
            thumnbailPaths: ["https://v.seloger.com/s/width/800/visuels/0/p/7/i/0p7ipql79s1y93gsmryxu6tudr601ua6g7ebk5avp.jpg"]
        ),
        Classified(
            description: """
NOUVELLE RÉSIDENCE DE STANDING au coeur de MONTCHAT LYON 3ème ! Découvrez ses appartements haut de gamme du 2 au 5 pièces avec grandes terrasses, sa maison sur le toit et sa maison d'architecte. CONFIDENCE MONTCHAT, une adresse de prestige infiniment séduisante. Cette résidence confidentielle dévoilera 27 appartements du 2 au 5 pièces, 1 maison sur le toit avec terrasse allant jusqu'à 180 m² et 1 maison d'architecte d'une surface habitable de 144 m² . Elle offre des perspectives sobres avec des loggias, de magnifiques terrasses et de beaux jardins privatifs , le tout agrémenté d'une belle roseraie en cœur d'îlot. Contactez-nous pour de plus amples informations sur votre nouvelle résidence !
""",
            id: UUID(),
            isFavorite: false,
            isNovelty: false,
            mainInformation: "3 rooms • 1 bedroom • 63 m² • Floor 3/6",
            place: "Lyon 2e",
            price: "499 900€",
            thumnbailPaths: ["https://v.seloger.com/s/width/1146/visuels/1/7/8/0/1780wa4ke3ivfs4fprn0d0l795xioqwm1kb2zuyyn.jpg"]
        ),
        Classified(
            description: """
We are pleased to announce the launch of our new MAISON LEONTINE program. In Montchat, a highly sought-after neighborhood in Lyon's 3rd arrondissement, right next to the Grange Blanche metro station, the Edouard Herriot hospital and the Faculty of Medicine. R2i offers you two single-family homes with winter gardens and individual entrances in an intimate setting. You'll have T7 triplex apartments with top-of-the-line amenities. For more information, we invite you to contact us to arrange an appointment for a presentation in our offices located near the program at 11 cours Docteur Long 69003 Lyon.
""",
            id: UUID(),
            isFavorite: false,
            isNovelty: true,
            mainInformation: "10 room • 133 m² • Floor 2/2",
            place: "Lyon 4e",
            price: "570 000€",
            thumnbailPaths: ["https://v.seloger.com/s/width/1092/visuels/1/h/q/8/1hq8d9lnf30dxf3m86s7ohxb9ftlm6lilg5oun4ka.jpg"]
        )
    ]
    
}

