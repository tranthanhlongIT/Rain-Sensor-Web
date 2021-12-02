package backend;

import java.io.IOException;
import javax.ws.rs.container.ContainerRequestContext;
import javax.ws.rs.container.ContainerRequestFilter;
import javax.ws.rs.container.ContainerResponseContext;
import javax.ws.rs.container.ContainerResponseFilter;
import javax.ws.rs.ext.Provider;

@Provider
public class CorsFilterRainData implements ContainerResponseFilter, ContainerRequestFilter {

	@Override
	public void filter(ContainerRequestContext reqContext,
			ContainerResponseContext resContext) throws IOException {
		System.out.println("-- res info --");
		System.out.println("!!!!!!!!!!!! ----------- Filter called!! ");
		resContext.getHeaders().add("Access-Control-Allow-Origin", "*");
		resContext.getHeaders().add("Access-Control-Allow-Headers", "origin, content-type, accept, authorization");
		resContext.getHeaders().add("Access-Control-Allow-Credentials", "true");
		resContext.getHeaders().add("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE, OPTIONS, HEAD");
		resContext.getHeaders().add("Access-Control-Max-Age", "1209600");
	}

	@Override
	public void filter(ContainerRequestContext reqContext) throws IOException {
		System.out.println("-- req info --: " + reqContext);
	}
}
