package duelo_ui

import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Label
import java.awt.Color
import appModels.DueloAppModel
import org.uqbar.arena.widgets.Button
import org.uqbar.lacar.ui.model.Action
import org.uqbar.arena.actions.MessageSend
import appModels.DenunciaAppModel
import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.layout.HorizontalLayout

class ResultadoDueloWindow extends TransactionalDialog<DueloAppModel>{
	
	new(WindowOwner parent, DueloAppModel duelo) {
		super(parent, duelo)
		title = duelo.nombreRetador + " vs " + duelo.nombreRetado
	}
	
	override protected createFormPanel(Panel mainPanel) {
		new Panel(mainPanel) =>[			
			new Label(it) => [ text = this.modelObject.title fontSize = 18 foreground = Color.CYAN background = Color.ORANGE
			]
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
			new Label(it) => [ text = this.modelObject.copete fontSize = 18  background = Color.ORANGE]
		]
	}
	
	def crearParteIzq(Panel panel) {
		crearParteTemp(panel , "estadisticasRetador", this.modelObject.nombreRetador, this.modelObject.personajeRetador)
//			layout = new HorizontalLayout
	}	
	
	def crearParteDer(Panel panel) {
		crearParteTemp(panel , "estadisticasRetado", this.modelObject.nombreRetado, this.modelObject.personajeRetado)
	}
	
	def crearParteTemp(Panel panel , String estadisticaCorrespondiente, String nombreRet, String nombrePersonaje) {
		new Panel(panel) => [
			layout = new VerticalLayout
			new Label(it) => [ text = nombreRet fontSize = 18 foreground = Color.WHITE background = Color.BLUE]
			new Label(it) => [ text = "Stats - " + nombrePersonaje fontSize = 18  background = Color.WHITE foreground = Color.BLUE]
			new Panel(it) => [
				layout = new ColumnLayout(2)
				crearLabel(it,"Jugadas",estadisticaCorrespondiente +".vecesUsadoAntesDelDuelo")
				crearLabel(it,"Ganadas",estadisticaCorrespondiente +".vecesQueGanoDuelo")
				crearLabel(it,"Kills",estadisticaCorrespondiente + ".vecesKills")
				crearLabel(it,"Deads",estadisticaCorrespondiente + ".vecesDeads")
				crearLabel(it,"Assists",estadisticaCorrespondiente + ".vecesAssist")
				crearLabel(it,"Mejor ubicacion",estadisticaCorrespondiente + ".mejorUbicacion")
				crearLabel(it,"Calificacion",estadisticaCorrespondiente + ".calificacion.categoria")
		]	
		]
	}
	
	def crearLabel(Panel panel, String texto, String property){
		new Label(panel).setText(texto)      
	    new Label(panel) => [
	            bindValueToProperty(property)
	    ]
	}
	
	def crearButtonParaAcciones(Panel panel , String aCaption , Action act){
		new Button(panel) => [
			caption = aCaption
			setAsDefault
			onClick [| act.execute]
		]
	}
	
	override protected addActions(Panel panel) {
		crearButtonParaAcciones(panel,this.modelObject.msj , new MessageSend(this,"cancel"))
		crearButtonParaAcciones(panel," Denunciar Actitud Antideportiva" , new MessageSend(this,"denunciar"))
	}
	
	def denunciar(){
		new HacerDenunciaWindow(this,new DenunciaAppModel(this.modelObject.duelo)).open
	}
	
}