package duelo_ui;

import domain.AbusoDeHabilidad;
import domain.Denuncia;
import domain.Descripcion;
import domain.Duelo;
import domain.Jugador;
import domain.Motivo;
import domain.Personaje;
import domain.Retador;
import domain.Sistema;
import domain.Ubicacion;
import duelo_ui.HacerDenunciaWindow;
import org.uqbar.arena.Application;
import org.uqbar.arena.windows.Window;

@SuppressWarnings("all")
public class DueloApplication extends Application {
  @Override
  public Window<?> createMainWindow() {
    HacerDenunciaWindow _xblockexpression = null;
    {
      Sistema sis = new Sistema();
      Personaje per1 = new Personaje();
      Personaje per2 = new Personaje();
      Jugador jugador1 = new Jugador("pepito1");
      Jugador jugador2 = new Jugador("pepito2");
      Ubicacion ubi1 = Ubicacion.TOP;
      Ubicacion ubi2 = Ubicacion.BOTTOM;
      Retador ret1 = new Retador(jugador1, per1, ubi1);
      Retador ret2 = new Retador(jugador2, per2, ubi2);
      Duelo duelo = new Duelo(sis, ret1, ret2);
      Motivo unMotivo = new AbusoDeHabilidad();
      Descripcion unaDescripcion = new Descripcion("denuncio abuso de habilidad");
      Denuncia den = new Denuncia(duelo, unMotivo, unaDescripcion);
      _xblockexpression = new HacerDenunciaWindow(this, den);
    }
    return _xblockexpression;
  }
  
  public static void main(final String[] args) {
    DueloApplication _dueloApplication = new DueloApplication();
    _dueloApplication.start();
  }
}
