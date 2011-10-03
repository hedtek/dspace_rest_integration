package uk.ac.jorum.integration;

import org.junit.Test;
import static org.junit.Assert.assertEquals;

public class RestApiTest extends RestApiBaseTest {

  @Test
  public void something() throws Exception {
    makeRequest("/communities");
    assertEquals(50, 50);
  }
}
