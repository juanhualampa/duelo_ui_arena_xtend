package appModel

import domain.Retador
import domain.Sistema
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class MrxAppModel {
	
	Retador retador	
	Sistema sistema
	
	new(Retador retador, Sistema sis) {
		this.retador = retador
		this.sistema = sis
	}
		
	def realizarDuelo() {
		sistema.realizarDuelo(retador,mrX)
	}
	
	def mrX() {
		sistema.dameAMRX(this.retador)
	}
	
}