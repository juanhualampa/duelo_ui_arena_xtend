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

class RetarADueloWindow extends SimpleWindow<RetarADueloAppModel>{
	
	new(WindowOwner parent, RetarADueloAppModel model) {
		super(parent, model)
		title = "Bienvenido: Desde esta página podrás elegir un personaje batirte a duelo con otro jugador"
		taskDescription  = "Selecciona tu personaje para el duelo"
	}
	
	
	
	override protected createFormPanel(Panel mainPanel) {
		val elegirPersonajePanel = new Panel(mainPanel)
		elegirPersonajePanel.layout = new ColumnLayout(3)
		
		this.buscarPersonaje(elegirPersonajePanel);
		new Label(elegirPersonajePanel).setText("No hay personaje seleccionado")
		.bindValueToProperty("personajeSeleccionado")
		
		this.createResultsGrid(mainPanel)
		
		this.detallarPersonaje(mainPanel, this.modelObject.personajeSeleccionado)
		
		this.detallarEstadisticas(mainPanel, this.modelObject.personajeSeleccionado)
		
	}
	
	def detallarEstadisticas(Panel mainPanel, Personaje personaje) {
		val estadisticasPanel = new Panel(mainPanel)
		estadisticasPanel.layout = new ColumnLayout(2)
		
//		new Label(estadisticasPanel).setText("Jugadas")
//		new Label(estadisticasPanel).setText("")
//		.bindValueToProperty("estadisticaPersonajeSeleccionado.vecesUsadoAntesDelDuelo")
		
//		new Label(estadisticasPanel).setText("Ganadas")
//		new Label(estadisticasPanel).setText("")
//		.bindValueToProperty("vecesQueGano")
//		
//		new Label(estadisticasPanel).setText("Kills")
//		new Label(estadisticasPanel).setText("")
//		.bindValueToProperty("vecesQueMato")
//		
//		new Label(estadisticasPanel).setText("Deads")
//		new Label(estadisticasPanel).setText("")
//		.bindValueToProperty("vecesDeads")
//		
//		new Label(estadisticasPanel).setText("Assists")
//		new Label(estadisticasPanel).setText("")
//		.bindValueToProperty("vecesAssists")
//		
		new Label(estadisticasPanel).setText("Mejor ubicacion")
		new Label(estadisticasPanel).setText("")
		.bindValueToProperty("personajeSeleccionado.ubicacionIdeal")
		
		new Label(estadisticasPanel).setText("Puntaje")
		new Label(estadisticasPanel).setText("")
		.bindValueToProperty("personajeSeleccionado.puntaje")
		
		
	}
	
	def detallarPersonaje(Panel panel, Personaje personaje) {
		val caracteristicasPanel = new Panel(panel)
		caracteristicasPanel.layout = new ColumnLayout(2)
		
		new Label(caracteristicasPanel).setText("Especialidades")
		
		new Label(caracteristicasPanel).setText("Debilidades")
		
		new List(caracteristicasPanel) => [
            bindItemsToProperty("personajeSeleccionado.especialidades")
            width = 100
            height =100
      ]
      
      new List(caracteristicasPanel) => [
            bindItemsToProperty("personajeSeleccionado.debilidades")
            width = 100
            height = 100
      ]
	}
	
	def createResultsGrid(Panel panel) {
		val table = new Table<Personaje>(panel, typeof(Personaje)) => [
			bindItemsToProperty("personajes")
			bindValueToProperty("personajeSeleccionado")
		]
		this.describeResultsGrid(table)
	}
	
	def describeResultsGrid(Table<Personaje> table) {
		new Column<Personaje>(table) => [
			title = "Nombre"
			fixedSize = 50
			bindContentsToProperty("nombre")
		]
		
		new Column<Personaje>(table) => [
			title = "Puntaje"
			fixedSize = 30
			bindContentsToProperty("puntaje")
		]
	}
	
	def buscarPersonaje(Panel mainPanel) {
		val buscarPanel = new Panel(mainPanel)
		buscarPanel.layout = new ColumnLayout(2)
		
		new Label(buscarPanel).setText("Personaje Buscado");
		
		new TextBox(buscarPanel).bindValueToProperty("personajeABuscar")
		
	}
	
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
	
}