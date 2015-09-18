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
import org.uqbar.arena.bindings.PropertyAdapter
import domain.Motivo

class HacerDenunciaWindow extends SimpleWindow<Denuncia>{
	
	new(WindowOwner parent, Denuncia model) {
		super(parent, model)
		title = "DENUNCIAS"
		taskDescription = "Hacer denuncia"
	}
	
	override protected createFormPanel(Panel mainPanel) {
		new Panel(mainPanel) => [
			layout = new ColumnLayout(2)
			new Label(it).setText("Estas queriendo denunciar a: ")			
			new Label(it).bindValueToProperty("contexto.retado.jugador.nombre")
			
			new Label(it).setText("Motivo: ")	
			new Selector(it) => [
				allowNull = false
				bindItemsToProperty("motivosPosibles").adapter = new PropertyAdapter(Motivo,"nombre")
				//bindItemsToProperty("motivosPosibles")
				bindValueToProperty("unMotivo")
			]
						
			new Label(it).setText("Detalles:")			
			new TextBox(it) => [
				 bindValueToProperty("unaDescripcion.palabras")
				 width = 230
				 height =20
			]
		]
	}
	
	override protected addActions(Panel denunciasPanel) {
		new Button(denunciasPanel) => [
			caption = " Denunciar "
			setAsDefault
			onClick [ | this.generarDenuncia() ]
			
		]		
		new Button(denunciasPanel) => [
			caption = " Cancelar "
			setAsDefault
			onClick [ | this.close() ]
		]	
	}
	
	def generarDenuncia() {
		//chequear que haya seleccionado algo en el Selector
		
		if(this.modelObject.calcularValidez()){
			this.openDialog(new DenunciaVerdadera(this,modelObject.contexto.retado))
		}else{
			this.openDialog(new DenunciaFalsa(this,modelObject.contexto.retador))
		}
	}
	
	def openDialog(SimpleWindow<?> dialog) {
		dialog.open()
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