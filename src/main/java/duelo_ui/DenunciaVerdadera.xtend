package duelo_ui

import org.uqbar.arena.windows.WindowOwner
import domain.Jugador

class DenunciaVerdadera extends DenunciaTemplate{
	
	new(WindowOwner owner, Jugador retado) {
		super(owner, retado, "HEMOS DENUNCIADO A: " + retado.nombre, 
			"En duelo de leyendas somos partidarios del fair play. Gracias por ayudarnio a mantenernos asi"
		)
	}
}
