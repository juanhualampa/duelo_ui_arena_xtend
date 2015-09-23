package duelo_ui

import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
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
import domain.NoHayOponenteException
<<<<<<< HEAD
import domain.Duelo
=======
>>>>>>> 7c63b6bfd72015e75048d0c1acedd9e04c675cf7
import duelos.Duelo
import java.awt.Color
import appModels.DueloAppModel
import appModels.PersonajePuntaje
import appModels.MrxAppModel
import appModels.RetarADueloAppModel

class RetarADueloWindow extends SimpleWindow<RetarADueloAppModel>{
	
	new(WindowOwner parent, RetarADueloAppModel model) {
		super(parent, model)
		title = "Duelo App"
		taskDescription  = "Bienvenido: Desde esta página podrás elegir un personaje batirte a duelo con otro jugador"
		minHeight = 500
	}
	
	override protected createFormPanel(Panel mainPanel) {
		crearLabelConColorYTamanio(mainPanel,"Selecciona tu personaje para el duelo",18,Color.WHITE,Color.BLACK)
		new Panel(mainPanel) => [	
			layout = new HorizontalLayout
			width = 900
			crearPanelIzquierdo(it)
			crearPanelCentral(it)
			crearPanelDerecho(it)
		]
	}
	
	def crearPanelIzquierdo(Panel panel) {
		new Panel(panel) =>[
			layout = new VerticalLayout
<<<<<<< HEAD
			width = 300
			this.buscarPersonaje(it)
			this.personajesYPuntaje(it)
=======
		this.buscarPersonaje(it)
		this.personajesYPuntaje(it)
>>>>>>> 7c63b6bfd72015e75048d0c1acedd9e04c675cf7
		]
	}
		
	def crearPanelCentral(Panel panel) {
		new Panel(panel) => [
<<<<<<< HEAD
			layout = new VerticalLayout()
			width = 300
=======
			layout = new VerticalLayout
>>>>>>> 7c63b6bfd72015e75048d0c1acedd9e04c675cf7
			new Label(it).setForeground(Color.BLUE).setFontSize(18).bindValueToProperty("personajeConPuntaje.personaje")
			this.datosPersonaje(it)			
		]
	}
	
	def crearPanelDerecho(Panel panel) {		
		new Panel(panel) => [			
			layout = new VerticalLayout		
<<<<<<< HEAD
			width = 300	
=======
>>>>>>> 7c63b6bfd72015e75048d0c1acedd9e04c675cf7
			new Label(it).setText("STATS").setForeground(Color.BLUE).setFontSize(18)		
			this.estadisticas(it)
			this.botonera(it)
		]
	}
	
	def buscarPersonaje(Panel mainPanel) {
		new Panel(mainPanel) => [
			layout = new ColumnLayout(2)
			width=100
			new Label(it).setText("Personaje Buscado")
			new TextBox(it).bindValueToProperty("personajeABuscar")
		]		
	}
	
	def crearCaracteristicaPersonaje(Panel panel , String titulo , String property){
		new Label(panel).setText(titulo)
		new List(panel) => [
	            bindItemsToProperty(property)
	            width = 100
	        ]
	}
	
	def datosPersonaje(Panel panel) {		
		new Panel(panel) =>[			
			layout = new VerticalLayout
			crearCaracteristicaPersonaje(it ,"Especialidades","personajeConPuntaje.personaje.especialidades")
			crearCaracteristicaPersonaje(it,"Debilidades","personajeConPuntaje.personaje.debilidades")
	        crearLabelConColor(it,"Ubicacion Ideal","personajeConPuntaje.personaje.ubicacionIdeal",Color.WHITE)
		]		
	}
	
	def crearLabelConColor(Panel panel, String texto, String property, Color color) {
		new Label(panel).setText(texto)
	    new Label(panel).setBackground(color).bindValueToProperty(property)
	}	
	
	def crearLabelConColorYTamanio(Panel panel, String texto, int i, Color colorTexto, Color colorFondo ) {
		new Label(panel).setText(texto).setForeground(colorTexto).setBackground(colorFondo).setFontSize(i)
	}
	
	def crearLabel(Panel panel, String texto, String property){
		new Label(panel).setText(texto)
	    new Label(panel).bindValueToProperty(property)
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
			crearLabel(it,"Puntaje","estadisticaPersonajeSeleccionado.calificacion.categoria")
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
			bindEnabledToProperty("eligioPersonaje")
			onClick [ | validar(ubi)]
		]
	}
	
	override protected addActions(Panel panel) {}
	
	def botonera(Panel panel){
		new Label(panel).setText("JUGAR").setForeground(Color.BLUE).setFontSize(18)
		new Panel(panel) =>[
			layout = new ColumnLayout(2)
			this.modelObject.ubicacionesPosibles.forEach[
			crearButtonParaAcciones(panel, it.toString ,it)
			]
		]
	}
	
	def validar(Ubicacion ubicacion) {
		this.modelObject.ubicacionSeleccionada = ubicacion
		try{			
			entroPorqueEncontroRival(modelObject.obtenerDuelo(modelObject.ubicacionSeleccionada))
			}
		catch (NoHayOponenteException e){
			entroPorMrX
		}
	}	
	
	def entroPorqueEncontroRival(Duelo duelo){
		this.openDialog(new ResultadoDueloWindow(this,new DueloAppModel(duelo)))
	}
	
	def entroPorMrX(){
<<<<<<< HEAD
		this.openDialog(new SinRivalWindow(this,new MrxAppModel(this.modelObject.retador,this.modelObject.jugador.sistema)))
=======
		this.openDialog(new SinRivalWindow(this,new MrxAppModel(modelObject.retador,modelObject.sistema)))
>>>>>>> 7c63b6bfd72015e75048d0c1acedd9e04c675cf7
	}	
	
	def openDialog(SimpleWindow <?> window){
		window.open
	}

}