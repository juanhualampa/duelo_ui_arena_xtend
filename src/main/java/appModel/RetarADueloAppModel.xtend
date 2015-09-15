package appModel
import org.eclipse.xtend.lib.annotations.Accessors
import domain.Personaje
import org.uqbar.commons.utils.Observable
import java.util.List
import domain.EstadisticasPersonajes
import java.util.ArrayList
import org.uqbar.commons.model.ObservableUtils
import domain.Jugador

@Accessors
@Observable
class RetarADueloAppModel {
	
	String personajeABuscar
	List<Personaje>personajes;
	Personaje personajeSeleccionado
	EstadisticasPersonajes estadisticaPersonajeSeleccionado
	List<EstadisticasPersonajes> estadisticasPersonajes
	Jugador jugador
//	Integer vecesUsadoPersonaje
//	Integer vecesQueGano
//	Integer vecesQueMato
//	Integer vecesDeads
//	Integer vecesAssists
	
	new(Jugador jugador, List<Personaje> personajesParaElegir){
		personajeABuscar = "";
		this.jugador = jugador
		this.personajes = personajesParaElegir;
		this.estadisticasPersonajes = new ArrayList<EstadisticasPersonajes>()
		for(Personaje p : this.personajes){
			
			val EstadisticasPersonajes est1 = new EstadisticasPersonajes(p)
			this.estadisticasPersonajes.add(est1);
		}
	}
	
//	def setPersonajeSeleccionado(Personaje p){
//		for(EstadisticasPersonajes ep : this.estadisticasPersonajes){
//			if(ep.personaje.nombre.equals(personajeSeleccionado.nombre)){
//				this.estadisticaPersonajeSeleccionado = ep
//				ObservableUtils.firePropertyChanged(this,"estadisticaPersonajeSeleccionado",this.estadisticaPersonajeSeleccionado)
//			}
//		}
//	}
}