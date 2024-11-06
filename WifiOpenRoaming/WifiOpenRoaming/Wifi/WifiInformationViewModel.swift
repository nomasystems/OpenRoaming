// Copyright © 2024 Fashion Retail España SA. All rights reserved.

import SwiftUI

protocol WifiInformationProtocol {
    var headerTitleText: String { get }
    var headerSubtitleText: String { get }
    var termsAndConditionsText: String { get }
    var saveProfileButtonText: String { get }
    var information: [WifiInformationCellModel] { get }
}

struct WifiInformationCellModel {
    let headerTitleText: String
    let headerSubtitleText: String
    let image: Image
}

struct WifiInformationViewModel: WifiInformationProtocol {
    var headerTitleText: String = "Accede a nuestra Red Wi-fi"

    var headerSubtitleText: String = "Añade la Wi-Fi de Zara a tu dispositivo para conectarte de forma directa cuando visites alguna de nuestras tiendas, dispondrás de acceso durante los próximos 7 dias, hazlo permanente instalando nuestra APP."

    var termsAndConditionsText: String = "Acepto las Condiciones de Uso y Privacidad"

    var saveProfileButtonText: String = "Guardar red wi-fi"

    var information: [WifiInformationCellModel] = [.init(headerTitleText: "Conexión automática",
                                                         headerSubtitleText: "Sin registros ni contraseñas",
                                                         image: Image(systemName: "checkmark.circle")),
                                                   .init(headerTitleText: "RED SEGURA, GRATUITA Y para siempre",
                                                         headerSubtitleText: "Conexión segura, sin interrupciones valida tanto para usar con apps como navegar por web.",
                                                         image: Image(systemName: "hand.thumbsup")),
                                                   .init(headerTitleText: "En todas las tiendas",
                                                         headerSubtitleText: "En el momento que lo actives conseguirás acceso a nuestra red en todas las tiendas de España.",
                                                         image: Image(systemName: "building"))]
}
