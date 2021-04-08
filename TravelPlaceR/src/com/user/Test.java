package com.user;

/*

import com.apartmentnotification.model.DirectionResponse;
import java.io.IOException;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.WebTarget;

public class Test {

private static final String BASE_URI = "https://maps.googleapis.com/maps/api";
private static final String API_KEY = "AIzaSyCXnwOwrv_Kt7bkbO5vXtpPelu08yp-3iY";

*//**
	* end point for read distanceMatrix
	*//*
	private WebTarget distanceMatrix;
	
	public Test() {
	Client client = LazySingleton.getClient();
	distanceMatrix = client.target(BASE_URI + "/distancematrix");
	
	}
	
	public DirectionResponse getDirectionInfo(String origins, String destionations) throws IOException {
	return distanceMatrix.path("/json")
	   .queryParam("units", "imperial")
	   .queryParam("origins", origins)
	   .queryParam("destinations", destionations)
	   .queryParam("key", API_KEY)
	   .request()
	   .get()
	   .readEntity(DirectionResponse.class);
	}
	
	public static void main(String[] args) throws IOException {
	Test wc = new Test();
	DirectionResponse direction = wc.getDirectionInfo("Vaidavas 6/3", "Domina Shopping");
	System.out.println("Duration in hours :"+direction.getRows().get(0).getElements().get(0).getDuration().getText());
	System.out.println("Distance  in metr : "+direction.getRows().get(0).getElements().get(0).getDistance().getValue());
	}*/

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class Test {

	public static void main(String[] args) throws IOException, JSONException {
		Test test = new Test();
		String distance = test.getDistance("baramati", "pune");

		System.out.println("ditance " + distance);
	}

	public String getDistance(String source, String destination) throws JSONException, IOException {

	System.out.println("source : "+source+" destination : "+destination);
		
		URL url = new URL("https://maps.googleapis.com/maps/api/distancematrix/json?origins=" + source
				+ "&destinations=" + destination+"");
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		String line, outputString = "";
		BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		while ((line = reader.readLine()) != null) {
			outputString += line;
		}

		System.out.println(outputString);

		/*
		 * String JSON =
		 * "{\"LanguageLevels\":{\"1\":\"Pocz\\u0105tkuj\\u0105cy\",\"2\":\"\\u015arednioZaawansowany\",\"3\":\"Zaawansowany\",\"4\":\"Ekspert\"}}\n";
		 * 
		 * JSONObject jsonObject = new JSONObject(JSON); JSONObject getSth =
		 * jsonObject.getJSONObject("LanguageLevels"); Object level =
		 * getSth.get("2");
		 * 
		 * System.out.println(level);
		 */
		final JSONObject obj = new JSONObject(outputString);
		final JSONArray geodata = obj.getJSONArray("rows");
		final int n = geodata.length();
		String distance = "";
		for (int i = 0; i < n; ++i) {
			final JSONObject person = geodata.getJSONObject(i);
			// System.out.println("duration :" +
			// person.getJSONArray("elements").getJSONObject(0));

			String value = person.getJSONArray("elements").getJSONObject(0).getJSONObject("distance").getString("text");
			// System.out.println(value);

			System.out.println(value.replace("km", "").trim());

			distance = value.replace("km", "").replace("m", "").replace(",","").trim();
		}
		return distance;
	}
}