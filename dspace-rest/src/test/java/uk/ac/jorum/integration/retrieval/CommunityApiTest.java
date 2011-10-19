/**
 * The contents of this file are subject to the license and copyright
 * detailed in the LICENSE and NOTICE files at the root of the source
 * tree and available online at
 *
 * http://www.dspace.org/license/
 */

package uk.ac.jorum.integration.retrieval;
import uk.ac.jorum.integration.RestApiBaseTest;

import org.junit.Test;
import static org.junit.Assert.*;
import static org.junit.matchers.JUnitMatchers.*;

public class CommunityApiTest extends RestApiBaseTest {

  @Test
    public void emptyCommunitiesList() throws Exception {
      loadFixture("emptyDatabase");
      String result = makeRequest("/communities");
      assertThat(result, containsString("\"communities_collection\": [\n\n]}"));
    }
}
