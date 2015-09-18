package appModel
import org.eclipse.xtend.lib.annotations.Accessors
import domain.Personaje
import org.uqbar.commons.utils.Observable
import java.util.List
import domain.EstadisticasPersonajes
import org.uqbar.commons.model.ObservableUtils
import domain.Jugador


@Accessors
@Observable
class RetarADueloAppModel {
	
	String personajeABuscar
	Personaje personajeSeleccionado
	Jugador jugador
	List<PersonajePuntaje> personajesConPuntaje
	PersonajePuntaje personajeConPuntaje
	
	new(Jugador jugador){
		personajeABuscar = "";
		this.jugador = jugador
		this.personajesConPuntaje = this.jugador.estadisticasPersonajes.map[new PersonajePuntaje(it.personaje, it.calificacion.nro)]
		
	}
	
//	def setPersonajeABuscar(String s){
//		this.setPersonajesConPuntaje(personajesConPuntaje.filter[it.personaje.nombre.contains(s)].toList)
//		ObservableUtils.firePropertyChanged(this,"personajesConPuntaje")
//	}
//	
//	def setPersonajesConPuntaje(List<PersonajePuntaje> p){
//		p
//	}
	
	def void setPersonajeConPuntaje(PersonajePuntaje p){
		this.personajeConPuntaje = p
		ObservableUtils.firePropertyChanged(this,"estadisticaPersonajeSeleccionado")
	}
	
	def EstadisticasPersonajes getEstadisticaPersonajeSeleccionado(){
		//estadisticaPersonajeSeleccionado = 
		if (personajeConPuntaje == null){
			jugador.estadisticasPersonajes.get(0)
		}
		else{
			jugador.estadisticas(personajeConPuntaje.personaje)
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