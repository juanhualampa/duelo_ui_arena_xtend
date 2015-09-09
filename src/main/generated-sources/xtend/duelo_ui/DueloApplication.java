package duelo_ui;

import org.uqbar.arena.Application;
import org.uqbar.arena.windows.Window;

@SuppressWarnings("all")
public class DueloApplication extends Application {
  @Override
  public Window<?> createMainWindow() {
    throw new Error("Unresolved compilation problems:"
      + "\nInvalid number of arguments. The constructor Retador() is not applicable for the arguments (Jugador,Personaje,Ubicacion)"
      + "\nInvalid number of arguments. The constructor Retador() is not applicable for the arguments (Jugador,Personaje,Ubicacion)"
      + "\nInvalid number of arguments. The constructor Duelo() is not applicable for the arguments (Sistema,Retador,Retador)");
  }
  
  public static void main(final String[] args) {
    DueloApplication _dueloApplication = new DueloApplication();
    _dueloApplication.start();
  }
}
