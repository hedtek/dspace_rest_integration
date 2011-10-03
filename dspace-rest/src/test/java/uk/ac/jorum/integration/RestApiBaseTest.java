package uk.ac.jorum.integration;

import org.junit.Before;
import org.junit.After;
import org.junit.BeforeClass;

public abstract class RestApiBaseTest {
  @BeforeClass
    public static void SetupDatabase() {
    }

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
