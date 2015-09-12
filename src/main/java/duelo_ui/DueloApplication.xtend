package duelo_ui

import domain.Denuncia
import domain.Duelo
import org.uqbar.arena.Application
import domain.Jugador
import domain.Personaje
import domain.Retador
import domain.Ubicacion
import domain.Motivo
import domain.AbusoDeHabilidad
import domain.Descripcion
import domain.Sistema
import domain.Iniciador
import domain.NoIniciador

class DueloApplication extends Application {
	
	
	
	override createMainWindow() {
		
		///////////////SISTEMA/////////////
		
		var Sistema sis = new Sistema();
		//////////////////DUELO////////////////////////////////
		var Ubicacion ubi1 = Ubicacion.TOP;
		var Ubicacion ubi2 = Ubicacion.BOTTOM;
		
		var Personaje per1 = new Personaje("Wolverine","Araniar","La ducha",Ubicacion.BOTTOM);
		var Personaje per2 = new Personaje("Gambito","Tirarte cartitas","Ni idea",Ubicacion.MIDDLE);
			
		
		var Jugador jugador1 = new Jugador("pepito1",sis);
		var Jugador jugador2 = new Jugador("pepito2",sis);
		
		jugador1.personajes.add(per1)
		jugador2.personajes.add(per2)
		
		
		
		var Retador ret1 = new Retador(jugador1, per1,ubi1,new Iniciador());
		var Retador ret2 = new Retador(jugador2, per2, ubi2,new NoIniciador());
		
		
		var Duelo duelo = new Duelo( sis,ret1, ret2);
		// Porque no funciona si hago 
		//var Duelo duelo = new Duelo( ret1, ret2);
		// si dispongo de 2 constructores ?
		//println(duelo.resultado.visualizacion)
		///////////////////////MOTIVO///////////////////////////////
		
		var Motivo unMotivo = new AbusoDeHabilidad();
		/////////////////////////////////////////////////////
		
		var Descripcion unaDescripcion= new Descripcion("denuncio abuso de habilidad");
		
		///////////////////////////////DENUNCIA///////////////////////////
		
		//var Denuncia den = new Denuncia(duelo, unMotivo, unaDescripcion);
		
		var Denuncia den = new Denuncia(duelo, unMotivo, unaDescripcion);
		new HacerDenunciaWindow(this, den)
	}
	
	def static main(String[] args) {
		new DueloApplication().start
	}
}