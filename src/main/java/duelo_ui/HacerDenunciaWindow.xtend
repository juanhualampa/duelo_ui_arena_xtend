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
import org.uqbar.arena.bindings.NotNullObservable

class HacerDenunciaWindow extends SimpleWindow<DenunciaAppModel>{
	
	new(WindowOwner parent, DenunciaAppModel model) {
		super(parent, model)
		title = "DENUNCIAS"
		taskDescription = "Hacer denuncia"
	}
	
	override protected createFormPanel(Panel mainPanel) {
		new Panel(mainPanel) => [
			layout = new ColumnLayout(2)
			new Label(it).setText("Estas queriendo denunciar a: ")			
			new Label(it).bindValueToProperty("denunciado.nombre")
			
			new Label(it).setText("Motivo: ")	
			new Selector(it) => [
				allowNull = false
				bindItemsToProperty("motivosPosibles").adapter = new PropertyAdapter(Motivo,"nombre")
				//bindItemsToProperty("motivosPosibles")
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
	
	override protected addActions(Panel denunciasPanel) {
		new Button(denunciasPanel) => [
			caption = " Cancelar "
			setAsDefault
			onClick [ | this.close() ]
		]
		new Button(denunciasPanel) => [
			caption = " Denunciar "
			onClick [ | this.generarDenuncia() ]	
			bindEnabled(new NotNullObservable("unMotivo"))
			bindEnabled(new NotNullObservable("palabrasDescripcion"))		
			bindEnabledToProperty("puedeDenunciar")
			disableOnError			
		]		
		
			
	}
	
	def generarDenuncia() {
		//chequear que haya seleccionado algo en el Selector
		this.modelObject.efectivizarDenuncia()	
		if(this.modelObject.calcularValidez())
			{						
				this.openDialog(new DenunciaVerdadera(this,modelObject.denunciado))	
			}
		else
			{
				this.openDialog(new DenunciaFalsa(this,modelObject.denunciado))
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