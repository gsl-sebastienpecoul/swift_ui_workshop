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
                    Démarrez votre nouvelle vie en beauté à Paris avec ce 3 pièces raffiné proposé par Blueground. Vous vous sentirez comme chez vous dans cet appartement meublé haut de gamme, entièrement équipé et aménagé, situé à Champs Elysees.  Avec Blueground, bénéficiez d’un service client 24/24 et 7/7 pour vous assister! Un appartement conçu spécialement pour vous
                """,
                id: UUID(),
                isFavorite: true,
                isNovelty: false,
                mainInformation: "3 pièces • 2 chambres • 69 m² • Étage 3/4",
                place: "Paris 12 ème",
                price: "159 000€",
                thumnbailPaths: ["https://v.seloger.com/s/cdn/x/visuels/1/7/8/z/178zh5cxxfa39z3fx29wb5dnuzqoyd96w403ivzzk.jpg"]
            ),
            Classified(
                description: """
20é arrondissement Rue de MENILMONTANT BEAU ET GRAND STUDIO COMPOSE D'UNE ENTREE UNE SALLE D'EAU AVEC WC UNE BELLE PIECE PRINCIPALE AVEC 3 FENÊTRES ET UN COIN CUISINE SEMI AMENAGEE LIBRE DE SUITE
""",
                id: UUID(),
                isFavorite: true,
                isNovelty: false,
                mainInformation: "1 pièce • 24 m² • Étage 1/2",
                place: "Paris 20 ème",
                price: "359 000€",
                thumnbailPaths: ["https://v.seloger.com/s/cdn/x/visuels/0/v/l/9/0vl9w56dl2xea4au44d8yzlzuhosfzel2wfolvl94.jpg"]
            ),
            Classified(
                description: """
PARIS 12ème - situé rue Dagorno - quartier Daumesnil - proche Nation - COMMERCES et TRANSPORTS à proximité - dans un immeuble moderne très bien entretenu - appartement en rez-de-chaussée en bon état avec terrasse - donnant sur JARDINS - CALME - très agréable et SANS VIS-A-VIS - chauffage et eau chaude COLLECTIFS - CAVE et PARKING en sous-sol - gardiennage - Disponible imméditement
""",
                id: UUID(),
                isFavorite: true,
                isNovelty: false,
                mainInformation: "2 pièces • 1 chambre • 47 m² • Étage 0/8",
                place: "Paris 12 ème",
                price: "759 000€",
                thumnbailPaths: ["https://v.seloger.com/s/cdn/x/visuels/0/r/d/a/0rda42uump557qc35kx9z00gn1ghs0cnvz5d3xcrv.jpg"]
            ),
            Classified(
                description: """
Exclusivité Paris 5e au cœur du Paris Historique Rue du Petit Pont, face à l'église Saint Séverin, nous vous proposons au 3e étage (sans ascenseur) d'un immeuble de bonne facture de 1750, un appartement traversant de 33,27m2 disposant d'une pièce à vivre de 24m2 baignée de lumière, exposée ouest et ouverte sur 3 larges fenêtres, d'une salle de bains, et d'une cuisine séparée.
 Poutres apparentes, tommettes d'origine au sol et cheminée d'époque : beaucoup de potentiel pour ce petit bijou !
""",
                id: UUID(),
                isFavorite: false,
                isNovelty: false,
                mainInformation: "2 pièces • 1 chambre • 33 m² • Étage 3/–",
                place: "Paris 5 ème",
                price: "10 199 900€",
                thumnbailPaths: ["https://v.seloger.com/s/cdn/x/visuels/1/y/a/g/1yagp6clvstv6wotx4ub81sotn1gh5wrcz1j8z4h2.jpg"]
            ),
            Classified(
                description: """
En plein coeur du quartier du canal Saint-Martin, dans une copropriété convoitée à l'abri des regards, au sein d'une ancienne imprimerie réhabilitée en loft d'habitation agréable studio de 33,53 m² au sol dont 26,69 m² loi Carrez située en rez-de-chaussée d'une jolie cour pavée pourvue d'une bambouseraie. Pièce de vie avec cuisine ouverte meublée et équipée, salle d'eau/WC et espace nuit en mezzanine. Belle hauteur sous-plafond et luminosité grâce à ses verrières exposées Sud. Une salle commune ainsi qu'une salle de cinéma sont également à disposition des copropriétaires. Un emplacement unique? une bulle en dehors du temps dans un secteur animé. Idéal pied-à terre. Copropriété de 16 lots (Pas de procédure en cours). Charges annuelles : 859.44 euros.
""",
                id: UUID(),
                isFavorite: false,
                isNovelty: true,
                mainInformation: "1 pièce • 33 m² • Étage 0/2",
                place: "Paris 10 ème",
                price: "100€",
                thumnbailPaths: ["https://v.seloger.com/s/cdn/x/visuels/2/0/v/d/20vdrf6dx5f81iyf8r8g8k8l53ngbktcgdkux6e6s.jpg"]
            )
        ]
    }
    
}

