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
import org.dspace.storage.rdbms.DatabaseManager;
import org.dspace.core.ConfigurationManager;
import org.dspace.browse.IndexBrowse;
import java.io.File;
import java.io.FileReader;

public abstract class RestApiBaseTest {
  private static String apiHost = "localhost";
  private static String apiMountPoint = "/dspace-rest";
  private static String apiProtocol = "http";
  private static int apiPort = 9090;
  private HttpClient client;

  @BeforeClass
    public static void SetupDatabase() throws Exception {
      ConfigurationManager.loadConfig("src/test/resources/config/dspace-integ-testrun.cfg");
      IndexBrowse browse = new IndexBrowse();
      browse.setDelete(true);
      browse.setExecute(true);
      browse.clearDatabase();
      DatabaseManager.loadSql(loadClearSqlFile());

      DatabaseManager.loadSql(loadSqlFile());
      browse = new IndexBrowse();
      browse.setRebuild(true);
      browse.setExecute(true);
      browse.initBrowse();
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

  private static FileReader loadSqlFile() throws Exception {
    return new FileReader(new File("src/test/resources/setup/dspacedb.sql").getCanonicalPath());
  }

  private static FileReader loadClearSqlFile() throws Exception {
    return new FileReader(new File("src/test/resources/setup/cleardb.sql").getCanonicalPath());
  }
}
