package duelo_ui

import org.uqbar.arena.windows.SimpleWindow
import domain.Retador
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Button
import appModel.MrxAppModel

class SinRivalWindow extends SimpleWindow<MrxAppModel>{
	
	new(WindowOwner parent, MrxAppModel model) {
		super(parent, model)
		title = "No tienes Rival!"
	}
	
	override protected addActions(Panel denunciasPanel) {
		
		new Button(denunciasPanel) => [
			caption = "Retar MR-X!!!"
			setAsDefault
			onClick [ | this.modelObject.realizarDuelo]
			
		]
		
		new Button(denunciasPanel) => [
			caption = "Descansar en mi gloria"
			setAsDefault
			onClick [ |  this.close]
			
		]
	}
	
	override protected createFormPanel(Panel mainPanel) {
		val denunciasPanel = new Panel(mainPanel)
		denunciasPanel.layout = new ColumnLayout(1)
		
		////////////////////////FILA 1 //////////////////////////
		new Label(denunciasPanel).setText("NO HAY QUIEN SE TE ANIME EN TU RANKING ACTUAL!")
	}
	
}