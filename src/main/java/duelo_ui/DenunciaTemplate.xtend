package duelo_ui

import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import domain.Retador
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.widgets.Button

class DenunciaTemplate extends SimpleWindow<Retador>{
	
	String mensaje
	
	new(WindowOwner owner, Retador retado, String titulo, String msj) {
		super(owner, retado)
		title = titulo
		mensaje = msj
	}
	
	override protected createFormPanel(Panel mainPanel) {
		new Panel(mainPanel) => [
			layout = new ColumnLayout(1)
			new Label(it).setText(mensaje)
		]
	}
	
	override protected addActions(Panel mainPanel) {
		new Button(mainPanel) => [
			caption = "Aceptar"
			setAsDefault
			onClick [ | this.close() ]
		]
	}
	
}