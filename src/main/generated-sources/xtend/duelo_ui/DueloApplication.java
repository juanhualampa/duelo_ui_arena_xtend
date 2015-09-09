package duelo_ui;

import org.uqbar.arena.Application;
import org.uqbar.arena.windows.Window;

@SuppressWarnings("all")
public class DueloApplication extends Application {
  @Override
  public Window<?> createMainWindow() {
    throw new Error("Unresolved compilation problems:"
      + "\nThe method JUNGLE is undefined for the type DueloApplication"
      + "\nInvalid number of arguments. The constructor Duelo(Retador, Retador) is not applicable for the arguments (Sistema,Retador,Retador)"
      + "\nType mismatch: cannot convert from Sistema to Retador");
  }
  
  public static void main(final String[] args) {
    DueloApplication _dueloApplication = new DueloApplication();
    _dueloApplication.start();
  }
}
