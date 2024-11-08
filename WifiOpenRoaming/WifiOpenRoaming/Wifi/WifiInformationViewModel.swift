// Copyright © 2024 Fashion Retail España SA. All rights reserved.

import SwiftUI

struct WifiInformationViewModel {
    let headerTitleText: String = "Accede a nuestra Red Wi-fi"
    let headerSubtitleText: String = "Conéctate a la wi-fi de nuestras tiendas durante los próximos 7 dias. Descárgate la app para hacerlo permanente."
    let termsAndConditionsText: String = "Acepto las Condiciones de Uso y Privacidad"
    let saveProfileButtonText: String = "Guardar red wi-fi"
    let image: Image = Image("Inditex")
}


struct WifiInstalledInformationViewModel {
    let headerTitleText: String = "Ya estás conectado"
    let headerSubtitleText: String = "Instala la app completa para que no caduque en 7 días"
    let downloadButtonText: String = "Descargar la app completa"
    let image: Image = Image("Inditex")
    let downloadUrl: String = "itms-apps://itunes.apple.com/app/547951480"
}
