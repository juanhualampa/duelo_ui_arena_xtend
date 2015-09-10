package duelo_ui

import org.uqbar.arena.windows.SimpleWindow
import domain.Duelo
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Label

class ResultadoDueloWindow extends SimpleWindow<Duelo>{
	
	new(WindowOwner parent, Duelo duelo) {
		super(parent, duelo)
		title = "Resultado del duelo: " + duelo.retador.jugador.nombre + " VS " + duelo.retado.jugador.nombre 
	}
	
	override protected createFormPanel(Panel mainPanel) {
		val dueloPanel = new Panel(mainPanel)
		dueloPanel.layout = new ColumnLayout(2)
		
		new Label(dueloPanel).setText("");	
	}
	
	override protected addActions(Panel arg0) {
		
	}
	
}