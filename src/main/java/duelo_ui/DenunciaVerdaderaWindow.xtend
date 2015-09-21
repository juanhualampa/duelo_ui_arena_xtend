package duelo_ui

import org.uqbar.arena.windows.WindowOwner
import domain.Jugador

<<<<<<< HEAD:src/main/java/duelo_ui/DenunciaVerdadera.xtend
/**
 * Representa una denuncia que ha sido evaluada y cumple las condiciones
 */
class DenunciaVerdadera extends DenunciaTemplate{
=======
class DenunciaVerdaderaWindow extends DenunciaTemplateWindow{
>>>>>>> 83d6cea7980ca1371796100eb43608b196ed3237:src/main/java/duelo_ui/DenunciaVerdaderaWindow.xtend
	
	new(WindowOwner owner, Jugador retado) {
		super(owner, retado, "HEMOS DENUNCIADO A: " + retado.nombre, 
			"En duelo de leyendas somos partidarios del fair play. Gracias por ayudarnio a mantenernos asi"
		)
	}
}
