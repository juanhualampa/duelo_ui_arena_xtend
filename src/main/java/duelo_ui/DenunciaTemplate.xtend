package duelo_ui

import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Button
import domain.Jugador
import java.awt.Color
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.windows.Dialog

class DenunciaTemplate extends Dialog<Jugador>{
	
	String mensaje	
	String titulo
	
	new(WindowOwner owner, Jugador jugador, String titulo, String msj) {
		super(owner, jugador)
		this.titulo = titulo
		mensaje = msj
	}
	
	override protected createFormPanel(Panel mainPanel) {
		new Panel(mainPanel) => [
			layout = new VerticalLayout			
			new Label(it).setText(titulo).setBackground(Color.BLACK).setForeground(Color.WHITE).setFontSize(16)
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