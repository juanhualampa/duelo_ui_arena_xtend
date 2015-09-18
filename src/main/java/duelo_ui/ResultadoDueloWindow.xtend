package duelo_ui

import org.uqbar.arena.windows.SimpleWindow
import domain.Duelo
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Label
import java.awt.Color
import appModels.DueloAppModel

class ResultadoDueloWindow extends SimpleWindow<DueloAppModel>{
	
	
	new(WindowOwner parent, DueloAppModel duelo) {
		super(parent, duelo)
		title = duelo.nombreRetador + " VS " + duelo.nombreRetador 
	}
	
	override protected createFormPanel(Panel mainPanel) {
		new Panel(mainPanel) =>[			
			new Label(it) => [ text = this.modelObject.visualizateParteSuperior fontSize = 18  background = Color.BLUE]
			crearPanel(mainPanel)
		]
	}
	
	def crearPanel(Panel panel) {
		new Panel(panel)=> [
			layout = new ColumnLayout(2) 
			crearParteIzq(it)
			crearParteDer(it)			
		]
		crearParteInf(panel)
	}
	
	def crearParteInf(Panel panel) {
		new Panel(panel) =>[
			new Label(it) => [ text = this.modelObject.visualizateParteInferior fontSize = 18  background = Color.BLUE]
		]
	}
	
	def crearParteIzq(Panel panel) {
		crearParteTemp(panel , "estadisticasRetador")
	}	
	
	def crearParteDer(Panel panel) {
		crearParteTemp(panel , "estadisticasRetado")
	}
	
	def crearParteTemp(Panel panel , String estadisticaCorrespondiente) {
		new Panel(panel) => [
			layout = new ColumnLayout(2)		
			crearLabel(it,"Jugadas",estadisticaCorrespondiente +".vecesUsadoAntesDelDuelo")
			crearLabel(it,"Ganadas",estadisticaCorrespondiente +".vecesQueGanoDuelo")
			crearLabel(it,"Kills",estadisticaCorrespondiente + ".vecesKills")
			crearLabel(it,"Deads",estadisticaCorrespondiente + ".vecesDeads")
			crearLabel(it,"Assists",estadisticaCorrespondiente + ".vecesAssist")
			crearLabel(it,"Mejor ubicacion",estadisticaCorrespondiente + ".mejorUbicacion")
			crearLabel(it,"Puntaje",estadisticaCorrespondiente + ".calificacion.nro")
		]		
	}
	
	def crearLabel(Panel panel, String texto, String property){
		new Label(panel).setText(texto)      
	    new Label(panel) => [
	            bindValueToProperty(property)
	    ]
	}
	
	
	override protected addActions(Panel arg0) {
		
	}
	
}