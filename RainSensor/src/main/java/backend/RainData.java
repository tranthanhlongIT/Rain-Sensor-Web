package backend;

import java.sql.*;

public class RainData {
	private int ID;
	private String Raining;
	private int Humidity;
	private String TimeAt;
	
	public int getID() {
		return ID;
	}
	
	public void setID(int iD) {
		ID = iD;
	}
	
	public String getRaining() {
		return Raining;
	}

	public void setRaining(String raining) {
		Raining = raining;
	}

	public int getHumidity() {
		return Humidity;
	}

	public void setHumidity(int humidity) {
		Humidity = humidity;
	}

	public String getTimeAt() {
		return TimeAt;
	}

	public void setTimeAt(String timeAt) {
		TimeAt = timeAt;
	}

	public RainData(int iD, String raining, int humidity, String timeAt) {
		super();
		ID = iD;
		Raining = raining;
		Humidity = humidity;
		TimeAt = timeAt;
	}
	
	public RainData() {
		
	}
}
