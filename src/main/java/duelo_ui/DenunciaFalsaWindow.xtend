package duelo_ui

import org.uqbar.arena.windows.WindowOwner
import domain.Jugador

<<<<<<< HEAD:src/main/java/duelo_ui/DenunciaFalsa.xtend
/**
 * Representa una denuncia que ha sido evaluada y no cumple las condiciones
 */
class DenunciaFalsa extends DenunciaTemplate{
=======
class DenunciaFalsaWindow extends DenunciaTemplateWindow{
>>>>>>> 83d6cea7980ca1371796100eb43608b196ed3237:src/main/java/duelo_ui/DenunciaFalsaWindow.xtend
	
	new(WindowOwner owner, Jugador jugador) {
		super(owner, jugador, "HAS SIDO SANCIONADO", "Hemos detectado que tu denuncia no tiene fundamentos solidos")
	}
}