package duelo_ui

import domain.Retador
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Button

class DenunciaFalsa extends SimpleWindow<Retador>{
	
	new(HacerDenunciaWindow window, Retador retador) {
		super(window, retador)
		title = "HAS SIDO SANCIONADO"
	}
	
	override protected addActions(Panel mainPanel) {
		new Button(mainPanel) => [
			caption = "Aceptar"
			setAsDefault
			onClick [ | this.close() ]
		]
	}
	
	override protected createFormPanel(Panel mainPanel) {
		val denunciasPanel = new Panel(mainPanel)
		denunciasPanel.layout = new ColumnLayout(1)
		
		new Label(denunciasPanel).setText("Hemos detectado que tu denuncia no tiene fundamentos solidos")
	}
}