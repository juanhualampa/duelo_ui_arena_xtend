package duelo_ui

import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import appModel.RetarADueloAppModel
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.TextBox
import domain.Personaje
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.Button
import domain.Ubicacion
import domain.Jugador
import domain.EstadisticasPersonajes
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.layout.HorizontalLayout

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
		panelIzquierdo.layout = new VerticalLayout()//new ColumnLayout(2)
		this.buscarPersonaje(panelIzquierdo)
		this.createResultsGrid(panelIzquierdo)
		
		val panelCentral = new Panel(paneles)
		panelCentral.layout = new VerticalLayout()
		new Label(panelCentral).setText("No hay personaje seleccionado")
		.bindValueToProperty("personajeSeleccionado")
		
		this.datosPersonaje(panelCentral, this.modelObject.estadisticaPersonajeSeleccionado())
		
		//this.createResultsGrid(mainPanel)
		//this.detallarPersonaje(elegirPersonajePanel, this.modelObject.personajeSeleccionado)
		val panelDerecho = new Panel(paneles)
		panelDerecho.layout = new VerticalLayout()
		
		this.estadisticas(panelDerecho, this.modelObject)
		
	}
	
	def buscarPersonaje(Panel mainPanel) {
		val buscarPanel = new Panel(mainPanel)
		buscarPanel.layout = new ColumnLayout(2)
		
		new Label(buscarPanel).setText("Personaje Buscado");
		
		new TextBox(buscarPanel).bindValueToProperty("personajeABuscar") // Aca habria que usar un transformer,no?
		
	}
	
	
	def datosPersonaje(Panel panel, EstadisticasPersonajes est) {
		val especialidadesPanel = new Panel(panel)
		new Label(especialidadesPanel).setText("Especialidades")
		especialidadesPanel.layout = new VerticalLayout()
		
		new List(especialidadesPanel) => [
            bindItemsToProperty("personajeSeleccionado.especialidades")
            width = 100
            height =100
      ]
      		
		new Label(especialidadesPanel).setText("Debilidades")
		
		
      new List(especialidadesPanel) => [
            bindItemsToProperty("personajeSeleccionado.debilidades")
            width = 100
            height = 100
      ]
      
      new Label(especialidadesPanel).setText("Mejor Posicion")
      
      new List(especialidadesPanel) => [
            bindItemsToProperty("personajeSeleccionado.ubicacionIdeal")
            width = 100
            height = 100
      ]
	}
	
	
	
	def estadisticas(Panel mainPanel, RetarADueloAppModel personaje) {
		val estadisticasPanel = new Panel(mainPanel)
		
		estadisticasPanel.layout = new ColumnLayout(2)
		
		new Label(estadisticasPanel).setText("Jugadas")
		new Label(estadisticasPanel).setText("")
		.bindValueToProperty("estadisticaPersonajeSeleccionado.vecesUsadoAntesDelDuelo")
		
		new Label(estadisticasPanel).setText("Ganadas")
		new Label(estadisticasPanel).setText("")
		.bindValueToProperty("estadisticaPersonajeSeleccionado.vecesQueGanoDuelo")
//		
		new Label(estadisticasPanel).setText("Kills")
		new Label(estadisticasPanel).setText("")
		.bindValueToProperty("estadisticaPersonajeSeleccionado.vecesKills")
//		
		new Label(estadisticasPanel).setText("Deads")
		new Label(estadisticasPanel).setText("")
		.bindValueToProperty("estadisticaPersonajeSeleccionado.vecesDeads")
//		
		new Label(estadisticasPanel).setText("Assists")
		new Label(estadisticasPanel).setText("")
		.bindValueToProperty("estadisticaPersonajeSeleccionado.vecesAssist")
//		
		new Label(estadisticasPanel).setText("Mejor ubicacion")
		new Label(estadisticasPanel).setText("")
		.bindValueToProperty("estadisticaPersonajeSeleccionado.mejorUbicacion")
		
		new Label(estadisticasPanel).setText("Puntaje")
		new Label(estadisticasPanel).setText("")
		.bindValueToProperty("estadisticaPersonajeSeleccionado.calificacion.nro")
		
		
	}
	
	
	def createResultsGrid(Panel panel) {
		val table = new Table<EstadisticasPersonajes>(panel, typeof(EstadisticasPersonajes)) => [
			bindItemsToProperty("personajes")
			bindValueToProperty("personajeSeleccionado")
		]
		
		new Column<EstadisticasPersonajes>(table) => [
			title = "Nombre"
			fixedSize = 50
			bindContentsToProperty("personaje.nombre")
		]
		
		new Column<EstadisticasPersonajes>(table) => [
			title = "Puntaje"
			fixedSize = 30
			bindContentsToProperty("calificacion.nro")
		]
	}
	
	
	override protected addActions(Panel panel) {}
	
	/*
	 
	
	override protected addActions(Panel panel) {
		new Label(panel).setText("JUGAR")
		
		new Button(panel) => [
			caption = "TOP"
			setAsDefault
			onClick [ | this.modelObject.jugador.iniciarDuelo(this.modelObject.personajeSeleccionado,Ubicacion.TOP) ]
		]
		
		new Button(panel) => [
			caption = "BOTTOM"
			setAsDefault
			onClick [ | this.modelObject.jugador.iniciarDuelo(this.modelObject.personajeSeleccionado,Ubicacion.BOTTOM) ]
		]
		
		new Button(panel) => [
			caption = "MIDDLE"
			setAsDefault
			onClick [ | this.modelObject.jugador.iniciarDuelo(this.modelObject.personajeSeleccionado,Ubicacion.MIDDLE) ]
		]
		
		new Button(panel) => [
			caption = "JUNGLE"
			setAsDefault
			onClick [ | this.modelObject.jugador.iniciarDuelo(this.modelObject.personajeSeleccionado,Ubicacion.JUNGLE) ]
		]
	}

* 
*/	
}