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
import org.uqbar.arena.layout.HorizontalLayout
import java.awt.Color
import org.apache.commons.lang.StringUtils

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
				//bindItemsToProperty("motivosPosibles")
				bindValueToProperty("unMotivo")
			]
						
			new Label(it).setText("Detalles:")			
			new TextBox(it) => [
				 withFilter [ event | ! StringUtils.isBlank(event.potentialTextResult)]
				 bindValueToProperty("palabrasDescripcion")
				 width = 230
				 height =20
			]
		]
	}
	
	def botonera(Panel panel){
		
		/*
		 * Si usamos este se ve distinto pero funciona"
		 */
//		new Button(panel) => [
//			caption = " Denunciar "
//			
//			onClick [ | this.generarDenuncia() ]
//			
//			//bindEnabled(new NotNullObservable("unMotivo"))
//			//bindEnabled(new NotNullObservable("palabrasDescripcion"))		
//			bindEnabledToProperty("puedeDenunciar")
//		]
//		
//		new Button(panel) => [
//			setAsDefault
//			caption = " Cancelar "
//			onClick [ | this.close() ]
//		]	
				
		new Panel(panel) => [
			layout = new HorizontalLayout
			new Button(it) => [
			caption = " Denunciar "
			
			onClick [ | this.generarDenuncia() ]
			
			//bindEnabled(new NotNullObservable("unMotivo"))
			//bindEnabled(new NotNullObservable("palabrasDescripcion"))		
			bindEnabledToProperty("puedeDenunciar")
			]
			new Button(it) => [
			setAsDefault
			caption = " Cancelar "
			onClick [ | this.close() ]
			]	
		]
	}
	
	override protected addActions(Panel denunciasPanel) {
	}
	
	def generarDenuncia() {
		if(this.modelObject.calcularValidez())
			{						
				this.openDialog(new DenunciaVerdaderaWindow(this,modelObject.denunciado))	
			}
		else
			{
				this.openDialog(new DenunciaFalsaWindow(this,modelObject.denunciado))
			}	
		this.close
	}
	
	def openDialog(SimpleWindow<?> dialog) {
		dialog.open()
	}	
}