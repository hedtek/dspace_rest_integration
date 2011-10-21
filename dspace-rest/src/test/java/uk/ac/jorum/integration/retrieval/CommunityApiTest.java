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

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

public class CommunityApiTest extends RestApiBaseTest {

  @Test
    public void emptyCommunitiesList() throws Exception {
      loadFixture("emptyDatabase");
      String result = makeRequest("/communities");
      assertThat(result, containsString("\"communities_collection\": [\n\n]}"));
    }
  
  @Test
  	public void emptyCommunitiesListStatusCode() throws Exception{
	  loadFixture("emptyDatabase");
	  int result = getResponseCode("/communities", "");
	  assertEquals("200 is observed behaviour, should really be 204", 200, result);
  	}

  @Test
	public void communityListWithOneTopLevelCommunityStatusCode() throws Exception{
	  loadFixture("singleTopLevelCommunityDatabase");
	  int result = getResponseCode("/communities", "");
	  assertEquals(200, result);
	}
  
  @Test
  	public void communityListWithOneTopLevelCommunity() throws Exception {
	  loadFixture("singleTopLevelCommunityDatabase");
	  String result = makeRequest("/communities");
	  JSONObject resultJSON = (JSONObject) JSONValue.parse(result);
	  System.out.println("-------------------" + resultJSON.toJSONString());
	  JSONArray communities = (JSONArray) resultJSON.get("communities_collection");
	  System.out.println("-------------------" + communities.toJSONString());
	  assertEquals(1, communities.size());
	  /*
	   {"entityPrefix": "communities", "communities_collection": [
			{
			  "administrators": null,
			  "canEdit": false,
			  "collections": [],
			  "copyrightText": "Copyright information",
			  "countItems": 0,
			  "handle": "123456789\/1",
			  "id": 1,
			  "introductoryText": "Introductory text for community no 1",
			  "logo": null,
			  "name": "Community no 1",
			  "parentCommunity": null,
			  "recentSubmissions": [],
			  "shortDescription": "Short description of community no 1",
			  "sidebarText": "Side bar text for community 1",
			  "subCommunities": [],
			  "type": 4,
			  "entityReference": "\/communities\/1",
			  "entityURL": "http:\/\/localhost:8080\/rest\/communities\/1",
			  "entityId": "1",
			  "entityTitle": "123456789\/1"
			}
		]}
	   */
  	}
}
