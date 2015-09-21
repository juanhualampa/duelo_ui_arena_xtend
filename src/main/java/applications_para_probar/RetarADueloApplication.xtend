package applications_para_probar

import org.uqbar.arena.Application
import duelo_ui.RetarADueloWindow
import java.util.List
import domain.Personaje
import java.util.ArrayList
import domain.Jugador
import domain.Ubicacion
import domain.Sistema
import domain.EstadisticasPersonajes
import java.util.Arrays
import domain.Calificacion
import appModels.RetarADueloAppModel

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
		var Personaje personaje1 = new Personaje("El Chelo",esp1,deb1,ubi1);		
		var Personaje personaje2 = new Personaje("Javito",esp2,deb2,ubi2);		
		var Personaje personaje3 = new Personaje("Ariel Pucheta",esp3,deb3,ubi1);		
		var Personaje personaje4 = new Personaje("Pablo Lescano",esp4,deb4,ubi3);		
		var Personaje personaje5 = new Personaje("Leo Mattioli",esp5,deb5,ubi4);
		var Personaje personaje0 = new Personaje("El Polaco",esp1,deb2,ubi3);
		
		/// LE DOY UNA CALIFICACION INICIAL /////////////////////////
		val calRampage = new Calificacion("RAMPAGE",100)
		val calDominador = new Calificacion("DOMINADOR",75)
		val calKiller = new Calificacion("KILLING_SPREAD",60)
		val calManco = new Calificacion("MANCO",15)
		val calNoob = new Calificacion("NOOB",5)
		
		///////////////////////CREO ESTADISTICAS PARA PERSONAJES //////////////////////////////
		val ubicacionesUsadas1 = new ArrayList<Ubicacion>
		ubicacionesUsadas1.addAll(Arrays.asList(ubi1, ubi1, ubi1, ubi1, ubi1, ubi1, ubi2))
		val est1 = new EstadisticasPersonajes(personaje1, 7, 6, 5, 4, 3, ubicacionesUsadas1, ubi1,calRampage)
		
		val ubicacionesUsadas2 = new ArrayList<Ubicacion>
		ubicacionesUsadas2.addAll(Arrays.asList(ubi2, ubi2, ubi2, ubi3, ubi4))
		val est2 = new EstadisticasPersonajes(personaje2, 5, 4, 3, 2, 1, ubicacionesUsadas2, ubi1,calDominador)
		
		val ubicacionesUsadas3 = new ArrayList<Ubicacion>
		ubicacionesUsadas3.addAll(Arrays.asList(ubi1, ubi2, ubi4))
		val est3 = new EstadisticasPersonajes(personaje3, 3, 1, 2, 1, 1, ubicacionesUsadas3, ubi1,calKiller)
		
		val ubicacionesUsadas4 = new ArrayList<Ubicacion>
		ubicacionesUsadas4.addAll(Arrays.asList(ubi3, ubi4))
		val est4 = new EstadisticasPersonajes(personaje4, 2, 1, 1, 1, 1, ubicacionesUsadas4, ubi1,calManco)
		
		val ubicacionesUsadas5= new ArrayList<Ubicacion>
		ubicacionesUsadas5.addAll(Arrays.asList(ubi4))
		val est5 = new EstadisticasPersonajes(personaje5, 1, 0, 0, 1, 1, ubicacionesUsadas5, ubi1,calNoob)
		
		val est0 = new EstadisticasPersonajes(personaje0)
		
		var List<EstadisticasPersonajes> estadisticasPersonajes = new ArrayList<EstadisticasPersonajes>()
		
		estadisticasPersonajes.add(est1)
		estadisticasPersonajes.add(est2)
		estadisticasPersonajes.add(est3)
		estadisticasPersonajes.add(est4)
		estadisticasPersonajes.add(est5)
		estadisticasPersonajes.add(est0)
		
		//////////////////////////JUGADOR////////////////////////////
		val Sistema sis = new Sistema()
		var Jugador jugador = new Jugador("La Tota",estadisticasPersonajes)
		jugador.setSistema(sis)
//		COMENTAR PROX LINEA PARA JUGAR CON MrX
//		var Jugador jugador2 = new Jugador("Hernan Caire",estadisticasPersonajes)
		
		var RetarADueloAppModel retAppModel = new RetarADueloAppModel(jugador)
		new RetarADueloWindow(this,retAppModel)
		
	}
	
	def static main(String[] args) {
		new RetarADueloApplication().start
	}
	
}