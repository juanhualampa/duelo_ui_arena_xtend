package applications_para_probar

import org.uqbar.arena.Application
import duelo_ui.RetarADueloWindow
import appModel.RetarADueloAppModel
import java.util.List
import domain.Personaje
import java.util.ArrayList
import domain.Jugador
import domain.Ubicacion
import domain.Sistema
import domain.EstadisticasPersonajes
import java.util.Arrays
import domain.Calificacion
import duelo_ui.ResultadoDueloWindow
import domain.Duelo
import domain.Retador
import domain.Iniciador
import domain.NoIniciador
import appModels.DueloAppModel

class RetarADueloApplication extends Application{
	
		
	override protected createMainWindow() {
		
		/////////////////////////////////////ESPECIALIDADES////////////////
		
		var List<String> esp1 = new ArrayList<String>()
		esp1.add("vision nocturna");
		esp1.add("Bloqueo");
		
		var List<String> esp2 = new ArrayList<String>()
		esp2.add("Ataque");
		esp2.add("puño de acero");
		
		var List<String> esp3 = new ArrayList<String>()
		esp3.add("Ataque");
		esp3.add("Patadas voladoras");
		
		var List<String> esp4 = new ArrayList<String>()
		esp4.add("Defensa");
		esp4.add("golpe de piernas");
		
		var List<String> esp5 = new ArrayList<String>()
		esp5.add("Defensa");
		esp5.add("Cuerpo a cuerpo");
		
		//////////////////////////////DEBILIDADES///////////////////
		
		var List<String> deb1 = new ArrayList<String>()
		
		deb1.add("Cuerpo a cuerpo");
		
		var List<String> deb2 = new ArrayList<String>()
		deb2.add("Ataque");
		deb2.add("Defensa");
		
		var List<String> deb3 = new ArrayList<String>()
		deb3.add("Poder especial");
		deb3.add("Cuerpo a cuerpo");
		
		var List<String> deb4 = new ArrayList<String>()
		deb4.add("estrategia defensiva");
		deb4.add("Bloqueo");
		
		var List<String> deb5 = new ArrayList<String>()
		deb5.add("tactica defensiva");
		deb5.add("Cuerpo a cuerpo");
		
		///////// CREO UBICACIONES ////////////////////////////
		
		var ubi1 = Ubicacion.TOP;
		var ubi2 = Ubicacion.BOTTOM;
		var ubi3 = Ubicacion.MIDDLE;
		var ubi4 = Ubicacion.JUNGLE;
		
		val ubicacionesUsadas = new ArrayList<Ubicacion>
		ubicacionesUsadas.addAll(Arrays.asList(ubi1,ubi2,ubi1,ubi2))
		
		///////////////CREO PERSONAJES/////////////////////////
		var Personaje personaje1 = new Personaje("PEPITO1",esp1,deb1,ubi1);		
		var Personaje personaje2 = new Personaje("PEPITO2",esp2,deb2,ubi2);		
		var Personaje personaje3 = new Personaje("PEPITO3",esp3,deb3,ubi1);		
		var Personaje personaje4 = new Personaje("PEPITO4",esp4,deb4,ubi3);		
		var Personaje personaje5 = new Personaje("PEPITO5",esp5,deb5,ubi4);
		
		/// LE DOY UNA CALIFICACION INICIAL /////////////////////////
		
		val calPerdedora = new Calificacion("NOOB",5)
		val calRampage = new Calificacion("NOOB",5)
		///////////////////////CREO ESTADISTICAS PARA PERSONAJES //////////////////////////////
		
		val est1 = new EstadisticasPersonajes(personaje1,10,4, 3, 1, 5, ubicacionesUsadas, ubi1,calRampage)
		val est2 = new EstadisticasPersonajes(personaje2,10,4, 3, 1, 5, ubicacionesUsadas, ubi1,calRampage)
		val est3 = new EstadisticasPersonajes(personaje3,3,1, 1, 1, 1, ubicacionesUsadas, ubi1,calPerdedora)
		val est4 = new EstadisticasPersonajes(personaje4,2,1,1, 1, 1, ubicacionesUsadas, ubi1,calPerdedora)
		val est5 = new EstadisticasPersonajes(personaje5,1,1,1, 1, 1, ubicacionesUsadas, ubi1,calPerdedora)
		
		var List<EstadisticasPersonajes> estadisticasPersonajes = new ArrayList<EstadisticasPersonajes>()
		
		estadisticasPersonajes.add(est1)
		estadisticasPersonajes.add(est2)
		estadisticasPersonajes.add(est3)
		estadisticasPersonajes.add(est4)
		estadisticasPersonajes.add(est5)
		
		//////////////////////////JUGADOR////////////////////////////
		val Sistema sis = new Sistema()
		var Jugador jugador = new Jugador("Super Hijitus",sis,estadisticasPersonajes)
		var Jugador jugador2 = new Jugador("Neurus",sis,estadisticasPersonajes)
		
		var RetarADueloAppModel retAppModel = new RetarADueloAppModel(jugador)
		new RetarADueloWindow(this,retAppModel)
		
		
		//new ResultadoDueloWindow(this,new DueloAppModel(sis.realizarDuelo(new Retador(jugador, personaje1,ubi1,new Iniciador),new Retador(jugador, personaje1,ubi1,new NoIniciador))))
	}
	
	def static main(String[] args) {
		new RetarADueloApplication().start
	}
	
}