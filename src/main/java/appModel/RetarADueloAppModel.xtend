package appModel
import org.eclipse.xtend.lib.annotations.Accessors
import domain.Personaje
import org.uqbar.commons.utils.Observable
import java.util.List
import domain.EstadisticasPersonajes
import org.uqbar.commons.model.ObservableUtils
import domain.Jugador
import domain.Ubicacion
import domain.Retador
import domain.Iniciador
import domain.Duelo

@Accessors
@Observable
class RetarADueloAppModel {
	
	String personajeABuscar
//	Personaje personajeSeleccionado
	Jugador jugador
	PersonajePuntaje personajeConPuntaje
	
	Ubicacion ubicacionSeleccionada
	
	new(Jugador jugador){
		personajeABuscar = "";
		this.jugador = jugador
		//this.personajesConPuntaje = this.jugador.estadisticasPersonajes.map[new PersonajePuntaje(it.personaje, it.calificacion.nro)]
		
	}	
	
	def Personaje getPersonajeSeleccionado(){
		personajeConPuntaje.personaje
	}
	
	def ubicacionesPosibles(){
		#[Ubicacion.TOP,Ubicacion.MIDDLE,Ubicacion.JUNGLE,Ubicacion.BOTTOM]
	}
	
	def setPersonajeABuscar(String s){
		ObservableUtils.firePropertyChanged(this,"personajesConPuntaje")
	}
	
	def List<PersonajePuntaje> personajesConPuntaje(){
		val personajesConPuntaje = this.jugador.estadisticasPersonajes.map[new PersonajePuntaje(it.personaje, it.calificacion.nro)]
		if (personajeABuscar != ""){			
			personajesConPuntaje.filter[it.personaje.nombre.contains(personajeABuscar)].toList
		}
		else{
			personajesConPuntaje
		}		
	}
	
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
	
	def datosDeEstadisticas(){
		estadisticaPersonajeSeleccionado.dameSusPropiedades
	}
	
	def dameSusPropiedades(EstadisticasPersonajes it) {
		#[new Pair("Jugadas",vecesUsadoAntesDelDuelo),
			new Pair("Ganadas",vecesQueGanoDuelo),
			new Pair("Kills",vecesKills),	
			new Pair("Deads",vecesDeads),	
			new Pair("Assists",vecesAssist),
			new Pair("Mejor ubicacion",mejorUbicacion),
			new Pair("Puntaje",calificacion.nro)]
	}
	
	def retador() {
		new Retador(this.jugador,personajeSeleccionado,ubicacionSeleccionada, new Iniciador)
	}
	
	def obtenerDuelo(Ubicacion ubicacion) {
		this.jugador.iniciarDuelo(personajeSeleccionado,ubicacion)
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