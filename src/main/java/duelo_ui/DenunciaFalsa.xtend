package duelo_ui

import domain.Retador
import org.uqbar.arena.windows.WindowOwner

class DenunciaFalsa extends DenunciaTemplate{
	
	new(WindowOwner owner, Retador retado) {
		super(owner, retado, "HAS SIDO SANCIONADO", "Hemos detectado que tu denuncia no tiene fundamentos solidos")
	}
}