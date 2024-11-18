// Copyright © 2024 Fashion Retail España SA. All rights reserved.

import SwiftUI

struct WifiInformationViewModel {
    let headerTitleText: String = "CONÉCTATE A NUESTRA WIFI"
    let headerItems: [WifiHeaderItems] = [WifiHeaderItems(name: "Conexión automática", image: Image(systemName: "link")),
                                          WifiHeaderItems(name: "Red segura", image: Image(systemName: "shield"))]
    let termsAndConditionsText: String = "Acepto las Condiciones de Uso y Privacidad"
    let saveProfileButtonText: String = "GUARDAR RED WI-FI"
    let image: Image = Image("Inditex")
}


struct WifiInstalledInformationViewModel {
    let headerTitleText: String = "Conectado"
    let image: Image = Image("Inditex")
}
