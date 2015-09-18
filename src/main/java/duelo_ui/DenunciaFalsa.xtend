package duelo_ui

import org.uqbar.arena.windows.WindowOwner
import domain.Jugador

class DenunciaFalsa extends DenunciaTemplate{
	
	new(WindowOwner owner, Jugador jugador) {
		super(owner, jugador, "HAS SIDO SANCIONADO", "Hemos detectado que tu denuncia no tiene fundamentos solidos")
	}
}