package applications_para_probar

import org.uqbar.arena.Application
import duelo_ui.RetarADueloWindow
import appModels.RetarADueloAppModel
import homes.HomeSistema

class RetarADueloApplication extends Application{
	
	override protected createMainWindow() {
		val homeSistema = new HomeSistema
		val retAppModel = new RetarADueloAppModel(homeSistema.jugador)
		new RetarADueloWindow(this,retAppModel)
	}
	
	def static main(String[] args) {
		new RetarADueloApplication().start
	}
	
}