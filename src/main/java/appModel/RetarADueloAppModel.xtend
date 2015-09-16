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
//	EstadisticasPersonajes estadisticaPersonajeSeleccionado
	List<EstadisticasPersonajes> estadisticasPersonajes
	Jugador jugador
	PersonajePuntaje personajeConPuntaje
//	Integer vecesUsadoPersonaje
//	Integer vecesQueGano
//	Integer vecesQueMato
//	Integer vecesDeads
//	Integer vecesAssists
	
	new(Jugador jugador){
		personajeABuscar = "";
		this.jugador = jugador
		this.estadisticasPersonajes = this.jugador.estadisticasPersonajes
		this.personajes = this.estadisticasPersonajes.map[personaje];
		
	}
			
	def EstadisticasPersonajes estadisticaPersonajeSeleccionado(){
		//estadisticaPersonajeSeleccionado = 
		
		jugador.estadisticas(personajeConPuntaje.personaje)
	}
	
	def List<PersonajePuntaje> personajesConPuntaje(){
		estadisticasPersonajes.map[new PersonajePuntaje(it.personaje, it.calificacion.nro)]
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