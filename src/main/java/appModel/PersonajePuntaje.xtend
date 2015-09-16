package appModel

import domain.Personaje
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class PersonajePuntaje {
	
	Personaje personaje	
	int puntaje
	
	new(Personaje personaje, int puntaje) {
		this.personaje = personaje
		this.puntaje = puntaje
	}

}