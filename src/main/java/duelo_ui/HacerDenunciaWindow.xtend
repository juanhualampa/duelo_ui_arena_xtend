package duelo_ui

import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.bindings.PropertyAdapter
import domain.Motivo
import appModels.DenunciaAppModel
import org.uqbar.arena.layout.HorizontalLayout

class HacerDenunciaWindow extends SimpleWindow<DenunciaAppModel>{
	
	new(WindowOwner parent, DenunciaAppModel model) {
		super(parent, model)
		title = "DENUNCIAS"
		taskDescription = "Hacer denuncia"
	}
	
	override protected createFormPanel(Panel mainPanel) {
		denunciaDisplay(mainPanel)
		botonera(mainPanel)
	}
	
	def denunciaDisplay(Panel panel){
			new Panel(panel) => [
			layout = new ColumnLayout(2)
			new Label(it).setText("Estas queriendo denunciar a: ").setForeground(Color.MAGENTA)		
			new Label(it).bindValueToProperty("denunciado.nombre")
			
			new Label(it).setText("Motivo: ")	
			new Selector(it) => [
				allowNull = false
				bindItemsToProperty("motivosPosibles").adapter = new PropertyAdapter(Motivo,"nombre")
				bindValueToProperty("unMotivo")
			]
						
			new Label(it).setText("Detalles:")			
			new TextBox(it) => [
				 bindValueToProperty("palabrasDescripcion")
				 width = 230
				 height =20
			]
		]
	}
	
	def botonera(Panel panel){
		new Panel(panel) => [
			layout = new HorizontalLayout
			
			new Button(it) => [
			caption = " Denunciar "
			onClick [ | this.generarDenuncia() ]
			bindEnabledToProperty("puedeDenunciar")
			]
			new Button(it) => [
			setAsDefault
			caption = " Cancelar "
			onClick [ | this.close() ]
			]	
		]
	}
	
	def generarDenuncia() {
		//chequear que haya seleccionado algo en el Selector
		this.modelObject.efectivizarDenuncia()	
		if(this.modelObject.calcularValidez())
			this.openDialog(new DenunciaVerdadera(this,modelObject.denunciado))	
		else
			this.openDialog(new DenunciaFalsa(this,modelObject.denunciante))
	}
	
	def openDialog(SimpleWindow<?> dialog) {
		dialog.open()
	}
	
	override protected addActions(Panel denunciasPanel) {
	}
	
}

