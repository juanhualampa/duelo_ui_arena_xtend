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
import domain.EstadisticasPersonajes
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.layout.HorizontalLayout
import appModel.PersonajePuntaje
import domain.NoHayOponenteException
import domain.Personaje
import domain.Retador
import domain.Iniciador
import org.uqbar.arena.windows.Dialog
import domain.Resultado
import domain.Duelo
import appModel.MrxAppModel
import org.uqbar.arena.widgets.Selector
import java.awt.Color

class RetarADueloWindow extends SimpleWindow<RetarADueloAppModel>{
	
	new(WindowOwner parent, RetarADueloAppModel model) {
		super(parent, model)
		title = "Duelo App"
		taskDescription  = "Bienvenido: Desde esta página podrás elegir un personaje batirte a duelo con otro jugador"
	}
	
	
	
	override protected createFormPanel(Panel mainPanel) {
		new Label(mainPanel).text = "Selecciona tu personaje para el duelo"
		val paneles = new Panel(mainPanel)
		paneles.layout= new HorizontalLayout()
		
		val panelIzquierdo = new Panel(paneles)
		panelIzquierdo.layout = new VerticalLayout()
		this.buscarPersonaje(panelIzquierdo)
		this.personajesYPuntaje(panelIzquierdo)
		
		val panelCentral = new Panel(paneles)
		panelCentral.layout = new VerticalLayout()
		new Label(panelCentral).setText("No hay personaje seleccionado")
		.bindValueToProperty("personajeConPuntaje.personaje")
		
		this.datosPersonaje(panelCentral, this.modelObject.getEstadisticaPersonajeSeleccionado())
		val panelDerecho = new Panel(paneles)
		panelDerecho.layout = new VerticalLayout()
		
		this.estadisticas(panelDerecho, this.modelObject)
	}
	
	def buscarPersonaje(Panel mainPanel) {
		val buscarPanel = new Panel(mainPanel)
		buscarPanel.layout = new ColumnLayout(2)
		
		new Label(buscarPanel).setText("Personaje Buscado")
		new TextBox(buscarPanel).bindValueToProperty("personajeABuscar") 
		
	}
	
	
	def datosPersonaje(Panel panel, EstadisticasPersonajes est) {
		val especialidadesPanel = new Panel(panel)
		new Label(especialidadesPanel).setText("Especialidades")
		especialidadesPanel.layout = new VerticalLayout()
		
		new List(especialidadesPanel) => [
            bindItemsToProperty("personajeConPuntaje.personaje.especialidades")
            width = 100
            height =100
        ]
      		
	  	new Label(especialidadesPanel).setText("Debilidades")
		
      	new List(especialidadesPanel) => [
            bindItemsToProperty("personajeConPuntaje.personaje.debilidades")
            width = 100
            height = 100
      	]
      
      	new Label(especialidadesPanel).setText("Mejor Posicion")
      
      	new Label(especialidadesPanel) => [
            bindValueToProperty("personajeConPuntaje.personaje.ubicacionIdeal")
            background = Color.white
      	]
	}	
	
	
	def estadisticas(Panel mainPanel, RetarADueloAppModel personaje) {
		val estadisticasPanel = new Panel(mainPanel)
		
		estadisticasPanel.layout = new ColumnLayout(2)
		
		new Label(estadisticasPanel).setText("Jugadas")
		new Label(estadisticasPanel)
		.bindValueToProperty("estadisticaPersonajeSeleccionado.vecesUsadoAntesDelDuelo")
		
		new Label(estadisticasPanel).setText("Ganadas")
		new Label(estadisticasPanel)
		.bindValueToProperty("estadisticaPersonajeSeleccionado.vecesQueGanoDuelo")
//		
		new Label(estadisticasPanel).setText("Kills")
		new Label(estadisticasPanel)
		.bindValueToProperty("estadisticaPersonajeSeleccionado.vecesKills")
//		
		new Label(estadisticasPanel).setText("Deads")
		new Label(estadisticasPanel)
		.bindValueToProperty("estadisticaPersonajeSeleccionado.vecesDeads")
//		
		new Label(estadisticasPanel).setText("Assists")
		new Label(estadisticasPanel)
		.bindValueToProperty("estadisticaPersonajeSeleccionado.vecesAssist")
//		
		new Label(estadisticasPanel).setText("Mejor ubicacion")
		new Label(estadisticasPanel)
		.bindValueToProperty("estadisticaPersonajeSeleccionado.mejorUbicacion")
		
		new Label(estadisticasPanel).setText("Puntaje")
		new Label(estadisticasPanel)
		.bindValueToProperty("estadisticaPersonajeSeleccionado.calificacion.nro")
		
		
	}
		
	def personajesYPuntaje(Panel panel) {
		val table = new Table<PersonajePuntaje>(panel, PersonajePuntaje) => [
			bindItemsToProperty("personajesConPuntaje")
			bindValueToProperty("personajeConPuntaje")
		]
		
		new Column<PersonajePuntaje>(table) => [
			title = "Nombre"
			fixedSize = 50
			bindContentsToProperty("personaje")
		]
		
		new Column<PersonajePuntaje>(table) => [
			title = "Puntaje"
			fixedSize = 30
			bindContentsToProperty("puntaje")
		]
	}
	
	
	override protected addActions(Panel panel) {
		new Label(panel).setText("JUGAR")
		
		new Button(panel) => [
			caption = "TOP"
			setAsDefault
			onClick [ | this.validar(this.modelObject.personajeSeleccionado,Ubicacion.TOP)				
			]
		]
		
		new Button(panel) => [
			caption = "BOTTOM"
			setAsDefault
			onClick [ | this.validar(this.modelObject.personajeSeleccionado,Ubicacion.BOTTOM) ]
		]
		
		new Button(panel) => [
			caption = "MIDDLE"
			setAsDefault
			onClick [ | this.validar(this.modelObject.personajeSeleccionado,Ubicacion.MIDDLE) ]
		]
		
		new Button(panel) => [
			caption = "JUNGLE"
			setAsDefault
			onClick [ | this.validar(this.modelObject.personajeSeleccionado,Ubicacion.JUNGLE) ]
		]
	}
	
	def validar(Personaje personaje, Ubicacion ubicacion) {
		try{
			val Duelo duelo = this.modelObject.jugador.iniciarDuelo(personaje,ubicacion)
			this.openDialog(new ResultadoDueloWindow(this,duelo))
			}
		catch (NoHayOponenteException e){
			this.openDialog(new SinRivalWindow(this,new MrxAppModel (new Retador(this.modelObject.jugador,personaje,ubicacion, new Iniciador),this.modelObject.jugador.sistema)))
		}
	}
	
	def openDialog(SimpleWindow <?> window){
		window.open
	}

}