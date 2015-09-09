package duelo_ui;

import domain.Denuncia;
import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import org.uqbar.arena.layout.ColumnLayout;
import org.uqbar.arena.widgets.Button;
import org.uqbar.arena.widgets.Label;
import org.uqbar.arena.widgets.Panel;
import org.uqbar.arena.widgets.Selector;
import org.uqbar.arena.widgets.TextBox;
import org.uqbar.arena.windows.SimpleWindow;
import org.uqbar.arena.windows.WindowOwner;
import org.uqbar.lacar.ui.model.Action;
import org.uqbar.lacar.ui.model.ControlBuilder;

@SuppressWarnings("all")
public class HacerDenunciaWindow extends SimpleWindow<Denuncia> {
  public HacerDenunciaWindow(final WindowOwner parent, final Denuncia model) {
    super(parent, model);
    this.setTitle("DENUNCIAS");
    this.setTaskDescription("Haga sus denuncias");
  }
  
  @Override
  protected void createFormPanel(final Panel mainPanel) {
    final Panel denunciasPanel = new Panel(mainPanel);
    ColumnLayout _columnLayout = new ColumnLayout(2);
    denunciasPanel.setLayout(_columnLayout);
    Label _label = new Label(denunciasPanel);
    _label.setText("Estas queriendo denunciar a: ");
    Label _label_1 = new Label(denunciasPanel);
    _label_1.<Object, ControlBuilder>bindValueToProperty("retado.jugador.nombre");
    Label _label_2 = new Label(denunciasPanel);
    _label_2.setText("Motivo: ");
    Selector<Object> _selector = new Selector<Object>(denunciasPanel);
    final Procedure1<Selector<Object>> _function = (Selector<Object> it) -> {
      it.allowNull(false);
      it.bindItemsToProperty("motivosPosibles");
      it.<Object, ControlBuilder>bindValueToProperty("unmotivo");
    };
    ObjectExtensions.<Selector<Object>>operator_doubleArrow(_selector, _function);
    Label _label_3 = new Label(denunciasPanel);
    _label_3.setText("Detalles");
    TextBox _textBox = new TextBox(denunciasPanel);
    final Procedure1<TextBox> _function_1 = (TextBox it) -> {
      it.<Object, ControlBuilder>bindValueToProperty("unaDescripcion.palabras");
    };
    ObjectExtensions.<TextBox>operator_doubleArrow(_textBox, _function_1);
  }
  
  @Override
  protected void addActions(final Panel denunciasPanel) {
    Button _button = new Button(denunciasPanel);
    final Procedure1<Button> _function = (Button it) -> {
      it.setCaption("Denunciar");
      it.setAsDefault();
      final Action _function_1 = () -> {
        Denuncia _modelObject = this.getModelObject();
        _modelObject.castigar();
      };
      it.onClick(_function_1);
    };
    ObjectExtensions.<Button>operator_doubleArrow(_button, _function);
    Button _button_1 = new Button(denunciasPanel);
    final Procedure1<Button> _function_1 = (Button it) -> {
      it.setCaption("Cancelar");
      it.setAsDefault();
      final Action _function_2 = () -> {
        this.close();
      };
      it.onClick(_function_2);
    };
    ObjectExtensions.<Button>operator_doubleArrow(_button_1, _function_1);
  }
}
