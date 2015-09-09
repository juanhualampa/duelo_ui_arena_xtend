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

class DueloApplication extends Application {
	
	
	
	override createMainWindow() {
		
		///////////////SISTEMA/////////////
		
		var Sistema sis = new Sistema();
		//////////////////DUELO////////////////////////////////
		var Personaje per1 = new Personaje();
		var Personaje per2 = new Personaje();
		
		var Jugador jugador1 = new Jugador("pepito1");
		var Jugador jugador2 = new Jugador("pepito2");
		
		var Ubicacion ubi1 = Ubicacion.TOP;
		var Ubicacion ubi2 = Ubicacion.JUNGLE;
		
		
		var Retador ret1 = new Retador(jugador1, per1,ubi1);
		var Retador ret2 = new Retador(jugador2, per2, ubi2);
		
		
		var Duelo duelo = new Duelo(sis, ret1, ret2);
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