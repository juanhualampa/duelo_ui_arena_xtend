package duelo_ui

import org.uqbar.arena.windows.WindowOwner
import domain.Retador

class DenunciaVerdadera extends DenunciaTemplate{
	
	new(WindowOwner owner, Retador retado) {
		super(owner, retado, "HEMOS DENUNCIADO A: " + retado.jugador.nombre, 
			"En duelo de leyendas somos partidarios del fair play. Gracias por ayudarnio a mantenernos asi"
		)
	}
}
