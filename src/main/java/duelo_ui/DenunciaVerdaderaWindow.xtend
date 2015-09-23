package duelo_ui

import org.uqbar.arena.windows.WindowOwner
import domain.Jugador

/**
 * Representa una denuncia que ha sido evaluada y cumple las condiciones
 */
class DenunciaVerdaderaWindow extends DenunciaTemplateWindow{
	
	new(WindowOwner owner, Jugador retado) {
		super(owner, retado, "HEMOS SANCIONADO A: " + retado.nombre, 
			"En duelo de leyendas somos partidarios del fair play. Gracias por ayudarnos a mantenerlo asi"
		)
	}
}
