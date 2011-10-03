package uk.ac.jorum.integration;

import org.junit.Before;
import org.junit.After;
import org.junit.BeforeClass;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.BasicResponseHandler;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.client.utils.URIUtils;
import java.net.URI;

public abstract class RestApiBaseTest {
  private static String apiHost = "localhost";
  private static String apiMountPoint = "/dspace-rest";
  private static String apiProtocol = "http";
  private static int apiPort = 9090;
  private HttpClient client;

  @BeforeClass
    public static void SetupDatabase() {
    }

  @Before
    public void ApiSetup() {
      client = new DefaultHttpClient();
    }

  @After
    public void ApiTeardown(){
      client.getConnectionManager().shutdown();
    }

  protected String makeRequest(String endpoint) throws Exception {
    return makeRequest(endpoint, "");
  }

  protected String makeRequest(String endpoint, String queryString) throws Exception {
    URI uri = URIUtils.createURI(apiProtocol, apiHost, apiPort, apiMountPoint + endpoint, queryString, "");
    ResponseHandler<String> responseHandler = new BasicResponseHandler();
    HttpGet httpget = new HttpGet(uri);
    httpget.addHeader("Accept", "application/json");
    return client.execute(httpget, responseHandler);
  }
}
