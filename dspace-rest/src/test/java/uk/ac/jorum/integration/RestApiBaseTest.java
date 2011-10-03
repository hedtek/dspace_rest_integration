package uk.ac.jorum.integration;

import org.junit.Before;
import org.junit.After;

public abstract class RestApiBaseTest {
  @Before
    public void ApiSetup() {
    }

  @After
    public void ApiTeardown(){
    }

  protected String makeRequest(String endpoint) {
    return "";
  }
}
