package duelo_ui

import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import appModel.RetarADueloAppModel
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.Button
import domain.Ubicacion
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.layout.HorizontalLayout
import appModel.PersonajePuntaje
import domain.NoHayOponenteException
import domain.Personaje
import domain.Retador
import domain.Iniciador
import domain.Duelo
import appModel.MrxAppModel
import java.awt.Color
import appModels.DueloAppModel

class RetarADueloWindow extends SimpleWindow<RetarADueloAppModel>{
	
	new(WindowOwner parent, RetarADueloAppModel model) {
		super(parent, model)
		title = "Duelo App"
		taskDescription  = "Bienvenido: Desde esta página podrás elegir un personaje batirte a duelo con otro jugador"
	}
	
	override protected createFormPanel(Panel mainPanel) {
		new Label(mainPanel).text = "Selecciona tu personaje para el duelo"		
		new Panel(mainPanel) => [	
			layout = new HorizontalLayout
			crearPanelIzquierdo(it)
			crearPanelCentral(it)
			crearPanelDerecho(it)
		]
	}
	
	def crearPanelDerecho(Panel panel) {
		new Panel(panel) => [
			layout = new VerticalLayout()
			this.estadisticas(it)
		]
	}
	
	def crearPanelCentral(Panel panel) {
		new Panel(panel) => [
			layout = new VerticalLayout()
			new Label(it).setText("No hay personaje seleccionado")
			.bindValueToProperty("personajeConPuntaje.personaje")
			this.datosPersonaje(it)
		]
	}
		
	def crearPanelIzquierdo(Panel panel) {
		new Panel(panel) =>[
			layout = new VerticalLayout()
		this.buscarPersonaje(it)
		this.personajesYPuntaje(it)
		]
	}
	
	def buscarPersonaje(Panel mainPanel) {
		new Panel(mainPanel) => [
			layout = new ColumnLayout(2)
			new Label(it).setText("Personaje Buscado")
			new TextBox(it).bindValueToProperty("personajeABuscar") 
		]		
	}
	
	def crearCaracteristicaPersonaje(Panel panel , String titulo , String property){
		new Label(panel).setText(titulo)
		new List(panel) => [
	            bindItemsToProperty(property)
	            width = 100
	            height =100
	        ]
	}
	
	def datosPersonaje(Panel panel) {		
		new Panel(panel) =>[			
			layout = new VerticalLayout()
			crearCaracteristicaPersonaje(it ,"Especialidades","personajeConPuntaje.personaje.especialidades")
			crearCaracteristicaPersonaje(it,"Debilidades","personajeConPuntaje.personaje.debilidades")
	        crearLabel("Mejor Posicion","personajeConPuntaje.personaje.ubicacionIdeal")
		]		
	}	
	
	def crearLabel(Panel panel, String texto, String property){
		new Label(panel).setText(texto)      
	    new Label(panel) => [
	            bindValueToProperty(property)
	    ]
	}
	
	def estadisticas(Panel mainPanel) {
		new Panel(mainPanel) => [
			layout = new ColumnLayout(2)		
			crearLabel(it,"Jugadas","estadisticaPersonajeSeleccionado.vecesUsadoAntesDelDuelo")
			crearLabel(it,"Ganadas","estadisticaPersonajeSeleccionado.vecesQueGanoDuelo")
			crearLabel(it,"Kills","estadisticaPersonajeSeleccionado.vecesKills")
			crearLabel(it,"Deads","estadisticaPersonajeSeleccionado.vecesDeads")
			crearLabel(it,"Assists","estadisticaPersonajeSeleccionado.vecesAssist")
			crearLabel(it,"Mejor ubicacion","estadisticaPersonajeSeleccionado.mejorUbicacion")
			crearLabel(it,"Puntaje","estadisticaPersonajeSeleccionado.calificacion.nro")
		]		
	}
		
	def personajesYPuntaje(Panel panel) {
		val table = new Table<PersonajePuntaje>(panel, PersonajePuntaje) => [
			bindItemsToProperty("personajesConPuntaje")
			bindValueToProperty("personajeConPuntaje")
		]		
		crearColumna(panel,table,"Nombre",50,"personaje")
		crearColumna(panel,table,"Puntaje",30,"puntaje")
		
	}
		
	def <S> crearColumna(Panel panel, Table<S> table ,String titulo, int size, String property){
		new Column<S>(table) => [
			title = titulo
			fixedSize = size
			bindContentsToProperty(property)
		]
	}
	
	def crearButtonParaAcciones(Panel panel, String aCaption , Ubicacion ubi){
		new Button(panel) => [
			caption = aCaption
			setAsDefault
			onClick [ | this.validar(this.modelObject.personajeSeleccionado,ubi)				
			]
		]
	}
	
	override protected addActions(Panel panel) {
		new Label(panel).setText("JUGAR")
		crearButtonParaAcciones(panel, "TOP" ,Ubicacion.TOP)
		crearButtonParaAcciones(panel, "BOTTOM" ,Ubicacion.BOTTOM)
		crearButtonParaAcciones(panel, "MIDDLE" ,Ubicacion.MIDDLE)
		crearButtonParaAcciones(panel, "JUNGLE" ,Ubicacion.JUNGLE)
	}
	
	def validar(Personaje personaje, Ubicacion ubicacion) {
		try{
			val Duelo duelo = this.modelObject.jugador.iniciarDuelo(personaje,ubicacion)
			this.openDialog(new ResultadoDueloWindow(this,new DueloAppModel(duelo)))
			}
		catch (NoHayOponenteException e){
			this.openDialog(new SinRivalWindow(this,new MrxAppModel (new Retador(this.modelObject.jugador,personaje,ubicacion, new Iniciador),this.modelObject.jugador.sistema)))
		}
	}
	
	def openDialog(SimpleWindow <?> window){
		window.open
	}

}