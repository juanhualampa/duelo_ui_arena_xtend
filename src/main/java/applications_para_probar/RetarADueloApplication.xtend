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
//import homes.DummySistema

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
		var Personaje elChelo = new Personaje("El Chelo",esp1,deb1,ubi1);		
		var Personaje javito = new Personaje("Javito",esp2,deb2,ubi2);		
		var Personaje arielPucheta = new Personaje("Ariel Pucheta",esp3,deb3,ubi1);		
		var Personaje pabloLescano = new Personaje("Pablo Lescano",esp4,deb4,ubi3);		
		var Personaje leoMattioli = new Personaje("Leo Mattioli",esp5,deb5,ubi4);
		//PERSONAJE CERO
		var Personaje elPolaco = new Personaje("El Polaco",esp1,deb2,ubi3);
		
		/// LE DOY UNA CALIFICACION INICIAL /////////////////////////
		val calRampage = new Calificacion("RAMPAGE",100)
		val calDominador = new Calificacion("DOMINADOR",75)
		val calKiller = new Calificacion("KILLING_SPREAD",60)
		val calManco = new Calificacion("MANCO",15)
		val calNoob = new Calificacion("NOOB",5)
		
		//ESTADISTICAS PERSONAJES SUPER HIJITUS
		val ubicacionesUsadas1 = new ArrayList<Ubicacion>
		ubicacionesUsadas1.addAll(Arrays.asList(ubi1, ubi1, ubi1, ubi1, ubi1, ubi1, ubi2))
		val estRampage = new EstadisticasPersonajes(elChelo, 7, 6, 5, 4, 3, ubicacionesUsadas1, ubi1,calRampage)
		
		val ubicacionesUsadas2 = new ArrayList<Ubicacion>
		ubicacionesUsadas2.addAll(Arrays.asList(ubi2, ubi2, ubi2, ubi3, ubi4))
		val estDominador = new EstadisticasPersonajes(javito, 5, 4, 3, 2, 1, ubicacionesUsadas2, ubi1,calDominador)
		
		val ubicacionesUsadas3 = new ArrayList<Ubicacion>
		ubicacionesUsadas3.addAll(Arrays.asList(ubi1, ubi2, ubi4))
		val estKiller = new EstadisticasPersonajes(arielPucheta, 3, 1, 2, 1, 1, ubicacionesUsadas3, ubi1,calKiller)
		
		val ubicacionesUsadas4 = new ArrayList<Ubicacion>
		ubicacionesUsadas4.addAll(Arrays.asList(ubi3, ubi4))
		val estManco = new EstadisticasPersonajes(pabloLescano, 2, 1, 1, 1, 1, ubicacionesUsadas4, ubi1,calManco)
		
		val ubicacionesUsadas5= new ArrayList<Ubicacion>
		ubicacionesUsadas5.addAll(Arrays.asList(ubi4))
		val estNoob = new EstadisticasPersonajes(leoMattioli, 1, 0, 0, 1, 1, ubicacionesUsadas5, ubi1,calNoob)
		
		val est0 = new EstadisticasPersonajes(elPolaco)
		
		//PERSONAJES DE SUPER HIJITUS
		val estadisticasPersonajes = new ArrayList<EstadisticasPersonajes>()
		estadisticasPersonajes.add(estRampage)
		estadisticasPersonajes.add(estDominador)
		estadisticasPersonajes.add(estKiller)
		estadisticasPersonajes.add(estManco)
		estadisticasPersonajes.add(estNoob)
		estadisticasPersonajes.add(est0)
		
		//ESTADISTICAS PERSONAJES NEURUS
		val ubicacionesUsadas6 = new ArrayList<Ubicacion>
		ubicacionesUsadas6.addAll(Arrays.asList(ubi2, ubi2, ubi2, ubi1, ubi4))
		val estDominador6 = new EstadisticasPersonajes(elChelo, 6, 3, 2, 1, 4, ubicacionesUsadas2, ubi1,calDominador)
		
		val ubicacionesUsadas7 = new ArrayList<Ubicacion>
		ubicacionesUsadas7.addAll(Arrays.asList(ubi1, ubi1, ubi1, ubi1, ubi1, ubi1, ubi3))
		val estRampage2 = new EstadisticasPersonajes(javito, 8, 7, 5, 4, 2, ubicacionesUsadas1, ubi1,calRampage)
		
		val ubicacionesUsadas8 = new ArrayList<Ubicacion>
		ubicacionesUsadas8.addAll(Arrays.asList(ubi4))
		val estNoob2 = new EstadisticasPersonajes(arielPucheta, 1, 0, 1, 2, 4, ubicacionesUsadas5, ubi1,calNoob)
		
		val ubicacionesUsadas9 = new ArrayList<Ubicacion>
		ubicacionesUsadas9.addAll(Arrays.asList(ubi3, ubi4))
		val estManco2 = new EstadisticasPersonajes(pabloLescano, 2, 2, 0, 1, 1, ubicacionesUsadas4, ubi1,calManco)
		
		val ubicacionesUsadas10= new ArrayList<Ubicacion>
		ubicacionesUsadas10.addAll(Arrays.asList(ubi1, ubi2, ubi3))
		val estKiller2 = new EstadisticasPersonajes(leoMattioli,3, 1, 2, 1, 5, ubicacionesUsadas3, ubi1,calKiller)
		
		//PERSONAJES DE NEURUS
		val estadisticasPersonajes2 = new ArrayList<EstadisticasPersonajes>()		
		estadisticasPersonajes2.add(estDominador6)
		estadisticasPersonajes2.add(estRampage2)
		estadisticasPersonajes2.add(estNoob2)
		//estadisticasPersonajes2.add(estManco2)
		estadisticasPersonajes2.add(estKiller2)
		
		//ESTADISTICAS PERSONAJES NEURUS
		val ubicacionesUsadas11= new ArrayList<Ubicacion>
		ubicacionesUsadas11.addAll(Arrays.asList(ubi4))
		val estNoob3 = new EstadisticasPersonajes(leoMattioli, 1, 0, 0, 1, 1, ubicacionesUsadas5, ubi1,calNoob)
		
		val ubicacionesUsadas12 = new ArrayList<Ubicacion>
		ubicacionesUsadas12.addAll(Arrays.asList(ubi3, ubi4))
		val estManco3 = new EstadisticasPersonajes(pabloLescano, 2, 1, 1, 1, 1, ubicacionesUsadas4, ubi1,calManco)
		
		val ubicacionesUsadas13 = new ArrayList<Ubicacion>
		ubicacionesUsadas13.addAll(Arrays.asList(ubi2, ubi2, ubi2, ubi3, ubi4))
		val estDominador3 = new EstadisticasPersonajes(javito, 8, 1, 7, 2, 9, ubicacionesUsadas2, ubi1,calDominador)
		
		val ubicacionesUsadas14 = new ArrayList<Ubicacion>
		ubicacionesUsadas14.addAll(Arrays.asList(ubi1, ubi2, ubi4))
		val estKiller3 = new EstadisticasPersonajes(leoMattioli, 3, 2, 1, 0, 8, ubicacionesUsadas3, ubi1,calKiller)

		val ubicacionesUsadas15 = new ArrayList<Ubicacion>
		ubicacionesUsadas15.addAll(Arrays.asList(ubi1, ubi1, ubi1, ubi1, ubi1, ubi1, ubi2))
		val estRampage3 = new EstadisticasPersonajes(elChelo, 9, 8, 1, 6, 4, ubicacionesUsadas1, ubi1,calRampage)
		
		//PERSONAJES DE LARGUIRUCHO
		val estadisticasPersonajes3 = new ArrayList<EstadisticasPersonajes>()		
		estadisticasPersonajes3.add(estNoob3)
		//estadisticasPersonajes3.add(estManco3)
		estadisticasPersonajes3.add(estDominador3)
		estadisticasPersonajes3.add(estKiller3)
		estadisticasPersonajes3.add(estRampage3)
		
		//////////////////////////JUGADOR////////////////////////////
		val Sistema sis = new Sistema()
		val Jugador jugador = new Jugador("Super Hijitus",estadisticasPersonajes)
		jugador.setSistema(sis)
//		COMENTAR PROX LINEA PARA JUGAR CON MrX
//		var Jugador jugador2 = new Jugador("Hernan Caire",estadisticasPersonajes)
		
		val Jugador jugador2 = new Jugador("Neurus",estadisticasPersonajes2)
		jugador2.setSistema(sis)
		
		val Jugador jugador3 = new Jugador("Larguirucho",estadisticasPersonajes3)
		jugador3.setSistema(sis)
		
		//val dummyData = new DummySistema
		val retAppModel = new RetarADueloAppModel(jugador)//dummyData.jugadorPrincipal)
		new RetarADueloWindow(this,retAppModel)
		
	}
	
	def static main(String[] args) {
		new RetarADueloApplication().start
	}
	
}