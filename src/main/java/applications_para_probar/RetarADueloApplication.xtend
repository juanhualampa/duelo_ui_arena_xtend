package applications_para_probar

import org.uqbar.arena.Application
import duelo_ui.RetarADueloWindow
import appModel.RetarADueloAppModel
import java.util.List
import domain.Personaje
import java.util.ArrayList
import domain.Jugador

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
		
		///////////////CREO PERSONAJES/////////////////////////
		var Personaje personaje1 = new Personaje("PEPITO1",esp1,deb1);
		
		var Personaje personaje2 = new Personaje("PEPITO2",esp2,deb2);
		
		var Personaje personaje3 = new Personaje("PEPITO3",esp3,deb3);
		
		var Personaje personaje4 = new Personaje("PEPITO4",esp4,deb4);
		
		var Personaje personaje5 = new Personaje("PEPITO5",esp5,deb5);
		
		//////////////////////////JUGADOR////////////////////////////
		var Jugador jugador = new Jugador();
		/////////////////////////////////////////////////////
		
		var List<Personaje> personajes = new ArrayList<Personaje>()
		
		personajes.add(personaje1)
		personajes.add(personaje2)
		personajes.add(personaje3)
		personajes.add(personaje4)
		personajes.add(personaje5)
		
		var RetarADueloAppModel retAppModel = new RetarADueloAppModel(jugador,personajes)
		
		new RetarADueloWindow(this,retAppModel)
	}
	
	def static main(String[] args) {
		new RetarADueloApplication().start
	}
	
}