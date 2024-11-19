// Copyright © 2024 Fashion Retail España SA. All rights reserved.

import SwiftUI

struct OpenRoamingViewUtils {
    let image = Image("Inditex")
    let checkMarkCircle = Image(systemName: "checkmark.circle.fill")
    let headerTitleText: String = "CONÉCTATE A NUESTRA WIFI"
    let headerItems: [WifiHeaderItems] = [WifiHeaderItems(name: "Conexión automática", image: Image(systemName: "link")),
                                          WifiHeaderItems(name: "Red segura", image: Image(systemName: "shield"))]
    let termsAndConditionsText: String = "Acepto las Condiciones de Uso y Privacidad"
    let saveProfileButtonText: String = "GUARDAR RED WI-FI"
    let termsAndConditionsAlertText: String = "Debes aceptar las Condiciones de Uso y Privacidad"
    let ok: String = "Ok"
    let errorText: String = "Se ha producido un error inesperado"
    let profileInstalledText: String = "Conectado"
}

