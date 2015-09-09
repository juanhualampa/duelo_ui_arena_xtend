package duelo_ui

import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import domain.Retador
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.widgets.Button

class DenunciaVerdadera extends SimpleWindow<Retador>{
	
	new(WindowOwner owner, Retador retado) {
		super(owner, retado)
		title = "HEMOS DENUNCIADO A: " + retado.jugador.nombre
	}
	
	override protected createFormPanel(Panel mainPanel) {
		val denunciasPanel = new Panel(mainPanel)
		denunciasPanel.layout = new ColumnLayout(1)
		
		new Label(denunciasPanel).setText("En duelo de leyendas somos partidarios del fair play. Gracias por ayudarnio a mantenernos asi")
	}
	
	override protected addActions(Panel mainPanel) {
		new Button(mainPanel) => [
			caption = "Aceptar"
			setAsDefault
			onClick [ | this.close() ]
		]
	}
	
}