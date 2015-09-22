package duelo_ui

import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Button
import appModels.DueloAppModel
import org.uqbar.arena.aop.windows.TransactionalDialog
import appModels.MrxAppModel

class SinRivalWindow extends TransactionalDialog<MrxAppModel>{
	
	new(WindowOwner parent, MrxAppModel model) {
		super(parent, model)
		title = "No tienes Rival!"
	}
	
	override protected addActions(Panel denunciasPanel) {
		
		new Button(denunciasPanel) => [
			caption = "Retar MR-X!!!"
			setAsDefault
			onClick [ | this.displayStatistics]			
		]
		
		new Button(denunciasPanel) => [
			caption = "Descansar en mi gloria"
			onClick [ |  this.cancel]
			
		]
	}
	
	def displayStatistics() {
		val duelo = this.modelObject.realizarDuelo
		this.openDialog(new ResultadoDueloWindow(this,new DueloAppModel(duelo)))
		this.close
	}
	
	def openDialog(SimpleWindow <?> window){
		window.open
	}
	
	override protected createFormPanel(Panel mainPanel) {
		val denunciasPanel = new Panel(mainPanel)
		denunciasPanel.layout = new ColumnLayout(1)
		
		////////////////////////FILA 1 //////////////////////////
		new Label(denunciasPanel).setText("NO HAY QUIEN SE TE ANIME EN TU RANKING ACTUAL!")
	}
	
}