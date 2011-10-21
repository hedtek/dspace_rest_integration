/**
 * The contents of this file are subject to the license and copyright
 * detailed in the LICENSE and NOTICE files at the root of the source
 * tree and available online at
 *
 * http://www.dspace.org/license/
 */

package uk.ac.jorum.integration.retrieval;

import static org.hamcrest.CoreMatchers.equalTo;
import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertThat;
import static org.junit.matchers.JUnitMatchers.containsString;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.junit.Test;

import uk.ac.jorum.integration.RestApiBaseTest;
import static uk.ac.jorum.integration.matchers.ContainsJSONKey.*;

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
	  assertThat("200 is observed behaviour, should really be 204", result, is(equalTo(200)));
  	}

  @Test
	public void communityListWithOneTopLevelCommunityStatusCode() throws Exception{
	  loadFixture("singleTopLevelCommunityDatabase");
	  int result = getResponseCode("/communities", "");
	  assertThat(result, is(equalTo(200)));
	}
  
  @Test
  	public void communityListWithOneTopLevelCommunity() throws Exception {
	  loadFixture("singleTopLevelCommunityDatabase");
	  String result = makeRequest("/communities");
	  JSONObject resultJSON = (JSONObject) JSONValue.parse(result);
	  JSONArray communityList = (JSONArray) resultJSON.get("communities_collection");
	  assertThat(communityList.size(), is(equalTo(1)));
	  
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
  
  @Test
  	public void communityListItemStructure() throws Exception {
	  loadFixture("singleTopLevelCommunityDatabase");
	  String result = makeRequest("/communities");
	  JSONObject resultJSON = (JSONObject) JSONValue.parse(result);
	  JSONArray communityList = (JSONArray) resultJSON.get("communities_collection");
	  JSONObject community = (JSONObject) communityList.get(0);
	  Long two = new Long(2);
	  
	  assertThat(community, containsJSONKey("id", withValue(two)));
	  assertThat(community, containsJSONKey("name", withValue("Community no 1")));
	  assertThat(community, containsJSONKey("introductoryText", withValue("Introductory text for community no 1")));
	  assertThat(community, containsJSONKey("entityReference", withValue("/communities/2")));
	  assertThat(community, containsJSONKey("entityURL", withValue("http://localhost:8080/dspace-rest/communities/2")));
	  assertThat(community, containsJSONKey("parentCommunity", withValue(null)));
	  assertThat(community, containsJSONKey("entityId"));
	  assertThat(community, containsJSONKey("entityTitle"));
  	}
}
