package backend;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;
import javax.ws.rs.core.Application;

public class SmartRainDataApplication extends Application {
	public Set<Class<?>> getClasses(){
		return new HashSet<Class<?>> (Arrays.asList(RainDataService.class));
	}
}
