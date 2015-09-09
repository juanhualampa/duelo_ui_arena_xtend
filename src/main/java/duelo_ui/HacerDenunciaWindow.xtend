package duelo_ui

import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import domain.Denuncia
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Selector

class HacerDenunciaWindow extends SimpleWindow<Denuncia>{
	
	new(WindowOwner parent, Denuncia model) {
		super(parent, model)
		title = "DENUNCIAS"
		taskDescription = "Haga sus denuncias"
	}
	
	override protected createFormPanel(Panel mainPanel) {
		val denunciasPanel = new Panel(mainPanel)
		denunciasPanel.layout = new ColumnLayout(2)
		
		////////////////////////FILA 1 //////////////////////////
		new Label(denunciasPanel).setText("Estas queriendo denunciar a: ")
		
		new Label(denunciasPanel).bindValueToProperty("contexto.retado.jugador.nombre")
		
		////////////////////////FILA 2///////////////////////////
		
		new Label(denunciasPanel).setText("Motivo: ")

		new Selector(denunciasPanel) => [
			allowNull = false
			bindItemsToProperty("motivosPosibles")
			bindValueToProperty("unMotivo")
		]
		
		///////////////////////FILA 3///////////////////////////////
		
		new Label(denunciasPanel).setText("Detalles")
		
		new TextBox(denunciasPanel) => [
			 bindValueToProperty("unaDescripcion.palabras")
		]
		
		/////////////////////////////////////////////////////////////////
	}
	
	override protected addActions(Panel denunciasPanel) {
		new Button(denunciasPanel) => [
			caption = "Denunciar"
			setAsDefault
			onClick [ | this.modelObject.castigar ]
			
		]
		
		new Button(denunciasPanel) => [
			caption = "Cancelar"
			setAsDefault
			onClick [ | this.close() ]
		]
	
	}
}

//		new TextBox(editorPanel) => [
//			width = 110
//			withFilter(new DateTextFilter)
//			bindValueToProperty("fecha").transformer = new DateAdapter
//		]

//			new Selector(editorPanel) => [
//			allowNull = false
//			width = 100
//			bindItemsToProperty("tipo.valoresPosibles")
//			bindValueToProperty("valorApostado")			
//		]